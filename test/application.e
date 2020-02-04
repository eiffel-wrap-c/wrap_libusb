class APPLICATION

create
	make

feature {NONE} -- Initialization

	make
		do
			test_initialize
			test_device_list
		end

	test_initialize
		local
			ret: INTEGER
			ctx: LIBUSB_CONTEXT_STRUCT_API
		do
			ret := LUSB.libusb_init (void)
			check success: ret = 0 end
			LUSB.libusb_exit (void)

			create ctx.make

			ret := LUSB.libusb_init (ctx)
			check success: ret = 0 end
			LUSB.libusb_exit (ctx)
		end


	test_device_list
		local
			ret: INTEGER
			list: LIBUSB_DEVICE_LIST
			i: INTEGER
		do
			ret := LUSB.libusb_init (Void)
			check success: ret = 0 end

			create list
			ret := LUSB.libusb_get_device_list (Void, list)

			if ret < 0 then
				print ("Can get the device list")
				-- Todo print the error message
			else
				from
					i := 1
				until
					i > list.count
				loop

				end
				LUSB.libusb_free_device_list (list, True)
			end


			LUSB.libusb_exit (Void)
		end


	LUSB: LIBUSB_FUNCTIONS
		once
			create Result
		end
end
