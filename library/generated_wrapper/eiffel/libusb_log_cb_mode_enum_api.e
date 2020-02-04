-- enum wrapper
class LIBUSB_LOG_CB_MODE_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_log_cb_global or a_value = libusb_log_cb_context
		end

	libusb_log_cb_global: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_LOG_CB_GLOBAL"
		end

	libusb_log_cb_context: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_LOG_CB_CONTEXT"
		end

end
