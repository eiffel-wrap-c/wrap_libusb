-- enum wrapper
class LIBUSB_ENDPOINT_DIRECTION_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_endpoint_in or a_value = libusb_endpoint_out
		end

	libusb_endpoint_in: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ENDPOINT_IN"
		end

	libusb_endpoint_out: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ENDPOINT_OUT"
		end

end
