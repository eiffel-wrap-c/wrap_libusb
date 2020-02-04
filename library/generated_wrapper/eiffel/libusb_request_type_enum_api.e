-- enum wrapper
class LIBUSB_REQUEST_TYPE_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_request_type_standard or a_value = libusb_request_type_class or a_value = libusb_request_type_vendor or a_value = libusb_request_type_reserved
		end

	libusb_request_type_standard: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_TYPE_STANDARD"
		end

	libusb_request_type_class: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_TYPE_CLASS"
		end

	libusb_request_type_vendor: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_TYPE_VENDOR"
		end

	libusb_request_type_reserved: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_TYPE_RESERVED"
		end

end
