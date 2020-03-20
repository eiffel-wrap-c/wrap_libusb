#ifndef EWG_CALLBACK_LIBUSB___
#define EWG_CALLBACK_LIBUSB___

#include <libusb.h>

typedef void (*libusb_log_cb_eiffel_feature) (void *a_class, libusb_context *ctx, enum libusb_log_level level, char const *str);

void* libusb_log_cb_object;
libusb_log_cb_eiffel_feature libusb_log_cb_address_1;
libusb_log_cb_eiffel_feature libusb_log_cb_address_2;
libusb_log_cb_eiffel_feature libusb_log_cb_address_3;

void set_libusb_log_cb_object (void* a_class);

void release_libusb_log_cb_object (void);

void* get_libusb_log_cb_stub_1 ();
void* get_libusb_log_cb_stub_2 ();
void* get_libusb_log_cb_stub_3 ();

void set_libusb_log_cb_entry_1 (void* a_feature);
void set_libusb_log_cb_entry_2 (void* a_feature);
void set_libusb_log_cb_entry_3 (void* a_feature);

void call_libusb_log_cb (void *a_function, libusb_context *ctx, enum libusb_log_level level, char const *str);


#include <libusb.h>

typedef void (*libusb_pollfd_added_cb_eiffel_feature) (void *a_class, int fd, short events, void *user_data);

void* libusb_pollfd_added_cb_object;
libusb_pollfd_added_cb_eiffel_feature libusb_pollfd_added_cb_address_1;
libusb_pollfd_added_cb_eiffel_feature libusb_pollfd_added_cb_address_2;
libusb_pollfd_added_cb_eiffel_feature libusb_pollfd_added_cb_address_3;

void set_libusb_pollfd_added_cb_object (void* a_class);

void release_libusb_pollfd_added_cb_object (void);

void* get_libusb_pollfd_added_cb_stub_1 ();
void* get_libusb_pollfd_added_cb_stub_2 ();
void* get_libusb_pollfd_added_cb_stub_3 ();

void set_libusb_pollfd_added_cb_entry_1 (void* a_feature);
void set_libusb_pollfd_added_cb_entry_2 (void* a_feature);
void set_libusb_pollfd_added_cb_entry_3 (void* a_feature);

void call_libusb_pollfd_added_cb (void *a_function, int fd, short events, void *user_data);


#include <libusb.h>

typedef void (*libusb_pollfd_removed_cb_eiffel_feature) (void *a_class, int fd, void *user_data);

void* libusb_pollfd_removed_cb_object;
libusb_pollfd_removed_cb_eiffel_feature libusb_pollfd_removed_cb_address_1;
libusb_pollfd_removed_cb_eiffel_feature libusb_pollfd_removed_cb_address_2;
libusb_pollfd_removed_cb_eiffel_feature libusb_pollfd_removed_cb_address_3;

void set_libusb_pollfd_removed_cb_object (void* a_class);

void release_libusb_pollfd_removed_cb_object (void);

void* get_libusb_pollfd_removed_cb_stub_1 ();
void* get_libusb_pollfd_removed_cb_stub_2 ();
void* get_libusb_pollfd_removed_cb_stub_3 ();

void set_libusb_pollfd_removed_cb_entry_1 (void* a_feature);
void set_libusb_pollfd_removed_cb_entry_2 (void* a_feature);
void set_libusb_pollfd_removed_cb_entry_3 (void* a_feature);

void call_libusb_pollfd_removed_cb (void *a_function, int fd, void *user_data);


#include <libusb.h>

typedef int (*libusb_hotplug_callback_fn_eiffel_feature) (void *a_class, libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data);

void* libusb_hotplug_callback_fn_object;
libusb_hotplug_callback_fn_eiffel_feature libusb_hotplug_callback_fn_address_1;
libusb_hotplug_callback_fn_eiffel_feature libusb_hotplug_callback_fn_address_2;
libusb_hotplug_callback_fn_eiffel_feature libusb_hotplug_callback_fn_address_3;

void set_libusb_hotplug_callback_fn_object (void* a_class);

void release_libusb_hotplug_callback_fn_object (void);

void* get_libusb_hotplug_callback_fn_stub_1 ();
void* get_libusb_hotplug_callback_fn_stub_2 ();
void* get_libusb_hotplug_callback_fn_stub_3 ();

void set_libusb_hotplug_callback_fn_entry_1 (void* a_feature);
void set_libusb_hotplug_callback_fn_entry_2 (void* a_feature);
void set_libusb_hotplug_callback_fn_entry_3 (void* a_feature);

int call_libusb_hotplug_callback_fn (void *a_function, libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data);


#include <libusb.h>

typedef void (*libusb_transfer_cb_fn_eiffel_feature) (void *a_class, struct libusb_transfer *transfer);

void* libusb_transfer_cb_fn_object;
libusb_transfer_cb_fn_eiffel_feature libusb_transfer_cb_fn_address_1;
libusb_transfer_cb_fn_eiffel_feature libusb_transfer_cb_fn_address_2;
libusb_transfer_cb_fn_eiffel_feature libusb_transfer_cb_fn_address_3;

void set_libusb_transfer_cb_fn_object (void* a_class);

void release_libusb_transfer_cb_fn_object (void);

void* get_libusb_transfer_cb_fn_stub_1 ();
void* get_libusb_transfer_cb_fn_stub_2 ();
void* get_libusb_transfer_cb_fn_stub_3 ();

void set_libusb_transfer_cb_fn_entry_1 (void* a_feature);
void set_libusb_transfer_cb_fn_entry_2 (void* a_feature);
void set_libusb_transfer_cb_fn_entry_3 (void* a_feature);

void call_libusb_transfer_cb_fn (void *a_function, struct libusb_transfer *transfer);


#endif
