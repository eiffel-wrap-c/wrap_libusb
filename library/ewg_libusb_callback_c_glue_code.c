#include <ewg_eiffel.h>
#include <ewg_libusb_callback_c_glue_code.h>

#ifdef _MSC_VER
#pragma warning (disable:4715) // Not all control paths return a value
#endif
struct libusb_log_cb_entry_struct libusb_log_cb_entry = {NULL, NULL};
#ifdef _MSC_VER
void __stdcall libusb_log_cb_stub (libusb_context *ctx, enum libusb_log_level level, char const *str)
#else
void libusb_log_cb_stub (libusb_context *ctx, enum libusb_log_level level, char const *str)
#endif
{
	if (libusb_log_cb_entry.a_class != NULL && libusb_log_cb_entry.feature != NULL)
	{
		libusb_log_cb_entry.feature (eif_access(libusb_log_cb_entry.a_class), ctx, level, str);
	}
}

void set_libusb_log_cb_entry (void* a_class, void* a_feature)
{
	libusb_log_cb_entry.a_class = eif_adopt(a_class);
	libusb_log_cb_entry.feature = (libusb_log_cb_eiffel_feature) a_feature;
}

void* get_libusb_log_cb_stub ()
{
	return (void*) libusb_log_cb_stub;
}

void call_libusb_log_cb (void *a_function, libusb_context *ctx, enum libusb_log_level level, char const *str)
{
	#ifdef _MSC_VER
	((void (__stdcall *) (libusb_context *ctx, enum libusb_log_level level, char const *str))a_function) (ctx, level, str);
	#else
	((void (*) (libusb_context *ctx, enum libusb_log_level level, char const *str))a_function) (ctx, level, str);	
	#endif
}

struct libusb_pollfd_added_cb_entry_struct libusb_pollfd_added_cb_entry = {NULL, NULL};

#ifdef _MSC_VER
void __stdcall libusb_pollfd_added_cb_stub (int fd, short events, void *user_data)
#else
void libusb_pollfd_added_cb_stub (int fd, short events, void *user_data)
#endif
{
	if (libusb_pollfd_added_cb_entry.a_class != NULL && libusb_pollfd_added_cb_entry.feature != NULL)
	{
		libusb_pollfd_added_cb_entry.feature (eif_access(libusb_pollfd_added_cb_entry.a_class), fd, events, user_data);
	}
}

void set_libusb_pollfd_added_cb_entry (void* a_class, void* a_feature)
{
	libusb_pollfd_added_cb_entry.a_class = eif_adopt(a_class);
	libusb_pollfd_added_cb_entry.feature = (libusb_pollfd_added_cb_eiffel_feature) a_feature;
}

void* get_libusb_pollfd_added_cb_stub ()
{
	return (void*) libusb_pollfd_added_cb_stub;
}

void call_libusb_pollfd_added_cb (void *a_function, int fd, short events, void *user_data)
{
	#ifdef _MSC_VER
	((void (__stdcall *) (int fd, short events, void *user_data))a_function) (fd, events, user_data);
	#else
	((void (*) (int fd, short events, void *user_data))a_function) (fd, events, user_data);
	#endif
}

struct libusb_pollfd_removed_cb_entry_struct libusb_pollfd_removed_cb_entry = {NULL, NULL};

#ifdef _MSC_VER
void __stdcall libusb_pollfd_removed_cb_stub (int fd, void *user_data)
#else
void libusb_pollfd_removed_cb_stub (int fd, void *user_data)
#endif
{
	if (libusb_pollfd_removed_cb_entry.a_class != NULL && libusb_pollfd_removed_cb_entry.feature != NULL)
	{
		libusb_pollfd_removed_cb_entry.feature (eif_access(libusb_pollfd_removed_cb_entry.a_class), fd, user_data);
	}
}

void set_libusb_pollfd_removed_cb_entry (void* a_class, void* a_feature)
{
	libusb_pollfd_removed_cb_entry.a_class = eif_adopt(a_class);
	libusb_pollfd_removed_cb_entry.feature = (libusb_pollfd_removed_cb_eiffel_feature) a_feature;
}

void* get_libusb_pollfd_removed_cb_stub ()
{
	return (void*) libusb_pollfd_removed_cb_stub;
}

void call_libusb_pollfd_removed_cb (void *a_function, int fd, void *user_data)
{
	#ifdef _MSC_VER
	((void (__stdcall *) (int fd, void *user_data))a_function) (fd, user_data);
	#else
	((void (*) (int fd, void *user_data))a_function) (fd, user_data);
	#endif
}

struct libusb_hotplug_callback_fn_entry_struct libusb_hotplug_callback_fn_entry = {NULL, NULL};

#ifdef _MSC_VER
int __stdcall libusb_hotplug_callback_fn_stub (libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data)
#else
int libusb_hotplug_callback_fn_stub (libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data)
#endif
{
	if (libusb_hotplug_callback_fn_entry.a_class != NULL && libusb_hotplug_callback_fn_entry.feature != NULL)
	{
		return ((libusb_hotplug_callback_fn_eiffel_feature)eif_access(libusb_hotplug_callback_fn_entry.feature) )(eif_access(libusb_hotplug_callback_fn_entry.a_class), ctx, device, event, user_data);
	}
}

void set_libusb_hotplug_callback_fn_entry (void* a_class, void* a_feature)
{
	libusb_hotplug_callback_fn_entry.a_class = eif_adopt(a_class);
	libusb_hotplug_callback_fn_entry.feature = eif_protect ((libusb_hotplug_callback_fn_eiffel_feature) a_feature);
}

void* get_libusb_hotplug_callback_fn_stub ()
{
	return (void*) libusb_hotplug_callback_fn_stub;
}

int call_libusb_hotplug_callback_fn (void *a_function, libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data)
{
	#ifdef _MSC_VER
	return ((int (__stdcall *) (libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data))a_function) (ctx, device, event, user_data);
	#else
	return ((int (*) (libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data))a_function) (ctx, device, event, user_data);
	#endif
}

struct libusb_transfer_cb_fn_entry_struct libusb_transfer_cb_fn_entry = {NULL, NULL};

#ifdef _MSC_VER
void __stdcall libusb_transfer_cb_fn_stub (struct libusb_transfer *transfer)
#else
void libusb_transfer_cb_fn_stub (struct libusb_transfer *transfer)
#endif
{
	if (libusb_transfer_cb_fn_entry.a_class != NULL && libusb_transfer_cb_fn_entry.feature != NULL)
	{
		libusb_transfer_cb_fn_entry.feature (eif_access(libusb_transfer_cb_fn_entry.a_class), transfer);
	}
}

void set_libusb_transfer_cb_fn_entry (void* a_class, void* a_feature)
{
	libusb_transfer_cb_fn_entry.a_class = eif_adopt(a_class);
	libusb_transfer_cb_fn_entry.feature = (libusb_transfer_cb_fn_eiffel_feature) a_feature;
}

void* get_libusb_transfer_cb_fn_stub ()
{
	return (void*) libusb_transfer_cb_fn_stub;
}

void call_libusb_transfer_cb_fn (void *a_function, struct libusb_transfer *transfer)
{
	#ifdef _MSC_VER
	((void (__stdcall *) (struct libusb_transfer *transfer))a_function) (transfer);
	#else
	((void (*) (struct libusb_transfer *transfer))a_function) (transfer);
	#endif
}

