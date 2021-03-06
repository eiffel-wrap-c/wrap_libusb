note
	description: "[
				Eiffel version of C listdevs libusb example to list devices on the bus
	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Listsdevs", "src=https://github.com/libusb/libusb/blob/master/examples/listdevs.c", "protocol=uri"

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
			list: LIBUSB_DEVICE_LIST
			i : INTEGER
		do
			ret := {LIBUSB_FUNCTIONS}.libusb_init (Void)
			check success: ret = 0 end

			create list
			ret := {LIBUSB_FUNCTIONS}.libusb_get_device_list (Void, list)

			if ret < 0 then
				print ("Can't get the device list")
				print ({LIBUSB_FUNCTIONS}.libusb_error_name (ret))
			else
				from
					i := 1
				until
					i > list.count
				loop
					print_device (list.at (i))
					i := i + 1
				end
				{LIBUSB_FUNCTIONS}.libusb_free_device_list (list, True)
			end

			{LIBUSB_FUNCTIONS}.libusb_exit (Void)
		end

	print_device (a_device: LIBUSB_DEVICE_STRUCT_API)
		local
			j,ret: INTEGER
			desc: LIBUSB_DEVICE_DESCRIPTOR_STRUCT_API
			path: STRING

		do
			create desc.make
			ret := {LIBUSB_FUNCTIONS}.libusb_get_device_descriptor (a_device, desc)
			if ret < 0 then
				print ("%N Failed to get device descriptor")
			else
				print ("%N Dev (bus " + {LIBUSB_FUNCTIONS}.libusb_get_bus_number (a_device).out + ", device " + {LIBUSB_FUNCTIONS}.libusb_get_device_address (a_device).out + " ): " +
				desc.idvendor.to_hex_string + " " + desc.idproduct.to_hex_string)

				create path.make (8)
				ret := {LIBUSB_FUNCTIONS}.libusb_get_port_numbers(a_device, path, path.capacity)
				if ret > 0 then
					print(" path: " + path[1].code.out)
					from j:= 2 until j >= ret
					loop
						print("." + path[j].code.out);
						j := j + 1
					end
				end
				print("%N");
			end

		end

end
