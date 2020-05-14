class APPLICATION

create
	make

feature {NONE} -- Initialization

	make
		do
			test_initialize
			test_device_list
			test_hotplug_capability
		end

	test_initialize
		local
			ret: INTEGER
			ctx: LIBUSB_CONTEXT_STRUCT_API
		do
			ret := {LIBUSB_FUNCTIONS}.libusb_init (void)
			check success: ret = 0 end
			{LIBUSB_FUNCTIONS}.libusb_exit (void)

			create ctx.make

			ret := {LIBUSB_FUNCTIONS}.libusb_init (ctx)
			check success: ret = 0 end
			{LIBUSB_FUNCTIONS}.libusb_exit (ctx)
		end

	test_device_list
		local
			ret: INTEGER
			list: LIBUSB_DEVICE_LIST
			i: INTEGER
			desc: LIBUSB_DEVICE_DESCRIPTOR_STRUCT_API
			handle: LIBUSB_DEVICE_HANDLE_STRUCT_API
			data: STRING
			length: INTEGER
		do
			ret := {LIBUSB_FUNCTIONS}.libusb_init (Void)
			check success: ret = 0 end

			create list
			ret := {LIBUSB_FUNCTIONS}.libusb_get_device_list (Void, list)

			if ret < 0 then
				print ("Can't get the device list")
				-- Todo print the error message
			else
				from
					i := 1
				until
					i > list.count
				loop
					create desc.make
					ret :=  {LIBUSB_FUNCTIONS}.libusb_get_device_descriptor (list.at (i), desc)
					if ret < 0 then
						print ("%N Failed to get device descriptor")
					end
					print ("%N Dev (bus " +  {LIBUSB_FUNCTIONS}.libusb_get_bus_number (list.at (i)).out + ", device " + {LIBUSB_FUNCTIONS}.libusb_get_device_address (list.at (i)).out + " ): " +
					desc.idvendor.to_hex_string +  " " + desc.idproduct.to_hex_string)


					create handle.make
	   				ret := {LIBUSB_FUNCTIONS}.libusb_open (list.at (i), handle)
	   				if ret = {LIBUSB_ERROR_ENUM_API}.libusb_success then
	   					length :=  256
	   					create data.make (length)
	   					if desc.imanufacturer /= 0 then
	   						ret := {LIBUSB_FUNCTIONS}.libusb_get_string_descriptor_ascii (handle, desc.imanufacturer, data, length)
	   						if ret > 0 then
	   							print("%NManufacturer: " + data + "%N")
	   						end
	   					end
	   					if desc.iproduct /= 0 then
	   						ret := {LIBUSB_FUNCTIONS}.libusb_get_string_descriptor_ascii (handle, desc.iproduct, data, length)
	   						if ret > 0 then
	   							print("%NProduct: " + data + "%N")
	   						end
	   					end


	   				end
					i :=  i + 1
				end
				{LIBUSB_FUNCTIONS}.libusb_free_device_list (list, True)
			end
			{LIBUSB_FUNCTIONS}.libusb_exit (Void)
		end

	test_hotplug_capability
		local
			ret: INTEGER
		do
			ret := {LIBUSB_FUNCTIONS}.libusb_init (Void)
			check success: ret = 0 end
			if {LIBUSB_FUNCTIONS}.libusb_has_capability ({LIBUSB_CAPABILITY_ENUM_API}.LIBUSB_CAP_HAS_HOTPLUG) > 0 then
				print ("%NHotplug support is available on this platform.")
			else
				print ("%NHotplug support is not available on this platform.")
			end
			{LIBUSB_FUNCTIONS}.libusb_exit (Void)
		end
end
