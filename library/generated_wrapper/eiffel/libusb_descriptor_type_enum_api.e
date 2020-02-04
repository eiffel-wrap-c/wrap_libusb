-- enum wrapper
class LIBUSB_DESCRIPTOR_TYPE_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_dt_device or a_value = libusb_dt_config or a_value = libusb_dt_string or a_value = libusb_dt_interface or a_value = libusb_dt_endpoint or a_value = libusb_dt_bos or a_value = libusb_dt_device_capability or a_value = libusb_dt_hid or a_value = libusb_dt_report or a_value = libusb_dt_physical or a_value = libusb_dt_hub or a_value = libusb_dt_superspeed_hub or a_value = libusb_dt_ss_endpoint_companion
		end

	libusb_dt_device: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_DEVICE"
		end

	libusb_dt_config: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_CONFIG"
		end

	libusb_dt_string: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_STRING"
		end

	libusb_dt_interface: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_INTERFACE"
		end

	libusb_dt_endpoint: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_ENDPOINT"
		end

	libusb_dt_bos: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_BOS"
		end

	libusb_dt_device_capability: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_DEVICE_CAPABILITY"
		end

	libusb_dt_hid: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_HID"
		end

	libusb_dt_report: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_REPORT"
		end

	libusb_dt_physical: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_PHYSICAL"
		end

	libusb_dt_hub: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_HUB"
		end

	libusb_dt_superspeed_hub: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_SUPERSPEED_HUB"
		end

	libusb_dt_ss_endpoint_companion: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_DT_SS_ENDPOINT_COMPANION"
		end

end
