-- enum wrapper
class LIBUSB_SPEED_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_speed_unknown or a_value = libusb_speed_low or a_value = libusb_speed_full or a_value = libusb_speed_high or a_value = libusb_speed_super or a_value = libusb_speed_super_plus
		end

	libusb_speed_unknown: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_SPEED_UNKNOWN"
		end

	libusb_speed_low: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_SPEED_LOW"
		end

	libusb_speed_full: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_SPEED_FULL"
		end

	libusb_speed_high: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_SPEED_HIGH"
		end

	libusb_speed_super: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_SPEED_SUPER"
		end

	libusb_speed_super_plus: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_SPEED_SUPER_PLUS"
		end

end
