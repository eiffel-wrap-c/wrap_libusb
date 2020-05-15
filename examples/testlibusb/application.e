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
			ret: INTEGER
			desc: LIBUSB_DEVICE_DESCRIPTOR_STRUCT_API
			handle: LIBUSB_DEVICE_HANDLE_STRUCT_API
			data: STRING
			length: INTEGER
			i: INTEGER
			config: LIBUSB_CONFIG_DESCRIPTOR_STRUCT_API
		do
			create desc.make
			ret := {LIBUSB_FUNCTIONS}.libusb_get_device_descriptor (a_device, desc)
			if ret < 0 then
				print ("%N Failed to get device descriptor")
			else
				print ("%N Dev (bus " + {LIBUSB_FUNCTIONS}.libusb_get_bus_number (a_device).out + ", device " + {LIBUSB_FUNCTIONS}.libusb_get_device_address (a_device).out + " ): " +
				desc.idvendor.to_hex_string + " " + desc.idproduct.to_hex_string)

				create handle.make
				ret := {LIBUSB_FUNCTIONS}.libusb_open (a_device, handle)
				if ret = {LIBUSB_ERROR_ENUM_API}.libusb_success then
					length := 256
					create data.make (length)
					if desc.imanufacturer /= 0 then
						ret := {LIBUSB_FUNCTIONS}.libusb_get_string_descriptor_ascii (handle, desc.imanufacturer, data, length)
						if ret > 0 then
							print ("%N      Manufacturer: " + data )
						end
					end
					if desc.iproduct /= 0 then
						ret := {LIBUSB_FUNCTIONS}.libusb_get_string_descriptor_ascii (handle, desc.iproduct, data, length)
						if ret > 0 then
							print ("%N      Product: " + data )
						end
					end
					if desc.iserialnumber /= 0 then
						ret := {LIBUSB_FUNCTIONS}.libusb_get_string_descriptor_ascii (handle, desc.iserialnumber, data, length)
						if ret > 0 then
							print ("%N      Serial Number: " + data + "%N")
						end
					end
				else
						-- Print the error
					print ("%N " + {LIBUSB_FUNCTIONS}.libusb_error_name (ret) + "%N")
				end
			end

			from
				i := 0
			until
				i = desc.bnumconfigurations
			loop
				create config.make
				ret := {LIBUSB_FUNCTIONS}.libusb_get_config_descriptor (a_device, i, config)
				if ret /= {LIBUSB_ERROR_ENUM_API}.libusb_success then
					print ("%N Couldn't retrieve descriptors" + {LIBUSB_FUNCTIONS}.libusb_error_name (ret) + "%N")
				else
					print_configuration (config)
					{LIBUSB_FUNCTIONS}.libusb_free_config_descriptor (config)
				end
				if attached handle and then desc.bcdusb >= 0x0201 then
					print_bos(handle)
				end
				i := i + 1
			end
			if attached handle then
				{LIBUSB_FUNCTIONS}.libusb_close (handle)
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
		local
			i: INTEGER
			ep_comp: LIBUSB_SS_ENDPOINT_COMPANION_DESCRIPTOR_STRUCT_API
			ret: INTEGER
		do
			print("      Endpoint:%N");
			print("        bEndpointAddress:    "+ a_endpoint.bendpointaddress.to_hex_string + "%N")
			print("        bmAttributes:        "+ a_endpoint.bmattributes.to_hex_string + "%N")
			print("        wMaxPacketSize:      "+ a_endpoint.wmaxpacketsize.out +"%N")
			print("        bInterval:           "+ a_endpoint.binterval.out + "%N")
			print("        bRefresh:            "+ a_endpoint.brefresh.out + "%N")
			print("        bSynchAddress:       "+ a_endpoint.bsynchaddress.out + "%N");

			from i := 0 until i = a_endpoint.extra_length loop
				if attached a_endpoint.extra as extra and then attached extra.string as l_extra then
					if l_extra [i + 2].code = {LIBUSB_DESCRIPTOR_TYPE_ENUM_API}.LIBUSB_DT_SS_ENDPOINT_COMPANION then
						create ep_comp.make
						ret := {LIBUSB_FUNCTIONS}.libusb_get_ss_endpoint_companion_descriptor(Void, a_endpoint, ep_comp)

						if ret = {LIBUSB_ERROR_ENUM_API}.libusb_success then
							print_endpoint_comp (ep_comp)
							{LIBUSB_FUNCTIONS}.libusb_free_ss_endpoint_companion_descriptor (ep_comp)
						end
					end
					i := i + l_extra [i].code
				else
					i := i + 1
				end
			end
		end

	print_endpoint_comp (ep_comp: LIBUSB_SS_ENDPOINT_COMPANION_DESCRIPTOR_STRUCT_API)
		do
			print("      USB 3.0 Endpoint Companion:%N");
			print("        bMaxBurst:           " + ep_comp.bMaxBurst.out + "%N")
			print("        bmAttributes:        " + ep_comp.bmAttributes.to_hex_string + "%N")
			print("        wBytesPerInterval:   " + ep_comp.wBytesPerInterval.out + "%N")

		end

	print_bos (a_handle: LIBUSB_DEVICE_HANDLE_STRUCT_API)
		local
			l_bos: LIBUSB_BOS_DESCRIPTOR_STRUCT_API
			ret: INTEGER
			i: INTEGER
			l_dev_cap: LIBUSB_BOS_DEV_CAPABILITY_DESCRIPTOR_STRUCT_API
			l_usb_2_0_ext: LIBUSB_USB_2_0_EXTENSION_DESCRIPTOR_STRUCT_API
			l_exception: EXCEPTION
			l_ss_dev_cap: LIBUSB_SS_USB_DEVICE_CAPABILITY_DESCRIPTOR_STRUCT_API
		do
			create l_bos.make
			ret := {LIBUSB_FUNCTIONS}.libusb_get_bos_descriptor (a_handle, l_bos)
			if ret < 0 then
				-- do nothing
			else
				print("  Binary Object Store (BOS):%N");
				print("    wTotalLength:            " + l_bos.wtotallength.out + "%N");
				print("    bNumDeviceCaps:          " + l_bos.bnumdevicecaps.out + "%N")
				from i:=0 until i = l_bos.bnumdevicecaps
				loop
					l_dev_cap := l_bos.dev_capability_at (i)
					if l_dev_cap.bdevcapabilitytype = {LIBUSB_BOS_TYPE_ENUM_API}.LIBUSB_BT_USB_2_0_EXTENSION then
						create l_usb_2_0_ext.make
						ret := {LIBUSB_FUNCTIONS}.libusb_get_usb_2_0_extension_descriptor(Void, l_dev_cap,  l_usb_2_0_ext)
						if ret < 0 then
							print ("%N" + {LIBUSB_FUNCTIONS}.libusb_error_name (ret))
							create l_exception
							l_exception.set_description (generator + "print_bos failed at libusb_get_usb_2_0_extension_descriptor")
							l_exception.raise
						else
							print_2_0_ext_cap (l_usb_2_0_ext)
							{LIBUSB_FUNCTIONS}.libusb_free_usb_2_0_extension_descriptor (l_usb_2_0_ext)
						end
					elseif l_dev_cap.bdevcapabilitytype = {LIBUSB_BOS_TYPE_ENUM_API}.LIBUSB_BT_SS_USB_DEVICE_CAPABILITY then
						create l_ss_dev_cap.make
						ret := {LIBUSB_FUNCTIONS}.libusb_get_ss_usb_device_capability_descriptor(Void, l_dev_cap, l_ss_dev_cap)
						if ret < 0 then
							print ("%N" + {LIBUSB_FUNCTIONS}.libusb_error_name (ret))
							create l_exception
							l_exception.set_description (generator + "print_bos failed at libusb_get_ss_usb_device_capability_descriptor")
							l_exception.raise
						else
							print_ss_usb_cap (l_ss_dev_cap)
							{LIBUSB_FUNCTIONS}.libusb_free_ss_usb_device_capability_descriptor (l_ss_dev_cap)
						end
					end
					i := i +  1
				end
			end
		end

	print_2_0_ext_cap (a_usb_2_0_ext_cap: LIBUSB_USB_2_0_EXTENSION_DESCRIPTOR_STRUCT_API)
		do
			print("    USB 2.0 Extension Capabilities:%N");
			print("      bDevCapabilityType:    " + a_usb_2_0_ext_cap.bdevcapabilitytype.out + "%N")
			print("      bmAttributes:          " + a_usb_2_0_ext_cap.bmattributes.to_hex_string + "%N")
		end

	print_ss_usb_cap( a_ss_usb_cap: LIBUSB_SS_USB_DEVICE_CAPABILITY_DESCRIPTOR_STRUCT_API)
		do
			print("    USB 3.0 Capabilities:%N")
			print("      bDevCapabilityType:    " + a_ss_usb_cap.bdevcapabilitytype.out + "%N")
			print("      bmAttributes:          " + a_ss_usb_cap.bmattributes.out + "%N")
			print("      wSpeedSupported:       " + a_ss_usb_cap.wspeedsupported.out + "%N");
			print("      bFunctionalitySupport: " + a_ss_usb_cap.bfunctionalitysupport.out + "%N")
			print("      bU1devExitLat:         " + a_ss_usb_cap.bu1devexitlat.out + "%N")
			print("      bU2devExitLat:         " + a_ss_usb_cap.bu2devexitlat.out + "%N")
		end



end
