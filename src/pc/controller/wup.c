#if !defined(__MINGW32__) && !defined(__BSD__) && !defined(TARGET_WEB)
// See LICENSE for license

#define _XOPEN_SOURCE 600

#include <time.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include <linux/input.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>

//#include <libudev.h>
#include <libusb.h>
#include <pthread.h>

#include "macros.h"

#if (!defined(LIBUSBX_API_VERSION) || LIBUSBX_API_VERSION < 0x01000102) && (!defined(LIBUSB_API_VERSION) || LIBUSB_API_VERSION < 0x01000102)
#error libusb(x) 1.0.16 or higher is required
#endif

#define EP_IN  0x81
#define EP_OUT 0x02

#define STATE_NORMAL   0x10
#define STATE_WAVEBIRD 0x20

const int BUTTON_OFFSET_VALUES[16] = {
   BTN_START,
   BTN_TR2,
   BTN_TR,
   BTN_TL,
   -1,
   -1,
   -1,
   -1,
   BTN_SOUTH,
   BTN_WEST,
   BTN_EAST,
   BTN_NORTH,
   BTN_DPAD_LEFT,
   BTN_DPAD_RIGHT,
   BTN_DPAD_DOWN,
   BTN_DPAD_UP,
};

const int AXIS_OFFSET_VALUES[6] = {
   ABS_X,
   ABS_Y,
   ABS_RX,
   ABS_RY,
   ABS_Z,
   ABS_RZ
};

struct ports
{
   bool connected;
   bool extra_power;
   unsigned char type;
   uint16_t buttons;
   uint8_t axis[6];
};

struct adapter
{
   volatile bool quitting;
   struct libusb_device *device;
   struct libusb_device_handle *handle;
   pthread_t thread;
   unsigned char rumble[5];
   struct ports controllers[4];
   struct adapter *next;
};

static bool raw_mode;

static volatile int quitting;

static struct adapter adapters;

static const char *uinput_path;

bool wup_get_controller_input(uint16_t *buttons, uint8_t axis[6]) {
    struct adapter *adapter = adapters.next;
    if (adapter != NULL) {
        *buttons = adapter->controllers[0].buttons;
        memcpy(axis, adapter->controllers[0].axis, 6);
        return true;
    } else {
        return false;
    }
}

static unsigned char connected_type(unsigned char status)
{
   unsigned char type = status & (STATE_NORMAL | STATE_WAVEBIRD);
   switch (type)
   {
      case STATE_NORMAL:
      case STATE_WAVEBIRD:
         return type;
      default:
         return 0;
   }
}

static void handle_payload(int i, struct ports *port, unsigned char *payload)
{
   unsigned char status = payload[0];
   unsigned char type = connected_type(status);

   if (type != 0 && !port->connected)
   {
      //uinput_create(i, port, type);
       port->type = type;
       port->connected = true;
   }
   else if (type == 0 && port->connected)
   {
      //uinput_destroy(i, port);
       port->connected = false;
   }

   if (!port->connected)
      return;

   port->extra_power = ((status & 0x04) != 0);

   if (type != port->type)
   {
      fprintf(stderr, "controller on port %d changed controller type???", i+1);
      port->type = type;
   }

   uint16_t btns = (uint16_t) payload[1] << 8 | (uint16_t) payload[2];
   port->buttons = btns;
   //printf("Btns: %04x\n", btns);

   //printf("Axis:");
   for (int j = 0; j < 6; j++)
   {
      unsigned char value = payload[j+3];
      port->axis[j] = value;
      //printf(" %02x", value);
   }
   //puts("");
}

static int64_t to_ms(struct timespec* t) {
    return t->tv_sec * 1000 + t->tv_nsec / 1000000;
}

static void *adapter_thread(void *data)
{
   struct adapter *a = (struct adapter *)data;

    int bytes_transferred;
    unsigned char payload[1] = { 0x13 };

    int transfer_ret = libusb_interrupt_transfer(a->handle, EP_OUT, payload, sizeof(payload), &bytes_transferred, 0);

    if (transfer_ret != 0) {
        fprintf(stderr, "libusb_interrupt_transfer: %s\n", libusb_error_name(transfer_ret));
        return NULL;
    }
    if (bytes_transferred != sizeof(payload)) {
        fprintf(stderr, "libusb_interrupt_transfer %d/%lu bytes transferred.\n", bytes_transferred, sizeof(payload));
        return NULL;
    }

   while (!a->quitting)
   {
      //struct timespec time_before = { 0 }, time_after = { 0 };
      unsigned char payload[37];
      int size = 0;
      //clock_gettime(CLOCK_MONOTONIC, &time_before);
      int transfer_ret = libusb_interrupt_transfer(a->handle, EP_IN, payload, sizeof(payload), &size, 0);
      //clock_gettime(CLOCK_MONOTONIC, &time_after);
      //printf("Time taken: %d\n", (int)(to_ms(&time_after) - to_ms(&time_before)));
      if (transfer_ret != 0) {
         fprintf(stderr, "libusb_interrupt_transfer error %d\n", transfer_ret);
         a->quitting = true;
         break;
      }
      if (size != 37 || payload[0] != 0x21)
         continue;
      
      unsigned char *controller = &payload[1];

      unsigned char rumble[5] = { 0x11, 0, 0, 0, 0 };
      //struct timespec current_time = { 0 };
      //clock_gettime(CLOCK_REALTIME, &current_time);
      //printf("Time: %d %d\n", (int)current_time.tv_sec, (int)current_time.tv_nsec);
      for (int i = 0; i < 4; i++, controller += 9)
      {
         handle_payload(i, &a->controllers[i], controller);
         rumble[i+1] = 0;
         /*if (a->controllers[i].extra_power && a->controllers[i].type == STATE_NORMAL)
         {
            for (int j = 0; j < MAX_FF_EVENTS; j++)
            {
               struct ff_event *e = &a->controllers[i].ff_events[j];
               if (e->in_use)
               {
                  if (ts_lessthan(&e->start_time, &current_time) && ts_greaterthan(&e->end_time, &current_time))
                     rumble[i+1] = 1;
                  else
                     update_ff_start_stop(e, &current_time);
               }
            }
         }*/
      }

      if (memcmp(rumble, a->rumble, sizeof(rumble)) != 0)
      {
         memcpy(a->rumble, rumble, sizeof(rumble));
         transfer_ret = libusb_interrupt_transfer(a->handle, EP_OUT, a->rumble, sizeof(a->rumble), &size, 0);
         if (transfer_ret != 0) {
            fprintf(stderr, "libusb_interrupt_transfer error %d\n", transfer_ret);
            a->quitting = true;
            break;
         }
      }
   }

   for (int i = 0; i < 4; i++)
   {
      /*if (a->controllers[i].connected)
         uinput_destroy(i, &a->controllers[i]);*/
   }

   return NULL;
}

static void add_adapter(struct libusb_device *dev)
{
   struct adapter *a = calloc(1, sizeof(struct adapter));
   if (a == NULL)
   {
      fprintf(stderr, "FATAL: calloc() failed");
      exit(-1);
   }
   a->device = dev;

   if (libusb_open(a->device, &a->handle) != 0)
   {
      fprintf(stderr, "Error opening device 0x%p\n", a->device);
      return;
   }

   if (libusb_kernel_driver_active(a->handle, 0) == 1) {
       fprintf(stderr, "Detaching kernel driver\n");
       if (libusb_detach_kernel_driver(a->handle, 0)) {
           fprintf(stderr, "Error detaching handle 0x%p from kernel\n", a->handle);
           return;
       }
   }

   struct adapter *old_head = adapters.next;
   adapters.next = a;
   a->next = old_head;

   pthread_create(&a->thread, NULL, adapter_thread, a);

   fprintf(stderr, "adapter 0x%p connected\n", a->device);
}

static void remove_adapter(struct libusb_device *dev)
{
   struct adapter *a = &adapters;
   while (a->next != NULL)
   {
      if (a->next->device == dev)
      {
         a->next->quitting = true;
         pthread_join(a->next->thread, NULL);
         fprintf(stderr, "adapter 0x%p disconnected\n", a->next->device);
         libusb_close(a->next->handle);
         struct adapter *new_next = a->next->next;
         free(a->next);
         a->next = new_next;
         return;
      }

      a = a->next;
   }
}

static int LIBUSB_CALL hotplug_callback(struct libusb_context *ctx, struct libusb_device *dev, libusb_hotplug_event event, void *user_data)
{
   (void)ctx;
   (void)user_data;
   if (event == LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED)
   {
      add_adapter(dev);
   }
   else if (event == LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT)
   {
      remove_adapter(dev);
   }

   return 0;
}

void *wup_start(UNUSED void *a)
{
   libusb_init(NULL);

   struct libusb_device **devices;

   int count = libusb_get_device_list(NULL, &devices);

   for (int i = 0; i < count; i++)
   {
      struct libusb_device_descriptor desc;
      libusb_get_device_descriptor(devices[i], &desc);
      if (desc.idVendor == 0x057e && desc.idProduct == 0x0337)
         add_adapter(devices[i]);
   }

   if (count > 0)
      libusb_free_device_list(devices, 1);

   libusb_hotplug_callback_handle callback;

   int hotplug_capability = libusb_has_capability(LIBUSB_CAP_HAS_HOTPLUG);
   if (hotplug_capability) {
       int hotplug_ret = libusb_hotplug_register_callback(NULL,
             LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED | LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT,
             LIBUSB_HOTPLUG_NO_FLAGS, 0x057e, 0x0337,
             LIBUSB_HOTPLUG_MATCH_ANY, hotplug_callback, NULL, &callback);

       if (hotplug_ret != LIBUSB_SUCCESS) {
           fprintf(stderr, "cannot register hotplug callback, hotplugging not enabled\n");
           hotplug_capability = 0;
       }
   }

   // pump events until shutdown & all helper threads finish cleaning up
   while (!quitting)
      libusb_handle_events_completed(NULL, (int *)&quitting);

   while (adapters.next)
      remove_adapter(adapters.next->device);

   if (hotplug_capability)
      libusb_hotplug_deregister_callback(NULL, callback);

   libusb_exit(NULL);
   return (void *)0;
}
#endif
