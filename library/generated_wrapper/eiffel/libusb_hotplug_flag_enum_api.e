-- enum wrapper
class LIBUSB_HOTPLUG_FLAG_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_hotplug_no_flags or a_value = libusb_hotplug_enumerate
		end

	libusb_hotplug_no_flags: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_HOTPLUG_NO_FLAGS"
		end

	libusb_hotplug_enumerate: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_HOTPLUG_ENUMERATE"
		end

end
