note
	description: "[
				testlibusb application root class
				Eiffel version of C testlibusb example
	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=testlibusb example", "src=https://github.com/libusb/libusb/blob/master/examples/testlibusb.c", "protocol=uri"

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
			desc: LIBUSB_DEVICE_DESCRIPTOR_STRUCT_API
			handle: LIBUSB_DEVICE_HANDLE_STRUCT_API
			data: STRING
			i : INTEGER
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
					print_device (list.at (i))
					i := i + 1
				end
				LUSB.libusb_free_device_list (list, True)
			end

			LUSB.libusb_exit (Void)
		end

	print_device (a_device: LIBUSB_DEVICE_STRUCT_API)
		local
			ret: INTEGER
			desc: LIBUSB_DEVICE_DESCRIPTOR_STRUCT_API
			handle: LIBUSB_DEVICE_HANDLE_STRUCT_API
			data: STRING
			length: INTEGER
			i: INTEGER
			config: LIBUSB_CONFIG_DESCRIPTOR_STRUCT_API
		do
			create desc.make
			ret := LUSB.libusb_get_device_descriptor (a_device, desc)
			if ret < 0 then
				print ("%N Failed to get device descriptor")
			else
				print ("%N Dev (bus " + LUSB.libusb_get_bus_number (a_device).out + ", device " + LUSB.libusb_get_device_address (a_device).out + " ): " +
				desc.idvendor.to_hex_string + " " + desc.idproduct.to_hex_string)

				create handle.make
				ret := LUSB.libusb_open (a_device, handle)
				if ret = {LIBUSB_ERROR_ENUM_API}.libusb_success then
					length := 256
					create data.make (length)
					if desc.imanufacturer /= 0 then
						ret := LUSB.libusb_get_string_descriptor_ascii (handle, desc.imanufacturer, data, length)
						if ret > 0 then
							print ("%NManufacturer: " + data + "%N")
						end
					end
					if desc.iproduct /= 0 then
						ret := LUSB.libusb_get_string_descriptor_ascii (handle, desc.iproduct, data, length)
						if ret > 0 then
							print ("%NProduct: " + data + "%N")
						end
					end
					if desc.iserialnumber /= 0 then
						ret := LUSB.libusb_get_string_descriptor_ascii (handle, desc.iserialnumber, data, length)
						if ret > 0 then
							print ("%NSerial Number: " + data + "%N")
						end
					end
				else
						-- Print the error
					print ("%N " + LUSB.libusb_error_name (ret) + "%N")
				end
			end

			from
				i := 0
			until
				i = desc.bnumconfigurations
			loop
				create config.make
				ret := LUSB.libusb_get_config_descriptor (a_device, i, config)
				if ret /= {LIBUSB_ERROR_ENUM_API}.libusb_success then
					print ("%N Couldn't retrieve descriptors" + LUSB.libusb_error_name (ret) + "%N")
				else
					print_configuration (config)
					LUSB.libusb_free_config_descriptor (config)
				end
				i := i + 1
			end

		end

	print_configuration (a_config: LIBUSB_CONFIG_DESCRIPTOR_STRUCT_API)
		local
			i: INTEGER
		do
			print("  Configuration:%N");
			print("    wTotalLength:            "+ a_config.wtotallength.out + "%N")
			print("    bNumInterfaces:          "+ a_config.bnuminterfaces.out + "%N")
			print("    bConfigurationValue:     "+ a_config.bconfigurationvalue.out + "%N")
			print("    iConfiguration:          "+ a_config.iconfiguration.out + "%N")
			print("    bmAttributes:            "+ a_config.bmattributes.to_hex_string + "h%N")
			print("    MaxPower:                "+ a_config.maxpower.out + "%N")

			from i := 0 until i = a_config.bnuminterfaces
			loop
				print_interface (a_config.interface_at (i))
				i := i + 1
			end
		end

	print_interface (a_interface: LIBUSB_INTERFACE_STRUCT_API )
		local
			i: INTEGER
		do
			from i := 0 until i = a_interface.num_altsetting
			loop
				print_alternative_settings (a_interface.altsetting_at (i))
				i := i + 1
			end
		end


	print_alternative_settings ( a_settings: LIBUSB_INTERFACE_DESCRIPTOR_STRUCT_API)
		local
			i: INTEGER
		do
			print("    Interface:%N");
			print("      bInterfaceNumber:      " + a_settings.binterfacenumber.out + "%N")
			print("      bAlternateSetting:     " + a_settings.balternatesetting.out + "%N")
			print("      bNumEndpoints:         " + a_settings.bnumendpoints.out + "%N")
			print("      bInterfaceClass:       " + a_settings.binterfaceclass.out + "%N")
			print("      bInterfaceSubClass:    " + a_settings.binterfacesubclass.out +"%N")
			print("      bInterfaceProtocol:    " + a_settings.binterfaceprotocol.out + "%N")
			print("      iInterface:            " + a_settings.iinterface.out + "%N")

			from i:= 0 until i =a_settings.bnumendpoints
			loop
				print_endpoint (a_settings.endpoint_at (i))
				i := i + 1
			end
		end


	print_endpoint (a_endpoint: LIBUSB_ENDPOINT_DESCRIPTOR_STRUCT_API)
		do
			print("      Endpoint:%N");
			print("        bEndpointAddress:    "+ a_endpoint.bendpointaddress.to_hex_string + "%N")
			print("        bmAttributes:        "+ a_endpoint.bmattributes.to_hex_string + "%N")
			print("        wMaxPacketSize:      "+ a_endpoint.wmaxpacketsize.out +"%N")
			print("        bInterval:           "+ a_endpoint.binterval.out + "%N")
			print("        bRefresh:            "+ a_endpoint.brefresh.out + "%N")
			print("        bSynchAddress:       "+ a_endpoint.bsynchaddress.out + "%N");
		end

feature {NONE} -- Implementation

	LUSB: LIBUSB_FUNCTIONS
		once
			create Result
		end

end
