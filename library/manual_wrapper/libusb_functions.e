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
			libusb_free_device_list as libusb_free_device_list_api,
			libusb_open as libusb_open_api,
			libusb_error_name as libusb_error_name_api,
			libusb_get_config_descriptor as libusb_get_config_descriptor_api,
			libusb_get_string_descriptor_ascii as libusb_get_string_descriptor_ascii_api,
			libusb_get_ss_endpoint_companion_descriptor as libusb_get_ss_endpoint_companion_descriptor_api,
			libusb_get_bos_descriptor as libusb_get_bos_descriptor_api,
			libusb_get_usb_2_0_extension_descriptor as libusb_get_usb_2_0_extension_descriptor_api,
			libusb_get_ss_usb_device_capability_descriptor as libusb_get_ss_usb_device_capability_descriptor_api,
			libusb_get_port_numbers as libusb_get_port_numbers_api,
			libusb_hotplug_register_callback as libusb_hotplug_register_callback_api,
			libusb_handle_events as libusb_handle_events_api
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
			i : INTEGER
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


	libusb_open (dev: LIBUSB_DEVICE_STRUCT_API; dev_handle: LIBUSB_DEVICE_HANDLE_STRUCT_API): INTEGER
			-- Open a device and obtain a device handle. A handle allows you to perform I/O on the device in question.
			-- Internally, this function adds a reference to the device and makes it available to you through libusb_get_device(). This reference is removed during libusb_close().
			-- This is a non-blocking function; no requests are sent over the bus.
			-- dev	the device to open
			-- dev_handle	output location for the returned device handle pointer. Only populated when the return code is 0.
		local
			l_ptr: POINTER
		do
			Result := c_libusb_open (dev.item, $l_ptr)
			if l_ptr /= default_pointer then
				dev_handle.make_by_pointer (l_ptr)
			end
		end

	libusb_error_name (errcode: INTEGER): STRING
			-- Returns a constant NULL-terminated string with the ASCII name of a libusb error or transfer status code.
		local
			l_ptr: POINTER
		do
			Result := "UNKNOWN"
			l_ptr := libusb_error_name_api (errcode)
			if l_ptr /= default_pointer then
				Result := (create {C_STRING}.make_by_pointer (l_ptr)).string
			end
		end

	libusb_get_config_descriptor (dev: LIBUSB_DEVICE_STRUCT_API; config_index: INTEGER; config: LIBUSB_CONFIG_DESCRIPTOR_STRUCT_API): INTEGER
			-- Get a USB configuration descriptor based on its index. This is a non-blocking function which does not involve any requests being sent to the device.
			-- dev	a device
			-- config_index	the index of the configuration you wish to retrieve
			-- config	output location for the USB configuration descriptor. Only valid if 0 was returned. Must be freed with libusb_free_config_descriptor() after use.
			-- Result   0 on success LIBUSB_ERROR_NOT_FOUND if the configuration does not exist, another LIBUSB_ERROR code on error
		local
			l_ptr: POINTER
		do
			Result := c_libusb_get_config_descriptor (dev.item, config_index, $l_ptr)
			if l_ptr /= default_pointer then
				config.make_by_pointer (l_ptr)
			end
		end

	libusb_get_string_descriptor_ascii (dev_handle: LIBUSB_DEVICE_HANDLE_STRUCT_API; desc_index: INTEGER; data: STRING; length: INTEGER): INTEGER
			-- Retrieve a string descriptor in C style ASCII.
			-- Wrapper around libusb_get_string_descriptor(). Uses the first language supported by the device.
			-- dev_handle	a device handle
			-- desc_index	the index of the descriptor to retrieve
			-- data	output buffer for ASCII string descriptor
			-- length	size of data buffer
			-- Result: number of bytes returned in data, or LIBUSB_ERROR code on failure
		do

			Result := c_libusb_get_string_descriptor_ascii (dev_handle.item, desc_index, data.area.base_address, length)
			data.from_c (data.area.base_address)
		end

	libusb_get_ss_endpoint_companion_descriptor (ctx: detachable LIBUSB_CONTEXT_STRUCT_API; endpoint: LIBUSB_ENDPOINT_DESCRIPTOR_STRUCT_API; ep_comp: LIBUSB_SS_ENDPOINT_COMPANION_DESCRIPTOR_STRUCT_API): INTEGER
			-- Get an endpoints superspeed endpoint companion descriptor (if any)
			-- ctx	the context to operate on, or NULL for the default context
			-- endpoint	endpoint descriptor from which to get the superspeed endpoint companion descriptor
			-- ep_comp	output location for the superspeed endpoint companion descriptor. Only valid if 0 was returned. Must be freed with libusb_free_ss_endpoint_companion_descriptor() after use.
			-- Result:     0 on success  LIBUSB_ERROR_NOT_FOUND if the configuration does not exist another LIBUSB_ERROR code on error.  			
		local
			l_ptr: POINTER
			l_ctx: POINTER
		do
			if attached ctx then
				l_ctx := ctx.item
			end
			Result := c_libusb_get_ss_endpoint_companion_descriptor (l_ctx, endpoint.item, $l_ptr)
			if l_ptr /= default_pointer then
				ep_comp.make_by_pointer (l_ptr)
			end
		end

	libusb_get_bos_descriptor (dev_handle: LIBUSB_DEVICE_HANDLE_STRUCT_API; bos: LIBUSB_BOS_DESCRIPTOR_STRUCT_API): INTEGER
			-- Get a Binary Object Store (BOS) descriptor This is a BLOCKING function, which will send requests to the device.
			-- dev_handle	the handle of an open libusb device
			-- bos	output location for the BOS descriptor. Only valid if 0 was returned. Must be freed with libusb_free_bos_descriptor() after use.
			-- Result     0 on success  LIBUSB_ERROR_NOT_FOUND if the device doesn't have a BOS descriptor another LIBUSB_ERROR code on error 		
		local
			l_ptr: POINTER
		do
			Result := c_libusb_get_bos_descriptor (dev_handle.item, $l_ptr)
			if l_ptr /= default_pointer then
				bos.make_by_pointer (l_ptr)
			end
		end

	libusb_get_usb_2_0_extension_descriptor (ctx: detachable LIBUSB_CONTEXT_STRUCT_API; dev_cap: LIBUSB_BOS_DEV_CAPABILITY_DESCRIPTOR_STRUCT_API; usb_2_0_extension: LIBUSB_USB_2_0_EXTENSION_DESCRIPTOR_STRUCT_API): INTEGER
			-- Get an USB 2.0 Extension descriptor
			-- ctx	the context to operate on, or NULL for the default context
			-- dev_cap	Device Capability descriptor with a bDevCapabilityType of libusb_capability_type::LIBUSB_BT_USB_2_0_EXTENSION LIBUSB_BT_USB_2_0_EXTENSION
			-- usb_2_0_extension	output location for the USB 2.0 Extension descriptor. Only valid if 0 was returned. Must be freed with libusb_free_usb_2_0_extension_descriptor() after use.
			-- Result    0 on success  a LIBUSB_ERROR code on error
		local
			l_ctx: POINTER
			l_ptr: POINTER
		do
			if attached ctx then
				l_ctx := ctx.item
			end
			Result := c_libusb_get_usb_2_0_extension_descriptor (l_ctx, dev_cap.item, $l_ptr)
			if l_ptr /= default_pointer then
				usb_2_0_extension.make_by_pointer (l_ptr)
			end
		end

	libusb_get_ss_usb_device_capability_descriptor (ctx: detachable LIBUSB_CONTEXT_STRUCT_API; dev_cap: LIBUSB_BOS_DEV_CAPABILITY_DESCRIPTOR_STRUCT_API; ss_usb_device_cap: LIBUSB_SS_USB_DEVICE_CAPABILITY_DESCRIPTOR_STRUCT_API): INTEGER
			-- Get a SuperSpeed USB Device Capability descriptor.
			-- ctx	the context to operate on, or NULL for the default context
			-- dev_cap	Device Capability descriptor with a bDevCapabilityType of libusb_capability_type::LIBUSB_BT_SS_USB_DEVICE_CAPABILITY LIBUSB_BT_SS_USB_DEVICE_CAPABILITY
			-- ss_usb_device_cap	output location for the SuperSpeed USB Device Capability descriptor. Only valid if 0 was returned. Must be freed with libusb_free_ss_usb_device_capability_descriptor() after use.
		local
			l_ctx: POINTER
			l_ptr: POINTER
		do
			if attached ctx then
				l_ctx := ctx.item
			end
			Result := c_libusb_get_ss_usb_device_capability_descriptor (l_ctx, dev_cap.item, $l_ptr)
			if l_ptr /= default_pointer then
				ss_usb_device_cap.make_by_pointer (l_ptr)
			end
		end

	libusb_get_port_numbers (dev: LIBUSB_DEVICE_STRUCT_API; port_numbers: STRING; port_numbers_len: INTEGER): INTEGER
		do
			Result := c_libusb_get_port_numbers (dev.item, port_numbers.area.base_address, port_numbers_len)
			port_numbers.from_c (port_numbers.area.base_address)
		end


	libusb_hotplug_register_callback (ctx: detachable LIBUSB_CONTEXT_STRUCT_API; events: INTEGER; flags: INTEGER; vendor_id: INTEGER; product_id: INTEGER; dev_class: INTEGER; cb_fn: POINTER; user_data: POINTER; callback_handle: POINTER): INTEGER
			-- Register a hotplug callback function
			--
			-- Register a callback with the libusb_context. The callback will fire when a matching event occurs on a matching device.
			-- The callback is armed until either it is deregistered with libusb_hotplug_deregister_callback() or the supplied callback returns 1 to indicate it is finished processing events.
			--
			-- If the LIBUSB_HOTPLUG_ENUMERATE is passed the callback will be called with a LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED for all devices already plugged into the machine.
			-- Note that libusb modifies its internal device list from a separate thread, while calling hotplug callbacks from libusb_handle_events(),
			-- so it is possible for a device to already be present on, or removed from, its internal device list, while the hotplug callbacks still need to be dispatched.
			-- This means that when using LIBUSB_HOTPLUG_ENUMERATE, your callback may be called twice for the arrival of the same device,
			-- once from libusb_hotplug_register_callback() and once from libusb_handle_events(); and/or your callback may be called for the removal of a device for which an arrived call was never made.
			--
			-- Since version 1.0.16, LIBUSB_API_VERSION >= 0x01000102
			--
			--  [in]	ctx	context to register this callback with
  			--  [in]	events	bitwise or of events that will trigger this callback. See libusb_hotplug_event
			--  [in]	flags	hotplug callback flags. See libusb_hotplug_flag
			--  [in]	vendor_id	the vendor id to match or LIBUSB_HOTPLUG_MATCH_ANY
			--  [in]	product_id	the product id to match or LIBUSB_HOTPLUG_MATCH_ANY
			--  [in]	dev_class	the device class to match or LIBUSB_HOTPLUG_MATCH_ANY
			--  [in]	cb_fn	the function to be invoked on a matching event/device
			--  [in]	user_data	user data to pass to the callback function
			--  [out]	callback_handle	pointer to store the handle of the allocated callback (can be NULL)
            --
			-- Result
			--    LIBUSB_SUCCESS on success LIBUSB_ERROR code on failure
		local
			l_ctx: POINTER
		do
			if attached ctx then
				l_ctx := ctx.item
			end
			Result := c_libusb_hotplug_register_callback (l_ctx, events, flags, vendor_id, product_id, dev_class, cb_fn, user_data, callback_handle)
		end


	libusb_handle_events (ctx: detachable LIBUSB_CONTEXT_STRUCT_API): INTEGER
		local
			l_ctx: POINTER
		do
			if attached ctx then
				l_ctx := ctx.item
			end
			Result := c_libusb_handle_events (l_ctx)
		end

feature {NONE} -- Implementation

	libusb_device_at (a_pointer: POINTER; a_index: INTEGER):  POINTER
		external
			"C inline use <libusb.h>"
		alias
			"[
				libusb_device *device;
				libusb_device **devs;
				devs = $a_pointer;

				device = devs [$a_index];

				/*struct libusb_device_descriptor desc;
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


				//ret = libusb_open(device, &handle);
				
				//printf ("\nOpen return %d\n", ret);
				return device;
			]"
		end


end
