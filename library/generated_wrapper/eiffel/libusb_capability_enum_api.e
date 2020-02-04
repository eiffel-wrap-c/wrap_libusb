-- enum wrapper
class LIBUSB_CAPABILITY_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_cap_has_capability or a_value = libusb_cap_has_hotplug or a_value = libusb_cap_has_hid_access or a_value = libusb_cap_supports_detach_kernel_driver
		end

	libusb_cap_has_capability: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CAP_HAS_CAPABILITY"
		end

	libusb_cap_has_hotplug: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CAP_HAS_HOTPLUG"
		end

	libusb_cap_has_hid_access: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CAP_HAS_HID_ACCESS"
		end

	libusb_cap_supports_detach_kernel_driver: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CAP_SUPPORTS_DETACH_KERNEL_DRIVER"
		end

end
