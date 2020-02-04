-- enum wrapper
class LIBUSB_LOG_LEVEL_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_log_level_none or a_value = libusb_log_level_error or a_value = libusb_log_level_warning or a_value = libusb_log_level_info or a_value = libusb_log_level_debug
		end

	libusb_log_level_none: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_LOG_LEVEL_NONE"
		end

	libusb_log_level_error: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_LOG_LEVEL_ERROR"
		end

	libusb_log_level_warning: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_LOG_LEVEL_WARNING"
		end

	libusb_log_level_info: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_LOG_LEVEL_INFO"
		end

	libusb_log_level_debug: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_LOG_LEVEL_DEBUG"
		end

end
