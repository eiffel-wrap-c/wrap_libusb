note
	description: "Summary description for {LIBUSB_FUNCTIONS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=libusb api", "src=http://libusb.sourceforge.net/api-1.0/libusb_api.html", "protocol=uri"

class
	LIBUSB_FUNCTIONS

inherit

	LIBUSB_FUNCTIONS_API
		rename
			libusb_init as libusb_init_api,
			libusb_exit as libusb_exit_api,
			libusb_get_device_list as libusb_get_device_list_api,
			libusb_free_device_list as libusb_free_device_list_api
		end


feature -- Access

	libusb_init (ctx: detachable LIBUSB_CONTEXT_STRUCT_API): INTEGER
			-- Initialize libusb. This function must be called before calling any other libusb function.
			-- If you do not provide an output location for a context pointer, a default context will be created.
			-- If there was already a default context, it will be reused (and nothing will be initialized/reinitialized).
			-- ctx:	Optional output location for context pointer. Only valid on return code 0.
			-- 0 on success, or a LIBUSB_ERROR code on failure.
		local
			l_ptr: POINTER
		do
			Result := c_libusb_init ($l_ptr)
			if attached ctx and then l_ptr /= default_pointer then
				ctx.make_by_pointer (l_ptr)
			end
		end


	libusb_exit (ctx: detachable LIBUSB_CONTEXT_STRUCT_API)
			-- Deinitialize libusb. Should be called after closing all open devices and before your application terminates.
			-- ctx: The context to deinitialize, or NULL for the default context.
		local
			l_ptr: POINTER
		do
			if attached ctx then
				l_ptr := ctx.item
			end
			c_libusb_exit (l_ptr)
		end


	libusb_get_device_list (ctx: detachable LIBUSB_CONTEXT_STRUCT_API; list: LIBUSB_DEVICE_LIST): INTEGER
			-- Returns a list of USB devices currently attached to the system. This is your entry point into finding a USB device to operate.
			-- You are expected to unreference all the devices when you are done with them, and then free the list with libusb_free_device_list().
			-- Note that libusb_free_device_list() can unref all the devices for you. Be careful not to unreference a device you are about to open until after you have opened it.
			-- This return value of this function indicates the number of devices in the resultant list. The list is actually one element larger, as it is NULL-terminated.
			-- ctx	the context to operate on, or NULL for the default context
			-- list	output location for a list of devices. Must be later freed with libusb_free_device_list().
			-- Result: the number of devices in the outputted list, or any libusb_error according to errors encountered by the backend.
		local
			l_ctx: POINTER
			l_ptr: POINTER
			i: INTEGER
		do
			if attached ctx then
				l_ctx := ctx.item
			end
			Result := c_libusb_get_device_list (l_ctx, $l_ptr)
			list.set_item (l_ptr)
			from
				i := 0
			until
				i = Result
			loop
				list.force (create {LIBUSB_DEVICE_STRUCT_API}.make_by_pointer (libusb_device_at (l_ptr, i)))
				i := i + 1
			end

		end


	libusb_free_device_list (list: LIBUSB_DEVICE_LIST; a_ref: BOOLEAN)
			-- Frees a list of devices previously discovered using libusb_get_device_list().
			-- If the unref_devices parameter is set, the reference count of each device in the list is decremented by 1.
			-- list	 :the list to free
			-- a_ref :whether to unref the devices in the list
		do
			c_libusb_free_device_list (list.item, a_ref.to_integer)
		end


feature {NONE} -- Implementation


	libusb_device_at (a_pointer: POINTER; a_index: INTEGER):  POINTER
		external
			"C inline use <libusb.h>"
		alias
			"[
				libusb_device *device; 
				device = (libusb_device **)$a_pointer + $a_index;
				
				/*
				struct libusb_device_descriptor desc;
				libusb_device_handle *handle = NULL;
				char string[256];
				int ret;
				uint8_t i;

				ret = libusb_get_device_descriptor(device, &desc);
				if (ret < 0) {
					fprintf(stderr, "failed to get device descriptor");
					return;
				}

				printf("Dev (bus %u, device %u): %04X - %04X\n",
				       libusb_get_bus_number(device), libusb_get_device_address(device),
				       desc.idVendor, desc.idProduct);
				*/
				return device;
			]"
		end



end
