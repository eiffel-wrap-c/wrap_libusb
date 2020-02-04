-- enum wrapper
class LIBUSB_SUPPORTED_SPEED_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_low_speed_operation or a_value = libusb_full_speed_operation or a_value = libusb_high_speed_operation or a_value = libusb_super_speed_operation
		end

	libusb_low_speed_operation: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_LOW_SPEED_OPERATION"
		end

	libusb_full_speed_operation: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_FULL_SPEED_OPERATION"
		end

	libusb_high_speed_operation: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_HIGH_SPEED_OPERATION"
		end

	libusb_super_speed_operation: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_SUPER_SPEED_OPERATION"
		end

end
