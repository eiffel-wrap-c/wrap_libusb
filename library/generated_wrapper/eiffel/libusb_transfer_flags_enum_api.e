-- enum wrapper
class LIBUSB_TRANSFER_FLAGS_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_transfer_short_not_ok or a_value = libusb_transfer_free_buffer or a_value = libusb_transfer_free_transfer or a_value = libusb_transfer_add_zero_packet
		end

	libusb_transfer_short_not_ok: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_SHORT_NOT_OK"
		end

	libusb_transfer_free_buffer: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_FREE_BUFFER"
		end

	libusb_transfer_free_transfer: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_FREE_TRANSFER"
		end

	libusb_transfer_add_zero_packet: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_ADD_ZERO_PACKET"
		end

end
