-- enum wrapper
class LIBUSB_SS_USB_DEVICE_CAPABILITY_ATTRIBUTES_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_bm_ltm_support
		end

	libusb_bm_ltm_support: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_BM_LTM_SUPPORT"
		end

end
