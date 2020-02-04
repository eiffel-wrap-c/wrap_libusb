-- enum wrapper
class LIBUSB_OPTION_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_option_log_level or a_value = libusb_option_use_usbdk
		end

	libusb_option_log_level: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_OPTION_LOG_LEVEL"
		end

	libusb_option_use_usbdk: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_OPTION_USE_USBDK"
		end

end
