-- enum wrapper
class LIBUSB_ISO_SYNC_TYPE_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_iso_sync_type_none or a_value = libusb_iso_sync_type_async or a_value = libusb_iso_sync_type_adaptive or a_value = libusb_iso_sync_type_sync
		end

	libusb_iso_sync_type_none: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ISO_SYNC_TYPE_NONE"
		end

	libusb_iso_sync_type_async: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ISO_SYNC_TYPE_ASYNC"
		end

	libusb_iso_sync_type_adaptive: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ISO_SYNC_TYPE_ADAPTIVE"
		end

	libusb_iso_sync_type_sync: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_ISO_SYNC_TYPE_SYNC"
		end

end
