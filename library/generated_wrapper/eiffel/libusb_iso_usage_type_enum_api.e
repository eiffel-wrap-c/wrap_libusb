-- enum wrapper
class LIBUSB_ISO_USAGE_TYPE_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_iso_usage_type_data or a_value = libusb_iso_usage_type_feedback or a_value = libusb_iso_usage_type_implicit
		end

	libusb_iso_usage_type_data: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ISO_USAGE_TYPE_DATA"
		end

	libusb_iso_usage_type_feedback: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ISO_USAGE_TYPE_FEEDBACK"
		end

	libusb_iso_usage_type_implicit: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ISO_USAGE_TYPE_IMPLICIT"
		end

end
