-- enum wrapper
class LIBUSB_USB_2_0_EXTENSION_ATTRIBUTES_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_bm_lpm_support
		end

	libusb_bm_lpm_support: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_BM_LPM_SUPPORT"
		end

end
