#if defined(ENABLE_DX11) || defined(ENABLE_DX12)

#include <stdint.h>
#include <math.h>

#include <map>
#include <set>
#include <string>

#include <windows.h>
#include <wrl/client.h>
#include <dxgi1_3.h>
#include <versionhelpers.h>

#include <shellscalingapi.h>


#ifndef _LANGUAGE_C
#define _LANGUAGE_C
#endif
#include <PR/gbi.h>

#include "gfx_window_manager_api.h"
#include "gfx_rendering_api.h"
#include "gfx_direct3d_common.h"
#include "gfx_screen_config.h"
#include "gfx_pc.h"

#define DECLARE_GFX_DXGI_FUNCTIONS
#include "gfx_dxgi.h"

#define WINCLASS_NAME L"N64GAME"
#define GFX_API_NAME "DirectX"

#ifdef VERSION_EU
#define FRAME_INTERVAL_US_NUMERATOR 40000
#define FRAME_INTERVAL_US_DENOMINATOR 1
#else
#define FRAME_INTERVAL_US_NUMERATOR 100000
#define FRAME_INTERVAL_US_DENOMINATOR 3
#endif

using namespace Microsoft::WRL; // For ComPtr

static struct {
    HWND h_wnd;
    bool showing_error;
    uint32_t current_width, current_height;
    std::string game_name;

    HMODULE dxgi_module;
    HRESULT (__stdcall *CreateDXGIFactory1)(REFIID riid, void **factory);
    HRESULT (__stdcall *CreateDXGIFactory2)(UINT flags, REFIID iid, void **factory);

    bool process_dpi_awareness_done;

    RECT last_window_rect;
    bool is_full_screen, last_maximized_state;

    ComPtr<IDXGIFactory2> factory;
    ComPtr<IDXGISwapChain1> swap_chain;
    HANDLE waitable_object;
    uint64_t qpc_init, qpc_freq;
    uint64_t frame_timestamp; // in units of 1/FRAME_INTERVAL_US_DENOMINATOR microseconds
    std::map<UINT, DXGI_FRAME_STATISTICS> frame_stats;
    std::set<std::pair<UINT, UINT>> pending_frame_stats;
    bool dropped_frame;
    bool sync_interval_means_frames_to_wait;
    UINT length_in_vsync_frames;

    void (*on_fullscreen_changed)(bool is_now_fullscreen);
    void (*run_one_game_iter)(void);
    bool (*on_key_down)(int scancode);
    bool (*on_key_up)(int scancode);
    void (*on_all_keys_up)(void);
} dxgi;

static void load_dxgi_library(void) {
    dxgi.dxgi_module = LoadLibraryW(L"dxgi.dll");
    *(FARPROC *)&dxgi.CreateDXGIFactory1 = GetProcAddress(dxgi.dxgi_module, "CreateDXGIFactory1");
    *(FARPROC *)&dxgi.CreateDXGIFactory2 = GetProcAddress(dxgi.dxgi_module, "CreateDXGIFactory2");
}

template <typename Fun>
static void run_as_dpi_aware(Fun f) {
    // Make sure Windows 8.1 or newer doesn't upscale/downscale the rendered images.
    // This is an issue on Windows 8.1 and newer where moving around the window
    // between different monitors having different scaling settings will
    // by default result in the DirectX image will also be scaled accordingly.
    // The resulting scale factor is the curent monitor's scale factor divided by
    // the initial monitor's scale factor. Setting per-monitor aware disables scaling.

    // On Windows 10 1607 and later, that is solved by setting the awarenenss per window,
    // which is done by using SetThreadDpiAwarenessContext before and after creating
    // any window. When the message handler runs, the corresponding context also applies.

    // From windef.h, missing in MinGW.
    DECLARE_HANDLE(DPI_AWARENESS_CONTEXT);
    #define DPI_AWARENESS_CONTEXT_UNAWARE               ((DPI_AWARENESS_CONTEXT)-1)
    #define DPI_AWARENESS_CONTEXT_SYSTEM_AWARE          ((DPI_AWARENESS_CONTEXT)-2)
    #define DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE     ((DPI_AWARENESS_CONTEXT)-3)
    #define DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2  ((DPI_AWARENESS_CONTEXT)-4)
    #define DPI_AWARENESS_CONTEXT_UNAWARE_GDISCALED     ((DPI_AWARENESS_CONTEXT)-5)

    DPI_AWARENESS_CONTEXT (WINAPI *SetThreadDpiAwarenessContext)(DPI_AWARENESS_CONTEXT dpiContext);
    *(FARPROC *)&SetThreadDpiAwarenessContext = GetProcAddress(GetModuleHandleW(L"user32.dll"), "SetThreadDpiAwarenessContext");
    DPI_AWARENESS_CONTEXT old_awareness_context;
    if (SetThreadDpiAwarenessContext != nullptr) {
        old_awareness_context = SetThreadDpiAwarenessContext(DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2);
    } else {
        // Solution for Windows 8.1 and newer, but before Windows 10 1607.
        // SetProcessDpiAwareness must be called before any drawing related API is called.
        if (!dxgi.process_dpi_awareness_done) {
            HMODULE shcore_module = LoadLibraryW(L"SHCore.dll");
            if (shcore_module != nullptr) {
                HRESULT (WINAPI *SetProcessDpiAwareness)(PROCESS_DPI_AWARENESS value);
                *(FARPROC *)&SetProcessDpiAwareness = GetProcAddress(shcore_module, "SetProcessDpiAwareness");
                if (SetProcessDpiAwareness != nullptr) {
                    SetProcessDpiAwareness(PROCESS_PER_MONITOR_DPI_AWARE);
                    // Ignore result, will fail if already called or manifest already specifies dpi awareness.
                }
                FreeLibrary(shcore_module);
            }
            dxgi.process_dpi_awareness_done = true;
        }
    }

    f();

    // Restore the old context
    if (SetThreadDpiAwarenessContext != nullptr && old_awareness_context != nullptr) {
        SetThreadDpiAwarenessContext(old_awareness_context);
    }
}

static void toggle_borderless_window_full_screen(bool enable, bool call_callback) {
    // Windows 7 + flip mode + waitable object can't go to exclusive fullscreen,
    // so do borderless instead. If DWM is enabled, this means we get one monitor
    // sync interval of latency extra. On Win 10 however (maybe Win 8 too), due to
    // "fullscreen optimizations" the latency is eliminated.

    if (enable == dxgi.is_full_screen) {
        return;
    }

    if (!enable) {
        RECT r = dxgi.last_window_rect;

        // Set in window mode with the last saved position and size
        SetWindowLongPtr(dxgi.h_wnd, GWL_STYLE, WS_VISIBLE | WS_OVERLAPPEDWINDOW);

        if (dxgi.last_maximized_state) {
            SetWindowPos(dxgi.h_wnd, NULL, 0, 0, 0, 0, SWP_FRAMECHANGED | SWP_NOMOVE | SWP_NOSIZE);
            ShowWindow(dxgi.h_wnd, SW_MAXIMIZE);
        } else {
            SetWindowPos(dxgi.h_wnd, NULL, r.left, r.top, r.right - r.left, r.bottom - r.top, SWP_FRAMECHANGED);
            ShowWindow(dxgi.h_wnd, SW_RESTORE);
        }

        ShowCursor(TRUE);

        dxgi.is_full_screen = false;
    } else {
        // Save if window is maximized or not
        WINDOWPLACEMENT window_placement;
        window_placement.length = sizeof(WINDOWPLACEMENT);
        GetWindowPlacement(dxgi.h_wnd, &window_placement);
        dxgi.last_maximized_state = window_placement.showCmd == SW_SHOWMAXIMIZED;

        // Save window position and size if the window is not maximized
        GetWindowRect(dxgi.h_wnd, &dxgi.last_window_rect);

        // Get in which monitor the window is
        HMONITOR h_monitor = MonitorFromWindow(dxgi.h_wnd, MONITOR_DEFAULTTONEAREST);

        // Get info from that monitor
        MONITORINFOEX monitor_info;
        monitor_info.cbSize = sizeof(MONITORINFOEX);
        GetMonitorInfo(h_monitor, &monitor_info);
        RECT r = monitor_info.rcMonitor;

        // Set borderless full screen to that monitor
        SetWindowLongPtr(dxgi.h_wnd, GWL_STYLE, WS_VISIBLE | WS_POPUP);
        SetWindowPos(dxgi.h_wnd, HWND_TOP, r.left, r.top, r.right - r.left, r.bottom - r.top, SWP_FRAMECHANGED);

        ShowCursor(FALSE);

        dxgi.is_full_screen = true;
    }

    if (dxgi.on_fullscreen_changed != nullptr && call_callback) {
        dxgi.on_fullscreen_changed(enable);
    }
}

static void gfx_dxgi_on_resize(void) {
    if (dxgi.swap_chain.Get() != nullptr) {
        gfx_get_current_rendering_api()->on_resize();

        DXGI_SWAP_CHAIN_DESC1 desc1;
        ThrowIfFailed(dxgi.swap_chain->GetDesc1(&desc1));
        dxgi.current_width = desc1.Width;
        dxgi.current_height = desc1.Height;
    }
}

static void onkeydown(WPARAM w_param, LPARAM l_param) {
    int key = ((l_param >> 16) & 0x1ff);
    if (dxgi.on_key_down != nullptr) {
        dxgi.on_key_down(key);
    }
}
static void onkeyup(WPARAM w_param, LPARAM l_param) {
    int key = ((l_param >> 16) & 0x1ff);
    if (dxgi.on_key_up != nullptr) {
        dxgi.on_key_up(key);
    }
}

static LRESULT CALLBACK gfx_dxgi_wnd_proc(HWND h_wnd, UINT message, WPARAM w_param, LPARAM l_param) {
    switch (message) {
        case WM_SIZE:
            gfx_dxgi_on_resize();
            break;
        case WM_DESTROY:
            exit(0);
        case WM_PAINT:
            if (dxgi.showing_error) {
                return DefWindowProcW(h_wnd, message, w_param, l_param);
            } else {
                if (dxgi.run_one_game_iter != nullptr) {
                    dxgi.run_one_game_iter();
                }
            }
            break;
        case WM_ACTIVATEAPP:
            if (dxgi.on_all_keys_up != nullptr) {
                dxgi.on_all_keys_up();
            }
            break;
        case WM_KEYDOWN:
            onkeydown(w_param, l_param);
            break;
        case WM_KEYUP:
            onkeyup(w_param, l_param);
            break;
        case WM_SYSKEYDOWN:
            if ((w_param == VK_RETURN) && ((l_param & 1 << 30) == 0)) {
                toggle_borderless_window_full_screen(!dxgi.is_full_screen, true);
                break;
            } else {
                return DefWindowProcW(h_wnd, message, w_param, l_param);
            }
        default:
            return DefWindowProcW(h_wnd, message, w_param, l_param);
    }
    return 0;
}

static void gfx_dxgi_init(const char *game_name, bool start_in_fullscreen) {
    LARGE_INTEGER qpc_init, qpc_freq;
    QueryPerformanceCounter(&qpc_init);
    QueryPerformanceFrequency(&qpc_freq);
    dxgi.qpc_init = qpc_init.QuadPart;
    dxgi.qpc_freq = qpc_freq.QuadPart;

    // Prepare window title

    char title[512];
    wchar_t w_title[512];
    int len = sprintf(title, "%s (%s)", game_name, GFX_API_NAME);
    mbstowcs(w_title, title, len + 1);
    dxgi.game_name = game_name;

    // Create window
    WNDCLASSEXW wcex;

    wcex.cbSize = sizeof(WNDCLASSEX);

    wcex.style          = CS_HREDRAW | CS_VREDRAW;
    wcex.lpfnWndProc    = gfx_dxgi_wnd_proc;
    wcex.cbClsExtra     = 0;
    wcex.cbWndExtra     = 0;
    wcex.hInstance      = nullptr;
    wcex.hIcon          = nullptr;
    wcex.hCursor        = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)GetStockObject(BLACK_BRUSH);
    wcex.lpszMenuName   = nullptr;
    wcex.lpszClassName  = WINCLASS_NAME;
    wcex.hIconSm        = nullptr;

    ATOM winclass = RegisterClassExW(&wcex);


    run_as_dpi_aware([&] () {
        // We need to be dpi aware when calculating the size
        RECT wr = {0, 0, DESIRED_SCREEN_WIDTH, DESIRED_SCREEN_HEIGHT};
        AdjustWindowRect(&wr, WS_OVERLAPPEDWINDOW, FALSE);

        dxgi.h_wnd = CreateWindowW(WINCLASS_NAME, w_title, WS_OVERLAPPEDWINDOW,
            CW_USEDEFAULT, 0, wr.right - wr.left, wr.bottom - wr.top, nullptr, nullptr, nullptr, nullptr);
    });

    load_dxgi_library();

    ShowWindow(dxgi.h_wnd, SW_SHOW);
    UpdateWindow(dxgi.h_wnd);

    if (start_in_fullscreen) {
        toggle_borderless_window_full_screen(true, false);
    }
}

static void gfx_dxgi_set_fullscreen_changed_callback(void (*on_fullscreen_changed)(bool is_now_fullscreen)) {
    dxgi.on_fullscreen_changed = on_fullscreen_changed;
}

static void gfx_dxgi_set_fullscreen(bool enable) {
    toggle_borderless_window_full_screen(enable, true);
}

static void gfx_dxgi_set_keyboard_callbacks(bool (*on_key_down)(int scancode), bool (*on_key_up)(int scancode), void (*on_all_keys_up)(void)) {
    dxgi.on_key_down = on_key_down;
    dxgi.on_key_up = on_key_up;
    dxgi.on_all_keys_up = on_all_keys_up;
}

static void gfx_dxgi_main_loop(void (*run_one_game_iter)(void)) {
    dxgi.run_one_game_iter = run_one_game_iter;

    MSG msg;
    while (GetMessage(&msg, nullptr, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
}

static void gfx_dxgi_get_dimensions(uint32_t *width, uint32_t *height) {
    *width = dxgi.current_width;
    *height = dxgi.current_height;
}

static void gfx_dxgi_handle_events(void) {
    /*MSG msg;
    while (PeekMessageW(&msg, nullptr, 0, 0, PM_REMOVE)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }*/
}

static uint64_t qpc_to_us(uint64_t qpc) {
    return qpc / dxgi.qpc_freq * 1000000 + qpc % dxgi.qpc_freq * 1000000 / dxgi.qpc_freq;
}

static bool gfx_dxgi_start_frame(void) {
    DXGI_FRAME_STATISTICS stats;
    if (dxgi.swap_chain->GetFrameStatistics(&stats) == S_OK && (stats.SyncRefreshCount != 0 || stats.SyncQPCTime.QuadPart != 0ULL)) {
        {
            LARGE_INTEGER t0;
            QueryPerformanceCounter(&t0);
            //printf("Get frame stats: %llu\n", (unsigned long long)(t0.QuadPart - dxgi.qpc_init));
        }
        //printf("stats: %u %u %u %u %u %.6f\n", dxgi.pending_frame_stats.rbegin()->first, dxgi.pending_frame_stats.rbegin()->second, stats.PresentCount, stats.PresentRefreshCount, stats.SyncRefreshCount, (double)(stats.SyncQPCTime.QuadPart - dxgi.qpc_init) / dxgi.qpc_freq);
        if (dxgi.frame_stats.empty() || dxgi.frame_stats.rbegin()->second.PresentCount != stats.PresentCount) {
            dxgi.frame_stats.insert(std::make_pair(stats.PresentCount, stats));
        }
        if (dxgi.frame_stats.size() > 3) {
            dxgi.frame_stats.erase(dxgi.frame_stats.begin());
        }
    }
    if (!dxgi.frame_stats.empty()) {
        while (!dxgi.pending_frame_stats.empty() && dxgi.pending_frame_stats.begin()->first < dxgi.frame_stats.rbegin()->first) {
            dxgi.pending_frame_stats.erase(dxgi.pending_frame_stats.begin());
        }
    }
    while (dxgi.pending_frame_stats.size() > 15) {
        // Just make sure the list doesn't grow too large if GetFrameStatistics fails.
        dxgi.pending_frame_stats.erase(dxgi.pending_frame_stats.begin());
    }

    dxgi.frame_timestamp += FRAME_INTERVAL_US_NUMERATOR;

    if (dxgi.frame_stats.size() >= 2) {
        DXGI_FRAME_STATISTICS *first = &dxgi.frame_stats.begin()->second;
        DXGI_FRAME_STATISTICS *last = &dxgi.frame_stats.rbegin()->second;
        uint64_t sync_qpc_diff = last->SyncQPCTime.QuadPart - first->SyncQPCTime.QuadPart;
        UINT sync_vsync_diff = last->SyncRefreshCount - first->SyncRefreshCount;
        UINT present_vsync_diff = last->PresentRefreshCount - first->PresentRefreshCount;
        UINT present_diff = last->PresentCount - first->PresentCount;

        if (sync_vsync_diff == 0) {
            sync_vsync_diff = 1;
        }

        double estimated_vsync_interval = (double)sync_qpc_diff / (double)sync_vsync_diff;
        uint64_t estimated_vsync_interval_us = qpc_to_us(estimated_vsync_interval);
        //printf("Estimated vsync_interval: %d\n", (int)estimated_vsync_interval_us);
        if (estimated_vsync_interval_us < 2 || estimated_vsync_interval_us > 1000000) {
            // Unreasonable, maybe a monitor change
            estimated_vsync_interval_us = 16666;
            estimated_vsync_interval = estimated_vsync_interval_us * dxgi.qpc_freq / 1000000;
        }

        UINT queued_vsyncs = 0;
        bool is_first = true;
        for (const std::pair<UINT, UINT>& p : dxgi.pending_frame_stats) {
            if (is_first && dxgi.sync_interval_means_frames_to_wait) {
                is_first = false;
                continue;
            }
            queued_vsyncs += p.second;
        }

        uint64_t last_frame_present_end_qpc = (last->SyncQPCTime.QuadPart - dxgi.qpc_init) + estimated_vsync_interval * queued_vsyncs;
        uint64_t last_end_us = qpc_to_us(last_frame_present_end_qpc);

        double vsyncs_to_wait = (double)(int64_t)(dxgi.frame_timestamp / FRAME_INTERVAL_US_DENOMINATOR - last_end_us) / estimated_vsync_interval_us;
        //printf("ts: %llu, last_end_us: %llu, Init v: %f\n", dxgi.frame_timestamp / 3, last_end_us, vsyncs_to_wait);

        if (vsyncs_to_wait <= 0) {
            // Too late

            if ((int64_t)(dxgi.frame_timestamp / FRAME_INTERVAL_US_DENOMINATOR - last_end_us) < -66666) {
                // The application must have been paused or similar
                vsyncs_to_wait = round(((double)FRAME_INTERVAL_US_NUMERATOR / FRAME_INTERVAL_US_DENOMINATOR) / estimated_vsync_interval_us);
                if (vsyncs_to_wait < 1) {
                    vsyncs_to_wait = 1;
                }
                dxgi.frame_timestamp = FRAME_INTERVAL_US_DENOMINATOR * (last_end_us + vsyncs_to_wait * estimated_vsync_interval_us);
            } else {
                // Drop frame
                //printf("Dropping frame\n");
                dxgi.dropped_frame = true;
                return false;
            }
        }
        if (floor(vsyncs_to_wait) != vsyncs_to_wait) {
            uint64_t left = last_end_us + floor(vsyncs_to_wait) * estimated_vsync_interval_us;
            uint64_t right = last_end_us + ceil(vsyncs_to_wait) * estimated_vsync_interval_us;
            uint64_t adjusted_desired_time = dxgi.frame_timestamp / FRAME_INTERVAL_US_DENOMINATOR + (last_end_us + (FRAME_INTERVAL_US_NUMERATOR / FRAME_INTERVAL_US_DENOMINATOR) > dxgi.frame_timestamp / FRAME_INTERVAL_US_DENOMINATOR ? 2000 : -2000);
            int64_t diff_left = adjusted_desired_time - left;
            int64_t diff_right = right - adjusted_desired_time;
            if (diff_left < 0) {
                diff_left = -diff_left;
            }
            if (diff_right < 0) {
                diff_right = -diff_right;
            }
            if (diff_left < diff_right) {
                vsyncs_to_wait = floor(vsyncs_to_wait);
            } else {
                vsyncs_to_wait = ceil(vsyncs_to_wait);
            }
            if (vsyncs_to_wait == 0) {
                //printf("vsyncs_to_wait became 0 so dropping frame\n");
                dxgi.dropped_frame = true;
                return false;
            }
        }
        //printf("v: %d\n", (int)vsyncs_to_wait);
        if (vsyncs_to_wait > 4) {
            // Invalid, so change to 4
            vsyncs_to_wait = 4;
        }
        dxgi.length_in_vsync_frames = vsyncs_to_wait;
    } else {
        dxgi.length_in_vsync_frames = 2;
    }

    return true;
}

static void gfx_dxgi_swap_buffers_begin(void) {
    //dxgi.length_in_vsync_frames = 1;
    ThrowIfFailed(dxgi.swap_chain->Present(dxgi.length_in_vsync_frames, 0));
    UINT this_present_id;
    if (dxgi.swap_chain->GetLastPresentCount(&this_present_id) == S_OK) {
        dxgi.pending_frame_stats.insert(std::make_pair(this_present_id, dxgi.length_in_vsync_frames));
    }
    dxgi.dropped_frame = false;
}

static void gfx_dxgi_swap_buffers_end(void) {
    LARGE_INTEGER t0, t1, t2;
    QueryPerformanceCounter(&t0);
    QueryPerformanceCounter(&t1);

    if (!dxgi.dropped_frame) {
        if (dxgi.waitable_object != nullptr) {
            WaitForSingleObject(dxgi.waitable_object, INFINITE);
        }
        // else TODO: maybe sleep until some estimated time the frame will be shown to reduce lag
    }

    DXGI_FRAME_STATISTICS stats;
    dxgi.swap_chain->GetFrameStatistics(&stats);

    QueryPerformanceCounter(&t2);

    dxgi.sync_interval_means_frames_to_wait = dxgi.pending_frame_stats.rbegin()->first == stats.PresentCount;

    //printf("done %llu gpu:%d wait:%d freed:%llu frame:%u %u monitor:%u t:%llu\n", (unsigned long long)(t0.QuadPart - dxgi.qpc_init), (int)(t1.QuadPart - t0.QuadPart), (int)(t2.QuadPart - t0.QuadPart), (unsigned long long)(t2.QuadPart - dxgi.qpc_init), dxgi.pending_frame_stats.rbegin()->first, stats.PresentCount, stats.SyncRefreshCount, (unsigned long long)(stats.SyncQPCTime.QuadPart - dxgi.qpc_init));
}

static double gfx_dxgi_get_time(void) {
    LARGE_INTEGER t;
    QueryPerformanceCounter(&t);
    return (double)(t.QuadPart - dxgi.qpc_init) / dxgi.qpc_freq;
}

void gfx_dxgi_create_factory_and_device(bool debug, int d3d_version, bool (*create_device_fn)(IDXGIAdapter1 *adapter, bool test_only)) {
    if (dxgi.CreateDXGIFactory2 != nullptr) {
        ThrowIfFailed(dxgi.CreateDXGIFactory2(debug ? DXGI_CREATE_FACTORY_DEBUG : 0, __uuidof(IDXGIFactory2), &dxgi.factory));
    } else {
        ThrowIfFailed(dxgi.CreateDXGIFactory1(__uuidof(IDXGIFactory2), &dxgi.factory));
    }

    ComPtr<IDXGIAdapter1> adapter;
    for (UINT i = 0; dxgi.factory->EnumAdapters1(i, &adapter) != DXGI_ERROR_NOT_FOUND; i++) {
        DXGI_ADAPTER_DESC1 desc;
        adapter->GetDesc1(&desc);
        if (desc.Flags & 2/*DXGI_ADAPTER_FLAG_SOFTWARE*/) { // declaration missing in mingw headers
            continue;
        }
        if (create_device_fn(adapter.Get(), true)) {
            break;
        }
    }
    create_device_fn(adapter.Get(), false);

    char title[512];
    wchar_t w_title[512];
    int len = sprintf(title, "%s (Direct3D %d)", dxgi.game_name.c_str(), d3d_version);
    mbstowcs(w_title, title, len + 1);
    SetWindowTextW(dxgi.h_wnd, w_title);
}

ComPtr<IDXGISwapChain1> gfx_dxgi_create_swap_chain(IUnknown *device) {
    bool win8 = IsWindows8OrGreater(); // DXGI_SCALING_NONE is only supported on Win8 and beyond
    bool dxgi_13 = dxgi.CreateDXGIFactory2 != nullptr; // DXGI 1.3 introduced waitable object

    DXGI_SWAP_CHAIN_DESC1 swap_chain_desc = {};
    swap_chain_desc.BufferCount = 2;
    swap_chain_desc.Width = 0;
    swap_chain_desc.Height = 0;
    swap_chain_desc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
    swap_chain_desc.BufferUsage = DXGI_USAGE_RENDER_TARGET_OUTPUT;
    swap_chain_desc.Scaling = win8 ? DXGI_SCALING_NONE : DXGI_SCALING_STRETCH;
    swap_chain_desc.SwapEffect = DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL; // Apparently this was backported to Win 7 Platform Update
    swap_chain_desc.Flags = dxgi_13 ? DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT : 0;
    swap_chain_desc.SampleDesc.Count = 1;

    run_as_dpi_aware([&] () {
        // When setting size for the buffers, the values that DXGI puts into the desc (that can later be retrieved by GetDesc1)
        // have been divided by the current scaling factor. By making this call dpi aware, no division will be performed.
        // The same goes for IDXGISwapChain::ResizeBuffers(), however that function is currently only called from the message handler.
        ThrowIfFailed(dxgi.factory->CreateSwapChainForHwnd(device, dxgi.h_wnd, &swap_chain_desc, nullptr, nullptr, &dxgi.swap_chain));
    });
    ThrowIfFailed(dxgi.factory->MakeWindowAssociation(dxgi.h_wnd, DXGI_MWA_NO_ALT_ENTER));

    ComPtr<IDXGISwapChain2> swap_chain2;
    if (dxgi.swap_chain->QueryInterface(__uuidof(IDXGISwapChain2), &swap_chain2) == S_OK) {
        ThrowIfFailed(swap_chain2->SetMaximumFrameLatency(1));
        dxgi.waitable_object = swap_chain2->GetFrameLatencyWaitableObject();
        WaitForSingleObject(dxgi.waitable_object, INFINITE);
    } else {
        ComPtr<IDXGIDevice1> device1;
        ThrowIfFailed(device->QueryInterface(IID_PPV_ARGS(&device1)));
        ThrowIfFailed(device1->SetMaximumFrameLatency(1));
    }

    ThrowIfFailed(dxgi.swap_chain->GetDesc1(&swap_chain_desc));
    dxgi.current_width = swap_chain_desc.Width;
    dxgi.current_height = swap_chain_desc.Height;

    return dxgi.swap_chain;
}

HWND gfx_dxgi_get_h_wnd(void) {
    return dxgi.h_wnd;
}

void ThrowIfFailed(HRESULT res) {
    if (FAILED(res)) {
        fprintf(stderr, "Error: 0x%08X\n", res);
        throw res;
    }
}

void ThrowIfFailed(HRESULT res, HWND h_wnd, const char *message) {
    if (FAILED(res)) {
        char full_message[256];
        sprintf(full_message, "%s\n\nHRESULT: 0x%08X", message, res);
        dxgi.showing_error = true;
        MessageBox(h_wnd, full_message, "Error", MB_OK | MB_ICONERROR);
        throw res;
    }
}

struct GfxWindowManagerAPI gfx_dxgi_api = {
    gfx_dxgi_init,
    gfx_dxgi_set_keyboard_callbacks,
    gfx_dxgi_set_fullscreen_changed_callback,
    gfx_dxgi_set_fullscreen,
    gfx_dxgi_main_loop,
    gfx_dxgi_get_dimensions,
    gfx_dxgi_handle_events,
    gfx_dxgi_start_frame,
    gfx_dxgi_swap_buffers_begin,
    gfx_dxgi_swap_buffers_end,
    gfx_dxgi_get_time,
};

#endif
