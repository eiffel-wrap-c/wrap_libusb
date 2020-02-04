-- enum wrapper
class LIBUSB_REQUEST_RECIPIENT_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_recipient_device or a_value = libusb_recipient_interface or a_value = libusb_recipient_endpoint or a_value = libusb_recipient_other
		end

	libusb_recipient_device: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_RECIPIENT_DEVICE"
		end

	libusb_recipient_interface: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_RECIPIENT_INTERFACE"
		end

	libusb_recipient_endpoint: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_RECIPIENT_ENDPOINT"
		end

	libusb_recipient_other: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_RECIPIENT_OTHER"
		end

end
