-- enum wrapper
class LIBUSB_HOTPLUG_EVENT_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_hotplug_event_device_arrived or a_value = libusb_hotplug_event_device_left
		end

	libusb_hotplug_event_device_arrived: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED"
		end

	libusb_hotplug_event_device_left: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT"
		end

end
