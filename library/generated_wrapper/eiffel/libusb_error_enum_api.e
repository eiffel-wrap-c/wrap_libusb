-- enum wrapper
class LIBUSB_ERROR_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_success or a_value = libusb_error_io or a_value = libusb_error_invalid_param or a_value = libusb_error_access or a_value = libusb_error_no_device or a_value = libusb_error_not_found or a_value = libusb_error_busy or a_value = libusb_error_timeout or a_value = libusb_error_overflow or a_value = libusb_error_pipe or a_value = libusb_error_interrupted or a_value = libusb_error_no_mem or a_value = libusb_error_not_supported or a_value = libusb_error_other
		end

	libusb_success: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_SUCCESS"
		end

	libusb_error_io: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_IO"
		end

	libusb_error_invalid_param: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_INVALID_PARAM"
		end

	libusb_error_access: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_ACCESS"
		end

	libusb_error_no_device: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_NO_DEVICE"
		end

	libusb_error_not_found: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_NOT_FOUND"
		end

	libusb_error_busy: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_BUSY"
		end

	libusb_error_timeout: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_TIMEOUT"
		end

	libusb_error_overflow: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_OVERFLOW"
		end

	libusb_error_pipe: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_PIPE"
		end

	libusb_error_interrupted: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_INTERRUPTED"
		end

	libusb_error_no_mem: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_NO_MEM"
		end

	libusb_error_not_supported: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_NOT_SUPPORTED"
		end

	libusb_error_other: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ERROR_OTHER"
		end

end
