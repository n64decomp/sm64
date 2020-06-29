#ifdef ENABLE_DX12

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>

#include <map>
#include <set>
#include <vector>

#include <windows.h>
#include <wrl/client.h>

// This is needed when compiling with MinGW, used in d3d12.h
#define __in_ecount_opt(size)

#include <dxgi.h>
#include <dxgi1_4.h>
#include "dxsdk/d3d12.h"
#include <d3dcompiler.h>

#include "gfx_direct3d12_guids.h"

#include "dxsdk/d3dx12.h"

#ifndef _LANGUAGE_C
#define _LANGUAGE_C
#endif
#include <PR/gbi.h>

#define DECLARE_GFX_DXGI_FUNCTIONS
#include "gfx_dxgi.h"

#include "gfx_cc.h"
#include "gfx_window_manager_api.h"
#include "gfx_rendering_api.h"
#include "gfx_direct3d_common.h"

#include "gfx_screen_config.h"

#define DEBUG_D3D 0

using namespace Microsoft::WRL; // For ComPtr

namespace {

struct ShaderProgramD3D12 {
    uint32_t shader_id;
    uint8_t num_inputs;
    bool used_textures[2];
    uint8_t num_floats;
    uint8_t num_attribs;
    
    ComPtr<ID3DBlob> vertex_shader;
    ComPtr<ID3DBlob> pixel_shader;
    ComPtr<ID3D12RootSignature> root_signature;
};

struct PipelineDesc {
    uint32_t shader_id;
    bool depth_test;
    bool depth_mask;
    bool zmode_decal;
    bool _padding;
    
    bool operator==(const PipelineDesc& o) const {
        return memcmp(this, &o, sizeof(*this)) == 0;
    }
    
    bool operator<(const PipelineDesc& o) const {
        return memcmp(this, &o, sizeof(*this)) < 0;
    }
};

struct TextureHeap {
    ComPtr<ID3D12Heap> heap;
    std::vector<uint8_t> free_list;
};

struct TextureData {
    ComPtr<ID3D12Resource> resource;
    struct TextureHeap *heap;
    uint8_t heap_offset;
    
    uint64_t last_frame_counter;
    uint32_t descriptor_index;
    int sampler_parameters;
};

struct NoiseCB {
    uint32_t noise_frame;
    float noise_scale_x;
    float noise_scale_y;
    uint32_t padding;
};

static struct {
    HMODULE d3d12_module;
    PFN_D3D12_CREATE_DEVICE D3D12CreateDevice;
    PFN_D3D12_GET_DEBUG_INTERFACE D3D12GetDebugInterface;
    
    HMODULE d3dcompiler_module;
    pD3DCompile D3DCompile;
    
    struct ShaderProgramD3D12 shader_program_pool[64];
    uint8_t shader_program_pool_size;
    
    uint32_t current_width, current_height;
    
    ComPtr<ID3D12Device> device;
    ComPtr<ID3D12CommandQueue> command_queue;
    ComPtr<ID3D12CommandQueue> copy_command_queue;
    ComPtr<IDXGISwapChain3> swap_chain;
    ComPtr<ID3D12DescriptorHeap> rtv_heap;
    UINT rtv_descriptor_size;
    ComPtr<ID3D12Resource> render_targets[2];
    ComPtr<ID3D12CommandAllocator> command_allocator;
    ComPtr<ID3D12CommandAllocator> copy_command_allocator;
    ComPtr<ID3D12GraphicsCommandList> command_list;
    ComPtr<ID3D12GraphicsCommandList> copy_command_list;
    ComPtr<ID3D12DescriptorHeap> dsv_heap;
    ComPtr<ID3D12Resource> depth_stencil_buffer;
    ComPtr<ID3D12DescriptorHeap> srv_heap;
    UINT srv_descriptor_size;
    ComPtr<ID3D12DescriptorHeap> sampler_heap;
    UINT sampler_descriptor_size;
    
    std::map<std::pair<uint32_t, uint32_t>, std::list<struct TextureHeap>> texture_heaps;
    
    std::map<size_t, std::vector<ComPtr<ID3D12Resource>>> upload_heaps;
    std::vector<std::pair<size_t, ComPtr<ID3D12Resource>>> upload_heaps_in_flight;
    ComPtr<ID3D12Fence> copy_fence;
    uint64_t copy_fence_value;
    
    std::vector<struct TextureData> textures;
    int current_tile;
    uint32_t current_texture_ids[2];
    uint32_t srv_pos;

    int frame_index;
    ComPtr<ID3D12Fence> fence;
    HANDLE fence_event;
    
    uint64_t frame_counter;
    
    ComPtr<ID3D12Resource> noise_cb;
    void *mapped_noise_cb_address;
    struct NoiseCB noise_cb_data;
    
    ComPtr<ID3D12Resource> vertex_buffer;
    void *mapped_vbuf_address;
    int vbuf_pos;
    
    std::vector<ComPtr<ID3D12Resource>> resources_to_clean_at_end_of_frame;
    std::vector<std::pair<struct TextureHeap *, uint8_t>> texture_heap_allocations_to_reclaim_at_end_of_frame;
    
    std::map<PipelineDesc, ComPtr<ID3D12PipelineState>> pipeline_states;
    bool must_reload_pipeline;
    
    // Current state:
    ID3D12PipelineState *pipeline_state;
    struct ShaderProgramD3D12 *shader_program;
    bool depth_test;
    bool depth_mask;
    bool zmode_decal;
    
    CD3DX12_VIEWPORT viewport;
    CD3DX12_RECT scissor;
} d3d;

static int texture_uploads = 0;
static int max_texture_uploads;

static D3D12_CPU_DESCRIPTOR_HANDLE get_cpu_descriptor_handle(ComPtr<ID3D12DescriptorHeap>& heap) {
#ifdef __MINGW32__
    // We would like to do this:
    // D3D12_CPU_DESCRIPTOR_HANDLE handle = heap->GetCPUDescriptorHandleForHeapStart();
    // but MinGW64 doesn't follow the calling conventions of VC++ for some reason.
    // Per MS documentation "User-defined types can be returned by value from global functions and static member functions"...
    // "Otherwise, the caller assumes the responsibility of allocating memory and passing a pointer for the return value as the first argument".
    // The method here is a non-static member function, and hence we need to pass the address to the return value as a parameter.
    // MinGW32 has the same issue.
    auto fn = heap->GetCPUDescriptorHandleForHeapStart;
    void (STDMETHODCALLTYPE ID3D12DescriptorHeap::*fun)(D3D12_CPU_DESCRIPTOR_HANDLE *out) = (void (STDMETHODCALLTYPE ID3D12DescriptorHeap::*)(D3D12_CPU_DESCRIPTOR_HANDLE *out))fn;
    D3D12_CPU_DESCRIPTOR_HANDLE handle;
    (heap.Get()->*fun)(&handle);
    return handle;
#else
    return heap->GetCPUDescriptorHandleForHeapStart();
#endif
}

static D3D12_GPU_DESCRIPTOR_HANDLE get_gpu_descriptor_handle(ComPtr<ID3D12DescriptorHeap>& heap) {
#ifdef __MINGW32__
    // See get_cpu_descriptor_handle
    auto fn = heap->GetGPUDescriptorHandleForHeapStart;
    void (STDMETHODCALLTYPE ID3D12DescriptorHeap::*fun)(D3D12_GPU_DESCRIPTOR_HANDLE *out) = (void (STDMETHODCALLTYPE ID3D12DescriptorHeap::*)(D3D12_GPU_DESCRIPTOR_HANDLE *out))fn;
    D3D12_GPU_DESCRIPTOR_HANDLE handle;
    (heap.Get()->*fun)(&handle);
    return handle;
#else
    return heap->GetGPUDescriptorHandleForHeapStart();
#endif
}

static D3D12_RESOURCE_ALLOCATION_INFO get_resource_allocation_info(const D3D12_RESOURCE_DESC *resource_desc) {
#ifdef __MINGW32__
    // See get_cpu_descriptor_handle
    auto fn = d3d.device->GetResourceAllocationInfo;
    void (STDMETHODCALLTYPE ID3D12Device::*fun)(D3D12_RESOURCE_ALLOCATION_INFO *out, UINT visibleMask, UINT numResourceDescs, const D3D12_RESOURCE_DESC *pResourceDescs) =
    (void (STDMETHODCALLTYPE ID3D12Device::*)(D3D12_RESOURCE_ALLOCATION_INFO *out, UINT visibleMask, UINT numResourceDescs, const D3D12_RESOURCE_DESC *pResourceDescs))fn;
    D3D12_RESOURCE_ALLOCATION_INFO out;
    (d3d.device.Get()->*fun)(&out, 0, 1, resource_desc);
    return out;
#else
    return d3d.device->GetResourceAllocationInfo(0, 1, resource_desc);
#endif
}

static bool gfx_direct3d12_z_is_from_0_to_1(void) {
    return true;
}

static void gfx_direct3d12_unload_shader(struct ShaderProgram *old_prg) {
}

static void gfx_direct3d12_load_shader(struct ShaderProgram *new_prg) {
    d3d.shader_program = (struct ShaderProgramD3D12 *)new_prg;
    d3d.must_reload_pipeline = true;
}

static struct ShaderProgram *gfx_direct3d12_create_and_load_new_shader(uint32_t shader_id) {
    /*static FILE *fp;
    if (!fp) {
        fp = fopen("shaders.txt", "w");
    }
    fprintf(fp, "0x%08x\n", shader_id);
    fflush(fp);*/
    
    struct ShaderProgramD3D12 *prg = &d3d.shader_program_pool[d3d.shader_program_pool_size++];
    
    CCFeatures cc_features;
    gfx_cc_get_features(shader_id, &cc_features);
    
    char buf[2048];
    size_t len, num_floats;
    
    gfx_direct3d_common_build_shader(buf, len, num_floats, cc_features, true, false);
    
    //fwrite(buf, 1, len, stdout);
    
    ThrowIfFailed(d3d.D3DCompile(buf, len, nullptr, nullptr, nullptr, "VSMain", "vs_5_1", D3DCOMPILE_OPTIMIZATION_LEVEL3, 0, &prg->vertex_shader, nullptr));
    ThrowIfFailed(d3d.D3DCompile(buf, len, nullptr, nullptr, nullptr, "PSMain", "ps_5_1", D3DCOMPILE_OPTIMIZATION_LEVEL3, 0, &prg->pixel_shader, nullptr));
    
    ThrowIfFailed(d3d.device->CreateRootSignature(0, prg->pixel_shader->GetBufferPointer(), prg->pixel_shader->GetBufferSize(), IID_PPV_ARGS(&prg->root_signature)));
    
    prg->shader_id = shader_id;
    prg->num_inputs = cc_features.num_inputs;
    prg->used_textures[0] = cc_features.used_textures[0];
    prg->used_textures[1] = cc_features.used_textures[1];
    prg->num_floats = num_floats;
    //prg->num_attribs = cnt;
    
    d3d.must_reload_pipeline = true;
    return (struct ShaderProgram *)(d3d.shader_program = prg);
}

static struct ShaderProgram *gfx_direct3d12_lookup_shader(uint32_t shader_id) {
    for (size_t i = 0; i < d3d.shader_program_pool_size; i++) {
        if (d3d.shader_program_pool[i].shader_id == shader_id) {
            return (struct ShaderProgram *)&d3d.shader_program_pool[i];
        }
    }
    return nullptr;
}

static void gfx_direct3d12_shader_get_info(struct ShaderProgram *prg, uint8_t *num_inputs, bool used_textures[2]) {
    struct ShaderProgramD3D12 *p = (struct ShaderProgramD3D12 *)prg;
    
    *num_inputs = p->num_inputs;
    used_textures[0] = p->used_textures[0];
    used_textures[1] = p->used_textures[1];
}

static uint32_t gfx_direct3d12_new_texture(void) {
    d3d.textures.resize(d3d.textures.size() + 1);
    return (uint32_t)(d3d.textures.size() - 1);
}

static void gfx_direct3d12_select_texture(int tile, uint32_t texture_id) {
    d3d.current_tile = tile;
    d3d.current_texture_ids[tile] = texture_id;
}

static void gfx_direct3d12_upload_texture(const uint8_t *rgba32_buf, int width, int height) {
    texture_uploads++;
    
    ComPtr<ID3D12Resource> texture_resource;
    
    // Describe and create a Texture2D.
    D3D12_RESOURCE_DESC texture_desc = {};
    texture_desc.MipLevels = 1;
    texture_desc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
    texture_desc.Width = width;
    texture_desc.Height = height;
    texture_desc.Flags = D3D12_RESOURCE_FLAG_NONE;
    texture_desc.DepthOrArraySize = 1;
    texture_desc.SampleDesc.Count = 1;
    texture_desc.SampleDesc.Quality = 0;
    texture_desc.Dimension = D3D12_RESOURCE_DIMENSION_TEXTURE2D;
    texture_desc.Alignment = ((width + 31) / 32) * ((height + 31) / 32) > 16 ? 0 : D3D12_SMALL_RESOURCE_PLACEMENT_ALIGNMENT;
    
    D3D12_RESOURCE_ALLOCATION_INFO alloc_info = get_resource_allocation_info(&texture_desc);
    
    std::list<struct TextureHeap>& heaps = d3d.texture_heaps[std::pair<uint32_t, uint32_t>(alloc_info.SizeInBytes, alloc_info.Alignment)];
    
    struct TextureHeap *found_heap = nullptr;
    for (struct TextureHeap& heap : heaps) {
        if (!heap.free_list.empty()) {
            found_heap = &heap;
        }
    }
    if (found_heap == nullptr) {
        heaps.resize(heaps.size() + 1);
        found_heap = &heaps.back();
        
        // In case of HD textures, make sure too much memory isn't wasted
        int textures_per_heap = 524288 / alloc_info.SizeInBytes;
        if (textures_per_heap < 1) {
            textures_per_heap = 1;
        } else if (textures_per_heap > 64) {
            textures_per_heap = 64;
        }
        
        D3D12_HEAP_DESC heap_desc = {};
        heap_desc.SizeInBytes = alloc_info.SizeInBytes * textures_per_heap;
        if (alloc_info.Alignment == D3D12_SMALL_RESOURCE_PLACEMENT_ALIGNMENT) {
            heap_desc.Alignment = D3D12_DEFAULT_RESOURCE_PLACEMENT_ALIGNMENT;
        } else {
            heap_desc.Alignment = alloc_info.Alignment;
        }
        heap_desc.Properties.CPUPageProperty = D3D12_CPU_PAGE_PROPERTY_UNKNOWN;
        heap_desc.Properties.MemoryPoolPreference = D3D12_MEMORY_POOL_UNKNOWN;
        heap_desc.Properties.Type = D3D12_HEAP_TYPE_DEFAULT;
        heap_desc.Flags = D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES;
        ThrowIfFailed(d3d.device->CreateHeap(&heap_desc, IID_PPV_ARGS(&found_heap->heap)));
        for (int i = 0; i < textures_per_heap; i++) {
            found_heap->free_list.push_back(i);
        }
    }
    
    uint8_t heap_offset = found_heap->free_list.back();
    found_heap->free_list.pop_back();
    ThrowIfFailed(d3d.device->CreatePlacedResource(found_heap->heap.Get(), heap_offset * alloc_info.SizeInBytes, &texture_desc, D3D12_RESOURCE_STATE_COPY_DEST, nullptr, IID_PPV_ARGS(&texture_resource)));
    
    D3D12_PLACED_SUBRESOURCE_FOOTPRINT layout;
    UINT num_rows;
    UINT64 row_size_in_bytes;
    UINT64 upload_buffer_size;
    d3d.device->GetCopyableFootprints(&texture_desc, 0, 1, 0, &layout, &num_rows, &row_size_in_bytes, &upload_buffer_size);
    
    std::vector<ComPtr<ID3D12Resource>>& upload_heaps = d3d.upload_heaps[upload_buffer_size];
    ComPtr<ID3D12Resource> upload_heap;
    if (upload_heaps.empty()) {
        CD3DX12_HEAP_PROPERTIES hp(D3D12_HEAP_TYPE_UPLOAD);
        CD3DX12_RESOURCE_DESC rdb = CD3DX12_RESOURCE_DESC::Buffer(upload_buffer_size);
        ThrowIfFailed(d3d.device->CreateCommittedResource(
            &hp,
            D3D12_HEAP_FLAG_NONE,
            &rdb,
            D3D12_RESOURCE_STATE_GENERIC_READ,
            nullptr,
            IID_PPV_ARGS(&upload_heap)));
    } else {
        upload_heap = upload_heaps.back();
        upload_heaps.pop_back();
    }
    
    {
        D3D12_SUBRESOURCE_DATA texture_data = {};
        texture_data.pData = rgba32_buf;
        texture_data.RowPitch = width * 4; // RGBA
        texture_data.SlicePitch = texture_data.RowPitch * height;
        
        void *data;
        upload_heap->Map(0, nullptr, &data);
        D3D12_MEMCPY_DEST dest_data = { (uint8_t *)data + layout.Offset, layout.Footprint.RowPitch, SIZE_T(layout.Footprint.RowPitch) * SIZE_T(num_rows) };
        MemcpySubresource(&dest_data, &texture_data, static_cast<SIZE_T>(row_size_in_bytes), num_rows, layout.Footprint.Depth);
        upload_heap->Unmap(0, nullptr);

        CD3DX12_TEXTURE_COPY_LOCATION dst(texture_resource.Get(), 0);
        CD3DX12_TEXTURE_COPY_LOCATION src(upload_heap.Get(), layout);
        d3d.copy_command_list->CopyTextureRegion(&dst, 0, 0, 0, &src, nullptr);
    }
    
    CD3DX12_RESOURCE_BARRIER barrier = CD3DX12_RESOURCE_BARRIER::Transition(texture_resource.Get(), D3D12_RESOURCE_STATE_COPY_DEST, D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE);
    d3d.command_list->ResourceBarrier(1, &barrier);
    
    d3d.upload_heaps_in_flight.push_back(std::make_pair((size_t)upload_buffer_size, std::move(upload_heap)));
    
    struct TextureData& td = d3d.textures[d3d.current_texture_ids[d3d.current_tile]];
    if (td.resource.Get() != nullptr) {
        d3d.resources_to_clean_at_end_of_frame.push_back(std::move(td.resource));
        d3d.texture_heap_allocations_to_reclaim_at_end_of_frame.push_back(std::make_pair(td.heap, td.heap_offset));
        td.last_frame_counter = 0;
    }
    td.resource = std::move(texture_resource);
    td.heap = found_heap;
    td.heap_offset = heap_offset;
}

static int gfx_cm_to_index(uint32_t val) {
    if (val & G_TX_CLAMP) {
        return 2;
    }
    return (val & G_TX_MIRROR) ? 1 : 0;
}

static void gfx_direct3d12_set_sampler_parameters(int tile, bool linear_filter, uint32_t cms, uint32_t cmt) {
    d3d.textures[d3d.current_texture_ids[tile]].sampler_parameters = linear_filter * 9 + gfx_cm_to_index(cms) * 3 + gfx_cm_to_index(cmt);
}

static void gfx_direct3d12_set_depth_test(bool depth_test) {
    d3d.depth_test = depth_test;
    d3d.must_reload_pipeline = true;
}

static void gfx_direct3d12_set_depth_mask(bool z_upd) {
    d3d.depth_mask = z_upd;
    d3d.must_reload_pipeline = true;
}

static void gfx_direct3d12_set_zmode_decal(bool zmode_decal) {
    d3d.zmode_decal = zmode_decal;
    d3d.must_reload_pipeline = true;
}

static void gfx_direct3d12_set_viewport(int x, int y, int width, int height) {
    d3d.viewport = CD3DX12_VIEWPORT(x, d3d.current_height - y - height, width, height);
}

static void gfx_direct3d12_set_scissor(int x, int y, int width, int height) {
    d3d.scissor = CD3DX12_RECT(x, d3d.current_height - y - height, x + width, d3d.current_height - y);
}

static void gfx_direct3d12_set_use_alpha(bool use_alpha) {
    // Already part of the pipeline state from shader info
}

static void gfx_direct3d12_draw_triangles(float buf_vbo[], size_t buf_vbo_len, size_t buf_vbo_num_tris) {
    struct ShaderProgramD3D12 *prg = d3d.shader_program;
    
    if (d3d.must_reload_pipeline) {
        ComPtr<ID3D12PipelineState>& pipeline_state = d3d.pipeline_states[PipelineDesc{
            prg->shader_id,
            d3d.depth_test,
            d3d.depth_mask,
            d3d.zmode_decal,
            0
        }];
        if (pipeline_state.Get() == nullptr) {
            D3D12_INPUT_ELEMENT_DESC ied[7] = {
               {"POSITION", 0, DXGI_FORMAT_R32G32B32A32_FLOAT, 0, 0, D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA, 0 }
            };
            uint32_t ied_pos = 1;
            if (prg->used_textures[0] || prg->used_textures[1]) {
                ied[ied_pos++] = D3D12_INPUT_ELEMENT_DESC{"TEXCOORD", 0, DXGI_FORMAT_R32G32_FLOAT, 0, D3D12_APPEND_ALIGNED_ELEMENT, D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA, 0};
            }
            if (prg->shader_id & SHADER_OPT_FOG) {
                ied[ied_pos++] = D3D12_INPUT_ELEMENT_DESC{"FOG", 0, DXGI_FORMAT_R32G32B32A32_FLOAT, 0, D3D12_APPEND_ALIGNED_ELEMENT, D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA, 0};
            }
            for (int i = 0; i < prg->num_inputs; i++) {
                DXGI_FORMAT format = (prg->shader_id & SHADER_OPT_ALPHA) ? DXGI_FORMAT_R32G32B32A32_FLOAT : DXGI_FORMAT_R32G32B32_FLOAT;
                ied[ied_pos++] = D3D12_INPUT_ELEMENT_DESC{"INPUT", (UINT)i, format, 0, D3D12_APPEND_ALIGNED_ELEMENT, D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA, 0};
            }
            
            D3D12_GRAPHICS_PIPELINE_STATE_DESC desc = {};
            desc.InputLayout = { ied, ied_pos };
            desc.pRootSignature = prg->root_signature.Get();
            desc.VS = CD3DX12_SHADER_BYTECODE(prg->vertex_shader.Get());
            desc.PS = CD3DX12_SHADER_BYTECODE(prg->pixel_shader.Get());
            desc.RasterizerState = CD3DX12_RASTERIZER_DESC(D3D12_DEFAULT);
            if (d3d.zmode_decal) {
                desc.RasterizerState.SlopeScaledDepthBias = -2.0f;
            }
            desc.RasterizerState.CullMode = D3D12_CULL_MODE_NONE;
            if (prg->shader_id & SHADER_OPT_ALPHA) {
                D3D12_BLEND_DESC bd = {};
                bd.AlphaToCoverageEnable = FALSE;
                bd.IndependentBlendEnable = FALSE;
                static const D3D12_RENDER_TARGET_BLEND_DESC default_rtbd = {
                    TRUE, FALSE,
                    D3D12_BLEND_SRC_ALPHA, D3D12_BLEND_INV_SRC_ALPHA, D3D12_BLEND_OP_ADD,
                    D3D12_BLEND_ONE, D3D12_BLEND_INV_SRC_ALPHA, D3D12_BLEND_OP_ADD,
                    D3D12_LOGIC_OP_NOOP,
                    D3D12_COLOR_WRITE_ENABLE_ALL
                };
                for (UINT i = 0; i < D3D12_SIMULTANEOUS_RENDER_TARGET_COUNT; i++) {
                    bd.RenderTarget[i] = default_rtbd;
                }
                desc.BlendState = bd;
            } else {
                desc.BlendState = CD3DX12_BLEND_DESC(D3D12_DEFAULT);
            }
            desc.DepthStencilState.DepthEnable = d3d.depth_test;
            desc.DepthStencilState.DepthWriteMask = d3d.depth_mask ? D3D12_DEPTH_WRITE_MASK_ALL : D3D12_DEPTH_WRITE_MASK_ZERO;
            desc.DepthStencilState.DepthFunc = D3D12_COMPARISON_FUNC_LESS_EQUAL;
            desc.DSVFormat = d3d.depth_test ? DXGI_FORMAT_D32_FLOAT : DXGI_FORMAT_UNKNOWN;
            desc.SampleMask = UINT_MAX;
            desc.PrimitiveTopologyType = D3D12_PRIMITIVE_TOPOLOGY_TYPE_TRIANGLE;
            desc.NumRenderTargets = 1;
            desc.RTVFormats[0] = DXGI_FORMAT_R8G8B8A8_UNORM;
            desc.SampleDesc.Count = 1;
            ThrowIfFailed(d3d.device->CreateGraphicsPipelineState(&desc, IID_PPV_ARGS(&pipeline_state)));
        }
        d3d.pipeline_state = pipeline_state.Get();
        d3d.must_reload_pipeline = false;
    }
    
    d3d.command_list->SetGraphicsRootSignature(prg->root_signature.Get());
    d3d.command_list->SetPipelineState(d3d.pipeline_state);
    
    ID3D12DescriptorHeap *heaps[] = { d3d.srv_heap.Get(), d3d.sampler_heap.Get() };
    d3d.command_list->SetDescriptorHeaps(2, heaps);
    
    int root_param_index = 0;
    
    if ((prg->shader_id & (SHADER_OPT_ALPHA | SHADER_OPT_NOISE)) == (SHADER_OPT_ALPHA | SHADER_OPT_NOISE)) {
        d3d.command_list->SetGraphicsRootConstantBufferView(root_param_index++, d3d.noise_cb->GetGPUVirtualAddress());
    }
    
    for (int i = 0; i < 2; i++) {
        if (prg->used_textures[i]) {
            struct TextureData& td = d3d.textures[d3d.current_texture_ids[i]];
            if (td.last_frame_counter != d3d.frame_counter) {
                td.descriptor_index = d3d.srv_pos;
                td.last_frame_counter = d3d.frame_counter;
                
                D3D12_SHADER_RESOURCE_VIEW_DESC srv_desc = {};
                srv_desc.Shader4ComponentMapping = D3D12_DEFAULT_SHADER_4_COMPONENT_MAPPING;
                srv_desc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
                srv_desc.ViewDimension = D3D12_SRV_DIMENSION_TEXTURE2D;
                srv_desc.Texture2D.MipLevels = 1;
                
                CD3DX12_CPU_DESCRIPTOR_HANDLE srv_handle(get_cpu_descriptor_handle(d3d.srv_heap), d3d.srv_pos++, d3d.srv_descriptor_size);
                d3d.device->CreateShaderResourceView(td.resource.Get(), &srv_desc, srv_handle);
            }
            
            CD3DX12_GPU_DESCRIPTOR_HANDLE srv_gpu_handle(get_gpu_descriptor_handle(d3d.srv_heap), td.descriptor_index, d3d.srv_descriptor_size);
            d3d.command_list->SetGraphicsRootDescriptorTable(root_param_index++, srv_gpu_handle);
            
            CD3DX12_GPU_DESCRIPTOR_HANDLE sampler_gpu_handle(get_gpu_descriptor_handle(d3d.sampler_heap), td.sampler_parameters, d3d.sampler_descriptor_size);
            d3d.command_list->SetGraphicsRootDescriptorTable(root_param_index++, sampler_gpu_handle);
        }
    }
    
    CD3DX12_CPU_DESCRIPTOR_HANDLE rtv_handle(get_cpu_descriptor_handle(d3d.rtv_heap), d3d.frame_index, d3d.rtv_descriptor_size);
    D3D12_CPU_DESCRIPTOR_HANDLE dsv_handle = get_cpu_descriptor_handle(d3d.dsv_heap);
    d3d.command_list->OMSetRenderTargets(1, &rtv_handle, FALSE, &dsv_handle);
    
    d3d.command_list->RSSetViewports(1, &d3d.viewport);
    d3d.command_list->RSSetScissorRects(1, &d3d.scissor);
    
    int current_pos = d3d.vbuf_pos;
    memcpy((uint8_t *)d3d.mapped_vbuf_address + current_pos, buf_vbo, buf_vbo_len * sizeof(float));
    d3d.vbuf_pos += buf_vbo_len * sizeof(float);
    static int maxpos;
    if (d3d.vbuf_pos > maxpos) {
        maxpos = d3d.vbuf_pos;
        //printf("NEW MAXPOS: %d\n", maxpos);
    }
    
    D3D12_VERTEX_BUFFER_VIEW vertex_buffer_view;
    vertex_buffer_view.BufferLocation = d3d.vertex_buffer->GetGPUVirtualAddress() + current_pos;
    vertex_buffer_view.StrideInBytes = buf_vbo_len / (3 * buf_vbo_num_tris) * sizeof(float);
    vertex_buffer_view.SizeInBytes = buf_vbo_len * sizeof(float);
    
    d3d.command_list->IASetPrimitiveTopology(D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST);
    d3d.command_list->IASetVertexBuffers(0, 1, &vertex_buffer_view);
    d3d.command_list->DrawInstanced(3 * buf_vbo_num_tris, 1, 0, 0);
}

static void gfx_direct3d12_start_frame(void) {
    ++d3d.frame_counter;
    d3d.srv_pos = 0;
    texture_uploads = 0;
    ThrowIfFailed(d3d.command_allocator->Reset());
    ThrowIfFailed(d3d.command_list->Reset(d3d.command_allocator.Get(), nullptr));
    
    CD3DX12_RESOURCE_BARRIER barrier = CD3DX12_RESOURCE_BARRIER::Transition(
        d3d.render_targets[d3d.frame_index].Get(),
        D3D12_RESOURCE_STATE_PRESENT,
        D3D12_RESOURCE_STATE_RENDER_TARGET);
    d3d.command_list->ResourceBarrier(1, &barrier);
    
    CD3DX12_CPU_DESCRIPTOR_HANDLE rtv_handle(get_cpu_descriptor_handle(d3d.rtv_heap), d3d.frame_index, d3d.rtv_descriptor_size);
    D3D12_CPU_DESCRIPTOR_HANDLE dsv_handle = get_cpu_descriptor_handle(d3d.dsv_heap);
    d3d.command_list->OMSetRenderTargets(1, &rtv_handle, FALSE, &dsv_handle);
    
    static unsigned char c;
    const float clear_color[] = { 0.0f, 0.0f, 0.0f, 1.0f };
    d3d.command_list->ClearRenderTargetView(rtv_handle, clear_color, 0, nullptr);
    d3d.command_list->ClearDepthStencilView(dsv_handle, D3D12_CLEAR_FLAG_DEPTH, 1.0f, 0, 0, nullptr);
    
    d3d.noise_cb_data.noise_frame++;
    if (d3d.noise_cb_data.noise_frame > 150) {
        // No high values, as noise starts to look ugly
        d3d.noise_cb_data.noise_frame = 0;
    }
    float aspect_ratio = (float) d3d.current_width / (float) d3d.current_height;
    d3d.noise_cb_data.noise_scale_x = 120 * aspect_ratio; // 120 = N64 height resolution (240) / 2
    d3d.noise_cb_data.noise_scale_y = 120;
    memcpy(d3d.mapped_noise_cb_address, &d3d.noise_cb_data, sizeof(struct NoiseCB));
    
    d3d.vbuf_pos = 0;
}

static void create_render_target_views(void) {
    D3D12_CPU_DESCRIPTOR_HANDLE rtv_handle = get_cpu_descriptor_handle(d3d.rtv_heap);
    for (UINT i = 0; i < 2; i++) {
        ThrowIfFailed(d3d.swap_chain->GetBuffer(i, IID_ID3D12Resource, (void **)&d3d.render_targets[i]));
        d3d.device->CreateRenderTargetView(d3d.render_targets[i].Get(), nullptr, rtv_handle);
        rtv_handle.ptr += d3d.rtv_descriptor_size;
    }
}

static void create_depth_buffer(void) {
    DXGI_SWAP_CHAIN_DESC1 desc1;
    ThrowIfFailed(d3d.swap_chain->GetDesc1(&desc1));
    UINT width = desc1.Width;
    UINT height = desc1.Height;
    
    d3d.current_width = width;
    d3d.current_height = height;
    
    D3D12_DEPTH_STENCIL_VIEW_DESC dsv_desc = {};
    dsv_desc.Format = DXGI_FORMAT_D32_FLOAT;
    dsv_desc.ViewDimension = D3D12_DSV_DIMENSION_TEXTURE2D;
    dsv_desc.Flags = D3D12_DSV_FLAG_NONE;

    D3D12_CLEAR_VALUE depth_optimized_cv = {};
    depth_optimized_cv.Format = DXGI_FORMAT_D32_FLOAT;
    depth_optimized_cv.DepthStencil.Depth = 1.0f;

    D3D12_HEAP_PROPERTIES hp = {};
    hp.Type = D3D12_HEAP_TYPE_DEFAULT;
    hp.CPUPageProperty = D3D12_CPU_PAGE_PROPERTY_UNKNOWN;
    hp.MemoryPoolPreference = D3D12_MEMORY_POOL_UNKNOWN;
    hp.CreationNodeMask = 1;
    hp.VisibleNodeMask = 1;

    D3D12_RESOURCE_DESC rd = {};
    rd.Dimension = D3D12_RESOURCE_DIMENSION_TEXTURE2D;
    rd.Alignment = 0;
    rd.Width = width;
    rd.Height = height;
    rd.DepthOrArraySize = 1;
    rd.MipLevels = 0;
    rd.Format = DXGI_FORMAT_D32_FLOAT;
    rd.SampleDesc.Count = 1;
    rd.SampleDesc.Quality = 0;
    rd.Flags = D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL;
    rd.Layout = D3D12_TEXTURE_LAYOUT_UNKNOWN;
    ThrowIfFailed(d3d.device->CreateCommittedResource(&hp, D3D12_HEAP_FLAG_NONE, &rd, D3D12_RESOURCE_STATE_DEPTH_WRITE, &depth_optimized_cv, IID_PPV_ARGS(&d3d.depth_stencil_buffer)));
    
    d3d.device->CreateDepthStencilView(d3d.depth_stencil_buffer.Get(), &dsv_desc, get_cpu_descriptor_handle(d3d.dsv_heap));
}

static void gfx_direct3d12_on_resize(void) {
    if (d3d.render_targets[0].Get() != nullptr) {
        d3d.render_targets[0].Reset();
        d3d.render_targets[1].Reset();
        ThrowIfFailed(d3d.swap_chain->ResizeBuffers(0, 0, 0, DXGI_FORMAT_UNKNOWN, DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT));
        d3d.frame_index = d3d.swap_chain->GetCurrentBackBufferIndex();
        create_render_target_views();
        create_depth_buffer();
    }
}

static void gfx_direct3d12_init(void ) {
    // Load d3d12.dll
    d3d.d3d12_module = LoadLibraryW(L"d3d12.dll");
    if (d3d.d3d12_module == nullptr) {
        ThrowIfFailed(HRESULT_FROM_WIN32(GetLastError()), gfx_dxgi_get_h_wnd(), "d3d12.dll could not be loaded");
    }
    d3d.D3D12CreateDevice = (PFN_D3D12_CREATE_DEVICE)GetProcAddress(d3d.d3d12_module, "D3D12CreateDevice");
#if DEBUG_D3D
    d3d.D3D12GetDebugInterface = (PFN_D3D12_GET_DEBUG_INTERFACE)GetProcAddress(d3d.d3d12_module, "D3D12GetDebugInterface");
#endif

    // Load D3DCompiler_47.dll
    d3d.d3dcompiler_module = LoadLibraryW(L"D3DCompiler_47.dll");
    if (d3d.d3dcompiler_module == nullptr) {
        ThrowIfFailed(HRESULT_FROM_WIN32(GetLastError()), gfx_dxgi_get_h_wnd(), "D3DCompiler_47.dll could not be loaded");
    }
    d3d.D3DCompile = (pD3DCompile)GetProcAddress(d3d.d3dcompiler_module, "D3DCompile");
    
    // Create device
    {
        UINT debug_flags = 0;
#if DEBUG_D3D
        ComPtr<ID3D12Debug> debug_controller;
        if (SUCCEEDED(d3d.D3D12GetDebugInterface(IID_PPV_ARGS(&debug_controller)))) {
            debug_controller->EnableDebugLayer();
            debug_flags |= DXGI_CREATE_FACTORY_DEBUG;
        }
#endif
        
        gfx_dxgi_create_factory_and_device(DEBUG_D3D, 12, [](IDXGIAdapter1 *adapter, bool test_only) {
            HRESULT res = d3d.D3D12CreateDevice(
                adapter,
                D3D_FEATURE_LEVEL_11_0,
                IID_ID3D12Device,
                test_only ? nullptr : IID_PPV_ARGS_Helper(&d3d.device));
            
            if (test_only) {
                return SUCCEEDED(res);
            } else {
                ThrowIfFailed(res, gfx_dxgi_get_h_wnd(), "Failed to create D3D12 device.");
                return true;
            }
        });
    }
    
    // Create command queues
    {
        D3D12_COMMAND_QUEUE_DESC queue_desc = {};
        queue_desc.Flags = D3D12_COMMAND_QUEUE_FLAG_NONE;
        queue_desc.Type = D3D12_COMMAND_LIST_TYPE_DIRECT;
        ThrowIfFailed(d3d.device->CreateCommandQueue(&queue_desc, IID_PPV_ARGS(&d3d.command_queue)));
    }
    {
        D3D12_COMMAND_QUEUE_DESC queue_desc = {};
        queue_desc.Flags = D3D12_COMMAND_QUEUE_FLAG_NONE;
        queue_desc.Type = D3D12_COMMAND_LIST_TYPE_COPY;
        ThrowIfFailed(d3d.device->CreateCommandQueue(&queue_desc, IID_PPV_ARGS(&d3d.copy_command_queue)));
    }
    
    // Create swap chain
    {
        ComPtr<IDXGISwapChain1> swap_chain1 = gfx_dxgi_create_swap_chain(d3d.command_queue.Get());
        ThrowIfFailed(swap_chain1->QueryInterface(__uuidof(IDXGISwapChain3), &d3d.swap_chain));
        d3d.frame_index = d3d.swap_chain->GetCurrentBackBufferIndex();
    }
    
    // Create render target views
    {
        D3D12_DESCRIPTOR_HEAP_DESC rtv_heap_desc = {};
        rtv_heap_desc.NumDescriptors = 2;
        rtv_heap_desc.Type = D3D12_DESCRIPTOR_HEAP_TYPE_RTV;
        rtv_heap_desc.Flags = D3D12_DESCRIPTOR_HEAP_FLAG_NONE;
        ThrowIfFailed(d3d.device->CreateDescriptorHeap(&rtv_heap_desc, IID_PPV_ARGS(&d3d.rtv_heap)));
        d3d.rtv_descriptor_size = d3d.device->GetDescriptorHandleIncrementSize(D3D12_DESCRIPTOR_HEAP_TYPE_RTV);

        create_render_target_views();
    }
    
    // Create Z-buffer
    {
        D3D12_DESCRIPTOR_HEAP_DESC dsv_heap_desc = {};
        dsv_heap_desc.NumDescriptors = 1;
        dsv_heap_desc.Type = D3D12_DESCRIPTOR_HEAP_TYPE_DSV;
        dsv_heap_desc.Flags = D3D12_DESCRIPTOR_HEAP_FLAG_NONE;
        ThrowIfFailed(d3d.device->CreateDescriptorHeap(&dsv_heap_desc, IID_PPV_ARGS(&d3d.dsv_heap)));

        create_depth_buffer();
    }
    
    // Create SRV heap for texture descriptors
    {
        D3D12_DESCRIPTOR_HEAP_DESC srv_heap_desc = {};
        srv_heap_desc.NumDescriptors = 1024; // Max unique textures per frame
        srv_heap_desc.Type = D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV;
        srv_heap_desc.Flags = D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE;
        ThrowIfFailed(d3d.device->CreateDescriptorHeap(&srv_heap_desc, IID_PPV_ARGS(&d3d.srv_heap)));
        d3d.srv_descriptor_size = d3d.device->GetDescriptorHandleIncrementSize(D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV);
    }
    
    // Create sampler heap and descriptors
    {
        D3D12_DESCRIPTOR_HEAP_DESC sampler_heap_desc = {};
        sampler_heap_desc.NumDescriptors = 18;
        sampler_heap_desc.Type = D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER;
        sampler_heap_desc.Flags = D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE;
        ThrowIfFailed(d3d.device->CreateDescriptorHeap(&sampler_heap_desc, IID_PPV_ARGS(&d3d.sampler_heap)));
        d3d.sampler_descriptor_size = d3d.device->GetDescriptorHandleIncrementSize(D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER);
        
        static const D3D12_TEXTURE_ADDRESS_MODE address_modes[] = {
            D3D12_TEXTURE_ADDRESS_MODE_WRAP,
            D3D12_TEXTURE_ADDRESS_MODE_MIRROR,
            D3D12_TEXTURE_ADDRESS_MODE_CLAMP
        };
        
        D3D12_CPU_DESCRIPTOR_HANDLE sampler_handle = get_cpu_descriptor_handle(d3d.sampler_heap);
        int pos = 0;
        for (int linear_filter = 0; linear_filter < 2; linear_filter++) {
            for (int cms = 0; cms < 3; cms++) {
                for (int cmt = 0; cmt < 3; cmt++) {
                    D3D12_SAMPLER_DESC sampler_desc = {};
                    sampler_desc.Filter = linear_filter ? D3D12_FILTER_MIN_MAG_MIP_LINEAR : D3D12_FILTER_MIN_MAG_MIP_POINT;
                    sampler_desc.AddressU = address_modes[cms];
                    sampler_desc.AddressV = address_modes[cmt];
                    sampler_desc.AddressW = D3D12_TEXTURE_ADDRESS_MODE_WRAP;
                    sampler_desc.MinLOD = 0;
                    sampler_desc.MaxLOD = D3D12_FLOAT32_MAX;
                    sampler_desc.MipLODBias = 0.0f;
                    sampler_desc.MaxAnisotropy = 1;
                    sampler_desc.ComparisonFunc = D3D12_COMPARISON_FUNC_NEVER;
                    d3d.device->CreateSampler(&sampler_desc, CD3DX12_CPU_DESCRIPTOR_HANDLE(sampler_handle, pos++, d3d.sampler_descriptor_size));
                }
            }
        }
    }
    
    // Create constant buffer view for noise
    {
        /*D3D12_DESCRIPTOR_HEAP_DESC cbv_heap_desc = {};
        cbv_heap_desc.NumDescriptors = 1;
        cbv_heap_desc.Type = D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV;
        srv_heap_desc.Flags = D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE;
        ThrowIfFailed(d3d.device->CreateDescriptorHeap*/
        
        CD3DX12_HEAP_PROPERTIES hp(D3D12_HEAP_TYPE_UPLOAD);
        CD3DX12_RESOURCE_DESC rdb = CD3DX12_RESOURCE_DESC::Buffer(256);
        ThrowIfFailed(d3d.device->CreateCommittedResource(
            &hp,
            D3D12_HEAP_FLAG_NONE,
            &rdb,
            D3D12_RESOURCE_STATE_GENERIC_READ,
            nullptr,
            IID_PPV_ARGS(&d3d.noise_cb)));
        
        CD3DX12_RANGE read_range(0, 0); // Read not possible from CPU
        ThrowIfFailed(d3d.noise_cb->Map(0, &read_range, &d3d.mapped_noise_cb_address));
    }
    
    ThrowIfFailed(d3d.device->CreateCommandAllocator(D3D12_COMMAND_LIST_TYPE_DIRECT, IID_PPV_ARGS(&d3d.command_allocator)));
    ThrowIfFailed(d3d.device->CreateCommandAllocator(D3D12_COMMAND_LIST_TYPE_COPY, IID_PPV_ARGS(&d3d.copy_command_allocator)));
    
    ThrowIfFailed(d3d.device->CreateCommandList(0, D3D12_COMMAND_LIST_TYPE_DIRECT, d3d.command_allocator.Get(), nullptr, IID_PPV_ARGS(&d3d.command_list)));
    ThrowIfFailed(d3d.device->CreateCommandList(0, D3D12_COMMAND_LIST_TYPE_COPY, d3d.copy_command_allocator.Get(), nullptr, IID_PPV_ARGS(&d3d.copy_command_list)));
    
    ThrowIfFailed(d3d.command_list->Close());
    
    ThrowIfFailed(d3d.device->CreateFence(0, D3D12_FENCE_FLAG_NONE, IID_PPV_ARGS(&d3d.fence)));
    d3d.fence_event = CreateEvent(nullptr, FALSE, FALSE, nullptr);
    if (d3d.fence_event == nullptr) {
        ThrowIfFailed(HRESULT_FROM_WIN32(GetLastError()));
    }
    
    ThrowIfFailed(d3d.device->CreateFence(0, D3D12_FENCE_FLAG_NONE, IID_PPV_ARGS(&d3d.copy_fence)));
    
    {
        // Create a buffer of 1 MB in size. With a 120 star speed run 192 kB seems to be max usage.
        CD3DX12_HEAP_PROPERTIES hp(D3D12_HEAP_TYPE_UPLOAD);
        CD3DX12_RESOURCE_DESC rdb = CD3DX12_RESOURCE_DESC::Buffer(256 * 1024 * sizeof(float));
        ThrowIfFailed(d3d.device->CreateCommittedResource(
            &hp,
            D3D12_HEAP_FLAG_NONE,
            &rdb,
            D3D12_RESOURCE_STATE_GENERIC_READ,
            nullptr,
            IID_PPV_ARGS(&d3d.vertex_buffer)));
        
        CD3DX12_RANGE read_range(0, 0); // Read not possible from CPU
        ThrowIfFailed(d3d.vertex_buffer->Map(0, &read_range, &d3d.mapped_vbuf_address));
    }
}

static void gfx_direct3d12_end_frame(void) {
    if (max_texture_uploads < texture_uploads && texture_uploads != 38 && texture_uploads != 34 && texture_uploads != 29) {
        max_texture_uploads = texture_uploads;
    }
    //printf("Texture uploads: %d %d\n", max_texture_uploads, texture_uploads);
    texture_uploads = 0;
    
    ThrowIfFailed(d3d.copy_command_list->Close());
    {
        ID3D12CommandList *lists[] = { d3d.copy_command_list.Get() };
        d3d.copy_command_queue->ExecuteCommandLists(1, lists);
        d3d.copy_command_queue->Signal(d3d.copy_fence.Get(), ++d3d.copy_fence_value);
    }
    
    CD3DX12_RESOURCE_BARRIER barrier = CD3DX12_RESOURCE_BARRIER::Transition(
        d3d.render_targets[d3d.frame_index].Get(),
        D3D12_RESOURCE_STATE_RENDER_TARGET,
        D3D12_RESOURCE_STATE_PRESENT);
    d3d.command_list->ResourceBarrier(1, &barrier);
    
    d3d.command_queue->Wait(d3d.copy_fence.Get(), d3d.copy_fence_value);
    
    ThrowIfFailed(d3d.command_list->Close());
    
    {
        ID3D12CommandList *lists[] = { d3d.command_list.Get() };
        d3d.command_queue->ExecuteCommandLists(1, lists);
    }
    
    {
        LARGE_INTEGER t0;
        QueryPerformanceCounter(&t0);
        //printf("Present: %llu %u\n", (unsigned long long)(t0.QuadPart - d3d.qpc_init), d3d.length_in_vsync_frames);
    }
}

static void gfx_direct3d12_finish_render(void) {
    LARGE_INTEGER t0, t1, t2;
    QueryPerformanceCounter(&t0);
    
    static UINT64 fence_value;
    ThrowIfFailed(d3d.command_queue->Signal(d3d.fence.Get(), ++fence_value));
    if (d3d.fence->GetCompletedValue() < fence_value) {
        ThrowIfFailed(d3d.fence->SetEventOnCompletion(fence_value, d3d.fence_event));
        WaitForSingleObject(d3d.fence_event, INFINITE);
    }
    QueryPerformanceCounter(&t1);
    
    d3d.resources_to_clean_at_end_of_frame.clear();
    for (std::pair<size_t, ComPtr<ID3D12Resource>>& heap : d3d.upload_heaps_in_flight) {
        d3d.upload_heaps[heap.first].push_back(std::move(heap.second));
    }
    d3d.upload_heaps_in_flight.clear();
    for (std::pair<struct TextureHeap *, uint8_t>& item : d3d.texture_heap_allocations_to_reclaim_at_end_of_frame) {
        item.first->free_list.push_back(item.second);
    }
    d3d.texture_heap_allocations_to_reclaim_at_end_of_frame.clear();
    
    QueryPerformanceCounter(&t2);
    
    d3d.frame_index = d3d.swap_chain->GetCurrentBackBufferIndex();
    
    ThrowIfFailed(d3d.copy_command_allocator->Reset());
    ThrowIfFailed(d3d.copy_command_list->Reset(d3d.copy_command_allocator.Get(), nullptr));
    
    //printf("done %llu gpu:%d wait:%d freed:%llu frame:%u %u monitor:%u t:%llu\n", (unsigned long long)(t0.QuadPart - d3d.qpc_init), (int)(t1.QuadPart - t0.QuadPart), (int)(t2.QuadPart - t0.QuadPart), (unsigned long long)(t2.QuadPart - d3d.qpc_init), d3d.pending_frame_stats.rbegin()->first, stats.PresentCount, stats.SyncRefreshCount, (unsigned long long)(stats.SyncQPCTime.QuadPart - d3d.qpc_init));
}

} // namespace

struct GfxRenderingAPI gfx_direct3d12_api = {
    gfx_direct3d12_z_is_from_0_to_1,
    gfx_direct3d12_unload_shader,
    gfx_direct3d12_load_shader,
    gfx_direct3d12_create_and_load_new_shader,
    gfx_direct3d12_lookup_shader,
    gfx_direct3d12_shader_get_info,
    gfx_direct3d12_new_texture,
    gfx_direct3d12_select_texture,
    gfx_direct3d12_upload_texture,
    gfx_direct3d12_set_sampler_parameters,
    gfx_direct3d12_set_depth_test,
    gfx_direct3d12_set_depth_mask,
    gfx_direct3d12_set_zmode_decal,
    gfx_direct3d12_set_viewport,
    gfx_direct3d12_set_scissor,
    gfx_direct3d12_set_use_alpha,
    gfx_direct3d12_draw_triangles,
    gfx_direct3d12_init,
    gfx_direct3d12_on_resize,
    gfx_direct3d12_start_frame,
    gfx_direct3d12_end_frame,
    gfx_direct3d12_finish_render
};

#endif
