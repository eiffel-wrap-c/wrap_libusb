#include <ewg_eiffel.h>
#include <ewg_libusb_callback_c_glue_code.h>

#ifdef _MSC_VER
#pragma warning (disable:4715) // Not all control paths return a value
#endif
void* libusb_log_cb_object =  NULL;
libusb_log_cb_eiffel_feature libusb_log_cb_address_1 = NULL;
libusb_log_cb_eiffel_feature libusb_log_cb_address_2 = NULL;
libusb_log_cb_eiffel_feature libusb_log_cb_address_3 = NULL;

void set_libusb_log_cb_object (void* a_object)
{
	if (a_object) {
		libusb_log_cb_object = eif_protect(a_object);
	} else { 
		libusb_log_cb_object = NULL;
	}
}

void release_libusb_log_cb_object ()
{
	eif_wean (libusb_log_cb_object);
}

void libusb_log_cb_stub_1 (libusb_context *ctx, enum libusb_log_level level, char const *str)
{
	if (libusb_log_cb_object != NULL && libusb_log_cb_address_1 != NULL)
	{
		libusb_log_cb_address_1 (eif_access(libusb_log_cb_object), ctx, level, str);
	}
}

void libusb_log_cb_stub_2 (libusb_context *ctx, enum libusb_log_level level, char const *str)
{
	if (libusb_log_cb_object != NULL && libusb_log_cb_address_2 != NULL)
	{
		libusb_log_cb_address_2 (eif_access(libusb_log_cb_object), ctx, level, str);
	}
}

void libusb_log_cb_stub_3 (libusb_context *ctx, enum libusb_log_level level, char const *str)
{
	if (libusb_log_cb_object != NULL && libusb_log_cb_address_3 != NULL)
	{
		libusb_log_cb_address_3 (eif_access(libusb_log_cb_object), ctx, level, str);
	}
}

void set_libusb_log_cb_entry_1 (void* a_feature){
	libusb_log_cb_address_1 = (libusb_log_cb_eiffel_feature) a_feature;
}

void set_libusb_log_cb_entry_2 (void* a_feature){
	libusb_log_cb_address_2 = (libusb_log_cb_eiffel_feature) a_feature;
}

void set_libusb_log_cb_entry_3 (void* a_feature){
	libusb_log_cb_address_3 = (libusb_log_cb_eiffel_feature) a_feature;
}

void* get_libusb_log_cb_stub_1 (){
	return (void*) libusb_log_cb_stub_1;
}

void* get_libusb_log_cb_stub_2 (){
	return (void*) libusb_log_cb_stub_2;
}

void* get_libusb_log_cb_stub_3 (){
	return (void*) libusb_log_cb_stub_3;
}

void call_libusb_log_cb (void *a_function, libusb_context *ctx, enum libusb_log_level level, char const *str)
{
	((void (*) (libusb_context *ctx, enum libusb_log_level level, char const *str))a_function) (ctx, level, str);
}

void* libusb_pollfd_added_cb_object =  NULL;
libusb_pollfd_added_cb_eiffel_feature libusb_pollfd_added_cb_address_1 = NULL;
libusb_pollfd_added_cb_eiffel_feature libusb_pollfd_added_cb_address_2 = NULL;
libusb_pollfd_added_cb_eiffel_feature libusb_pollfd_added_cb_address_3 = NULL;

void set_libusb_pollfd_added_cb_object (void* a_object)
{
	if (a_object) {
		libusb_pollfd_added_cb_object = eif_protect(a_object);
	} else { 
		libusb_pollfd_added_cb_object = NULL;
	}
}

void release_libusb_pollfd_added_cb_object ()
{
	eif_wean (libusb_pollfd_added_cb_object);
}

void libusb_pollfd_added_cb_stub_1 (int fd, short events, void *user_data)
{
	if (libusb_pollfd_added_cb_object != NULL && libusb_pollfd_added_cb_address_1 != NULL)
	{
		libusb_pollfd_added_cb_address_1 (eif_access(libusb_pollfd_added_cb_object), fd, events, user_data);
	}
}

void libusb_pollfd_added_cb_stub_2 (int fd, short events, void *user_data)
{
	if (libusb_pollfd_added_cb_object != NULL && libusb_pollfd_added_cb_address_2 != NULL)
	{
		libusb_pollfd_added_cb_address_2 (eif_access(libusb_pollfd_added_cb_object), fd, events, user_data);
	}
}

void libusb_pollfd_added_cb_stub_3 (int fd, short events, void *user_data)
{
	if (libusb_pollfd_added_cb_object != NULL && libusb_pollfd_added_cb_address_3 != NULL)
	{
		libusb_pollfd_added_cb_address_3 (eif_access(libusb_pollfd_added_cb_object), fd, events, user_data);
	}
}

void set_libusb_pollfd_added_cb_entry_1 (void* a_feature){
	libusb_pollfd_added_cb_address_1 = (libusb_pollfd_added_cb_eiffel_feature) a_feature;
}

void set_libusb_pollfd_added_cb_entry_2 (void* a_feature){
	libusb_pollfd_added_cb_address_2 = (libusb_pollfd_added_cb_eiffel_feature) a_feature;
}

void set_libusb_pollfd_added_cb_entry_3 (void* a_feature){
	libusb_pollfd_added_cb_address_3 = (libusb_pollfd_added_cb_eiffel_feature) a_feature;
}

void* get_libusb_pollfd_added_cb_stub_1 (){
	return (void*) libusb_pollfd_added_cb_stub_1;
}

void* get_libusb_pollfd_added_cb_stub_2 (){
	return (void*) libusb_pollfd_added_cb_stub_2;
}

void* get_libusb_pollfd_added_cb_stub_3 (){
	return (void*) libusb_pollfd_added_cb_stub_3;
}

void call_libusb_pollfd_added_cb (void *a_function, int fd, short events, void *user_data)
{
	((void (*) (int fd, short events, void *user_data))a_function) (fd, events, user_data);
}

void* libusb_pollfd_removed_cb_object =  NULL;
libusb_pollfd_removed_cb_eiffel_feature libusb_pollfd_removed_cb_address_1 = NULL;
libusb_pollfd_removed_cb_eiffel_feature libusb_pollfd_removed_cb_address_2 = NULL;
libusb_pollfd_removed_cb_eiffel_feature libusb_pollfd_removed_cb_address_3 = NULL;

void set_libusb_pollfd_removed_cb_object (void* a_object)
{
	if (a_object) {
		libusb_pollfd_removed_cb_object = eif_protect(a_object);
	} else { 
		libusb_pollfd_removed_cb_object = NULL;
	}
}

void release_libusb_pollfd_removed_cb_object ()
{
	eif_wean (libusb_pollfd_removed_cb_object);
}

void libusb_pollfd_removed_cb_stub_1 (int fd, void *user_data)
{
	if (libusb_pollfd_removed_cb_object != NULL && libusb_pollfd_removed_cb_address_1 != NULL)
	{
		libusb_pollfd_removed_cb_address_1 (eif_access(libusb_pollfd_removed_cb_object), fd, user_data);
	}
}

void libusb_pollfd_removed_cb_stub_2 (int fd, void *user_data)
{
	if (libusb_pollfd_removed_cb_object != NULL && libusb_pollfd_removed_cb_address_2 != NULL)
	{
		libusb_pollfd_removed_cb_address_2 (eif_access(libusb_pollfd_removed_cb_object), fd, user_data);
	}
}

void libusb_pollfd_removed_cb_stub_3 (int fd, void *user_data)
{
	if (libusb_pollfd_removed_cb_object != NULL && libusb_pollfd_removed_cb_address_3 != NULL)
	{
		libusb_pollfd_removed_cb_address_3 (eif_access(libusb_pollfd_removed_cb_object), fd, user_data);
	}
}

void set_libusb_pollfd_removed_cb_entry_1 (void* a_feature){
	libusb_pollfd_removed_cb_address_1 = (libusb_pollfd_removed_cb_eiffel_feature) a_feature;
}

void set_libusb_pollfd_removed_cb_entry_2 (void* a_feature){
	libusb_pollfd_removed_cb_address_2 = (libusb_pollfd_removed_cb_eiffel_feature) a_feature;
}

void set_libusb_pollfd_removed_cb_entry_3 (void* a_feature){
	libusb_pollfd_removed_cb_address_3 = (libusb_pollfd_removed_cb_eiffel_feature) a_feature;
}

void* get_libusb_pollfd_removed_cb_stub_1 (){
	return (void*) libusb_pollfd_removed_cb_stub_1;
}

void* get_libusb_pollfd_removed_cb_stub_2 (){
	return (void*) libusb_pollfd_removed_cb_stub_2;
}

void* get_libusb_pollfd_removed_cb_stub_3 (){
	return (void*) libusb_pollfd_removed_cb_stub_3;
}

void call_libusb_pollfd_removed_cb (void *a_function, int fd, void *user_data)
{
	((void (*) (int fd, void *user_data))a_function) (fd, user_data);
}

void* libusb_hotplug_callback_fn_object =  NULL;
libusb_hotplug_callback_fn_eiffel_feature libusb_hotplug_callback_fn_address_1 = NULL;
libusb_hotplug_callback_fn_eiffel_feature libusb_hotplug_callback_fn_address_2 = NULL;
libusb_hotplug_callback_fn_eiffel_feature libusb_hotplug_callback_fn_address_3 = NULL;

void set_libusb_hotplug_callback_fn_object (void* a_object)
{
	if (a_object) {
		libusb_hotplug_callback_fn_object = eif_protect(a_object);
	} else { 
		libusb_hotplug_callback_fn_object = NULL;
	}
}

void release_libusb_hotplug_callback_fn_object ()
{
	eif_wean (libusb_hotplug_callback_fn_object);
}

int libusb_hotplug_callback_fn_stub_1 (libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data)
{
	if (libusb_hotplug_callback_fn_object != NULL && libusb_hotplug_callback_fn_address_1 != NULL)
	{
		return libusb_hotplug_callback_fn_address_1 (eif_access(libusb_hotplug_callback_fn_object), ctx, device, event, user_data);
	}
}

int libusb_hotplug_callback_fn_stub_2 (libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data)
{
	if (libusb_hotplug_callback_fn_object != NULL && libusb_hotplug_callback_fn_address_2 != NULL)
	{
		return libusb_hotplug_callback_fn_address_2 (eif_access(libusb_hotplug_callback_fn_object), ctx, device, event, user_data);
	}
}

int libusb_hotplug_callback_fn_stub_3 (libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data)
{
	if (libusb_hotplug_callback_fn_object != NULL && libusb_hotplug_callback_fn_address_3 != NULL)
	{
		return libusb_hotplug_callback_fn_address_3 (eif_access(libusb_hotplug_callback_fn_object), ctx, device, event, user_data);
	}
}

void set_libusb_hotplug_callback_fn_entry_1 (void* a_feature){
	libusb_hotplug_callback_fn_address_1 = (libusb_hotplug_callback_fn_eiffel_feature) a_feature;
}

void set_libusb_hotplug_callback_fn_entry_2 (void* a_feature){
	libusb_hotplug_callback_fn_address_2 = (libusb_hotplug_callback_fn_eiffel_feature) a_feature;
}

void set_libusb_hotplug_callback_fn_entry_3 (void* a_feature){
	libusb_hotplug_callback_fn_address_3 = (libusb_hotplug_callback_fn_eiffel_feature) a_feature;
}

void* get_libusb_hotplug_callback_fn_stub_1 (){
	return (void*) libusb_hotplug_callback_fn_stub_1;
}

void* get_libusb_hotplug_callback_fn_stub_2 (){
	return (void*) libusb_hotplug_callback_fn_stub_2;
}

void* get_libusb_hotplug_callback_fn_stub_3 (){
	return (void*) libusb_hotplug_callback_fn_stub_3;
}

int call_libusb_hotplug_callback_fn (void *a_function, libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data)
{
	return ((int (*) (libusb_context *ctx, libusb_device *device, libusb_hotplug_event event, void *user_data))a_function) (ctx, device, event, user_data);
}

void* libusb_transfer_cb_fn_object =  NULL;
libusb_transfer_cb_fn_eiffel_feature libusb_transfer_cb_fn_address_1 = NULL;
libusb_transfer_cb_fn_eiffel_feature libusb_transfer_cb_fn_address_2 = NULL;
libusb_transfer_cb_fn_eiffel_feature libusb_transfer_cb_fn_address_3 = NULL;

void set_libusb_transfer_cb_fn_object (void* a_object)
{
	if (a_object) {
		libusb_transfer_cb_fn_object = eif_protect(a_object);
	} else { 
		libusb_transfer_cb_fn_object = NULL;
	}
}

void release_libusb_transfer_cb_fn_object ()
{
	eif_wean (libusb_transfer_cb_fn_object);
}

void libusb_transfer_cb_fn_stub_1 (struct libusb_transfer *transfer)
{
	if (libusb_transfer_cb_fn_object != NULL && libusb_transfer_cb_fn_address_1 != NULL)
	{
		libusb_transfer_cb_fn_address_1 (eif_access(libusb_transfer_cb_fn_object), transfer);
	}
}

void libusb_transfer_cb_fn_stub_2 (struct libusb_transfer *transfer)
{
	if (libusb_transfer_cb_fn_object != NULL && libusb_transfer_cb_fn_address_2 != NULL)
	{
		libusb_transfer_cb_fn_address_2 (eif_access(libusb_transfer_cb_fn_object), transfer);
	}
}

void libusb_transfer_cb_fn_stub_3 (struct libusb_transfer *transfer)
{
	if (libusb_transfer_cb_fn_object != NULL && libusb_transfer_cb_fn_address_3 != NULL)
	{
		libusb_transfer_cb_fn_address_3 (eif_access(libusb_transfer_cb_fn_object), transfer);
	}
}

void set_libusb_transfer_cb_fn_entry_1 (void* a_feature){
	libusb_transfer_cb_fn_address_1 = (libusb_transfer_cb_fn_eiffel_feature) a_feature;
}

void set_libusb_transfer_cb_fn_entry_2 (void* a_feature){
	libusb_transfer_cb_fn_address_2 = (libusb_transfer_cb_fn_eiffel_feature) a_feature;
}

void set_libusb_transfer_cb_fn_entry_3 (void* a_feature){
	libusb_transfer_cb_fn_address_3 = (libusb_transfer_cb_fn_eiffel_feature) a_feature;
}

void* get_libusb_transfer_cb_fn_stub_1 (){
	return (void*) libusb_transfer_cb_fn_stub_1;
}

void* get_libusb_transfer_cb_fn_stub_2 (){
	return (void*) libusb_transfer_cb_fn_stub_2;
}

void* get_libusb_transfer_cb_fn_stub_3 (){
	return (void*) libusb_transfer_cb_fn_stub_3;
}

void call_libusb_transfer_cb_fn (void *a_function, struct libusb_transfer *transfer)
{
	((void (*) (struct libusb_transfer *transfer))a_function) (transfer);
}

