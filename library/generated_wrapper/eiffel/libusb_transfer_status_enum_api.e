-- enum wrapper
class LIBUSB_TRANSFER_STATUS_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_transfer_completed or a_value = libusb_transfer_error or a_value = libusb_transfer_timed_out or a_value = libusb_transfer_cancelled or a_value = libusb_transfer_stall or a_value = libusb_transfer_no_device or a_value = libusb_transfer_overflow
		end

	libusb_transfer_completed: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_COMPLETED"
		end

	libusb_transfer_error: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_ERROR"
		end

	libusb_transfer_timed_out: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_TIMED_OUT"
		end

	libusb_transfer_cancelled: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_CANCELLED"
		end

	libusb_transfer_stall: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_STALL"
		end

	libusb_transfer_no_device: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_NO_DEVICE"
		end

	libusb_transfer_overflow: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_OVERFLOW"
		end

end
