#ifndef EWG_CALLBACK_LIBUSB___
#define EWG_CALLBACK_LIBUSB___

#include <libusb.h>

typedef void (*libusb_log_cb_eiffel_feature) (void *a_class, libusb_context *ctx, enum libusb_log_level level, char const *str);

void* get_libusb_log_cb_stub ();

struct libusb_log_cb_entry_struct
{
	void* a_class;
	libusb_log_cb_eiffel_feature feature;
};

void set_libusb_log_cb_entry (void* a_class, void* a_feature);

void call_libusb_log_cb (void *a_function, libusb_context *ctx, enum libusb_log_level level, char const *str);


#include <libusb.h>

typedef void (*libusb_pollfd_added_cb_eiffel_feature) (void *a_class, int fd, short events, void *user_data);

void* get_libusb_pollfd_added_cb_stub ();

struct libusb_pollfd_added_cb_entry_struct
{
	void* a_class;
	libusb_pollfd_added_cb_eiffel_feature feature;
};

void set_libusb_pollfd_added_cb_entry (void* a_class, void* a_feature);

void call_libusb_pollfd_added_cb (void *a_function, int fd, short events, void *user_data);


#include <libusb.h>

typedef void (*libusb_pollfd_removed_cb_eiffel_feature) (void *a_class, int fd, void *user_data);

void* get_libusb_pollfd_removed_cb_stub ();

struct libusb_pollfd_removed_cb_entry_struct
{
	void* a_class;
	libusb_pollfd_removed_cb_eiffel_feature feature;
};

void set_libusb_pollfd_removed_cb_entry (void* a_class, void* a_feature);

void call_libusb_pollfd_removed_cb (void *a_function, int fd, void *user_data);


#include <libusb.h>

typedef int (*libusb_hotplug_callback_fn_eiffel_feature) (void *a_class, libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data);

void* get_libusb_hotplug_callback_fn_stub ();

struct libusb_hotplug_callback_fn_entry_struct
{
	void* a_class;
	libusb_hotplug_callback_fn_eiffel_feature feature;
};

void set_libusb_hotplug_callback_fn_entry (void* a_class, void* a_feature);

int call_libusb_hotplug_callback_fn (void *a_function, libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data);


#include <libusb.h>

typedef void (*libusb_transfer_cb_fn_eiffel_feature) (void *a_class, struct libusb_transfer *transfer);

void* get_libusb_transfer_cb_fn_stub ();

struct libusb_transfer_cb_fn_entry_struct
{
	void* a_class;
	libusb_transfer_cb_fn_eiffel_feature feature;
};

void set_libusb_transfer_cb_fn_entry (void* a_class, void* a_feature);

void call_libusb_transfer_cb_fn (void *a_function, struct libusb_transfer *transfer);


#endif
