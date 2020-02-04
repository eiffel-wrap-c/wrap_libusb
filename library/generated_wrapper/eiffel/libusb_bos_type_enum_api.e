-- enum wrapper
class LIBUSB_BOS_TYPE_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_bt_wireless_usb_device_capability or a_value = libusb_bt_usb_2_0_extension or a_value = libusb_bt_ss_usb_device_capability or a_value = libusb_bt_container_id
		end

	libusb_bt_wireless_usb_device_capability: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_BT_WIRELESS_USB_DEVICE_CAPABILITY"
		end

	libusb_bt_usb_2_0_extension: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_BT_USB_2_0_EXTENSION"
		end

	libusb_bt_ss_usb_device_capability: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_BT_SS_USB_DEVICE_CAPABILITY"
		end

	libusb_bt_container_id: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_BT_CONTAINER_ID"
		end

end
