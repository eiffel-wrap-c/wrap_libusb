note
	description: "[
				Eiffel version of C libusb example program for hotplug API.
	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=hotplugtest", "src=https://github.com/libusb/libusb/blob/master/examples/hotplugtest.c", "protocol=uri"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			ret: INTEGER
			vendor_id: INTEGER
			product_id: INTEGER
			class_id: INTEGER
			callback: LIBUSB_HOTPLUG_CALLBACK_FN_DISPATCHER
			hotplug_callback_handle1: INTEGER
			hotplug_callback_handle2: INTEGER

		do
			if attached separate_character_option_value ('v') as l_val then
                print ("%N Vendor-id 'v' is: ")
                print (l_val + "%N")
            end
            if attached separate_character_option_value ('p') as l_val then
                print ("%N Product-id 'p' is: ")
                print (l_val + "%N")
            end
            if attached separate_character_option_value ('c') as l_val then
                print ("Class id 'h' is: ")
                print (l_val + "%N")
            end


            vendor_id  := 0x0951
			product_id := 0x1607
			class_id   := LIBUSB_HOTPLUG_MATCH_ANY



			ret := LUSB.libusb_init (Void)
			if ret < 0 then
				print("%NFailed to initialise libusb: " + LUSB.libusb_error_name(ret))
			else
				if LUSB.libusb_has_capability ({LIBUSB_CAPABILITY_ENUM_API}.LIBUSB_CAP_HAS_HOTPLUG) > 0 then

					create callback.make
					callback.register_callback_1 (agent hotplug_callback)
					ret := LUSB.libusb_hotplug_register_callback (Void, {LIBUSB_HOTPLUG_EVENT_ENUM_API}.LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED, 0, vendor_id,
																product_id, class_id, callback.c_dispatcher_1, default_pointer, $hotplug_callback_handle1)

					if {LIBUSB_ERROR_ENUM_API}.LIBUSB_SUCCESS /= ret  then
						print ("%NError registering callback")
					else
						callback.register_callback_2 (agent hotplug_callback_detach)
						ret := LUSB.libusb_hotplug_register_callback (Void, {LIBUSB_HOTPLUG_EVENT_ENUM_API}.LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT, 0, vendor_id,
																					product_id, class_id, callback.c_dispatcher_2, default_pointer, $hotplug_callback_handle2)

						if {LIBUSB_ERROR_ENUM_API}.LIBUSB_SUCCESS /= ret  then
							print ("%NError registering callback")
						else
							from
							until
								done = 2
							loop
								ret := LUSB.libusb_handle_events (Void)
								if (ret < 0) then
									print ("Libusb_handle_events() failed:" + LUSB.libusb_error_name(ret))
								end
							end

							if attached handle as l_handle then
								LUSB.libusb_close (l_handle)
							end
						end
					end
				else
					print ("Hotplug capabilites are not supported on this platform%N");
				end
			end
			LUSB.libusb_exit (Void)
		end

feature -- Callback

	hotplug_callback (ctx: POINTER; dev: POINTER; event: INTEGER; user_data: POINTER ): INTEGER
		local
			rc: INTEGER
			desc: LIBUSB_DEVICE_DESCRIPTOR_STRUCT_API
			ll_handle: LIBUSB_DEVICE_HANDLE_STRUCT_API
			l_dev: LIBUSB_DEVICE_STRUCT_API
		do
			create desc.make
			create l_dev.make_by_pointer (dev)
			rc := LUSB.libusb_get_device_descriptor(l_dev, desc);
			if {LIBUSB_ERROR_ENUM_API}.LIBUSB_SUCCESS /= rc then
				print ("%NError getting device descriptor")
			end
			print ("%NDevice attached: " + desc.idVendor.to_hex_string + ":" + desc.idProduct.to_hex_string)
			if attached handle as l_handle then
				LUSB.libusb_close (l_handle)
				handle := Void
			end

			create ll_handle.make
			rc := LUSB.libusb_open (l_dev, ll_handle)
			if {LIBUSB_ERROR_ENUM_API}.LIBUSB_SUCCESS = rc   then
				create handle.make_by_pointer (ll_handle.item)
			else
				print ("%NError opening device")
			end
			done := done + 1
			Result := 0
		end

	hotplug_callback_detach (ctx: POINTER; dev: POINTER; event: INTEGER; user_data: POINTER ): INTEGER
		do
			print ("%NDevice detached");

			if attached handle as l_handle then
				LUSB.libusb_close (l_handle)
				handle := Void
			end
			done := done + 1
			Result := 0
		end

feature {NONE} -- Implementation

	LIBUSB_HOTPLUG_MATCH_ANY: INTEGER = -1
		-- Wildcard matching for hotplug events.

	LUSB: LIBUSB_FUNCTIONS
		do
			create Result
		end

	handle: detachable LIBUSB_DEVICE_HANDLE_STRUCT_API

	done: INTEGER

end
