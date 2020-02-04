-- enum wrapper
class LIBUSB_TRANSFER_TYPE_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_transfer_type_control or a_value = libusb_transfer_type_isochronous or a_value = libusb_transfer_type_bulk or a_value = libusb_transfer_type_interrupt or a_value = libusb_transfer_type_bulk_stream
		end

	libusb_transfer_type_control: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_TYPE_CONTROL"
		end

	libusb_transfer_type_isochronous: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_TYPE_ISOCHRONOUS"
		end

	libusb_transfer_type_bulk: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_TYPE_BULK"
		end

	libusb_transfer_type_interrupt: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_TYPE_INTERRUPT"
		end

	libusb_transfer_type_bulk_stream: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_TRANSFER_TYPE_BULK_STREAM"
		end

end
