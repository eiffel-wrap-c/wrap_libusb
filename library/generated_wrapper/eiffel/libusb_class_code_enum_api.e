-- enum wrapper
class LIBUSB_CLASS_CODE_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_class_per_interface or a_value = libusb_class_audio or a_value = libusb_class_comm or a_value = libusb_class_hid or a_value = libusb_class_physical or a_value = libusb_class_printer or a_value = libusb_class_ptp or a_value = libusb_class_image or a_value = libusb_class_mass_storage or a_value = libusb_class_hub or a_value = libusb_class_data or a_value = libusb_class_smart_card or a_value = libusb_class_content_security or a_value = libusb_class_video or a_value = libusb_class_personal_healthcare or a_value = libusb_class_diagnostic_device or a_value = libusb_class_wireless or a_value = libusb_class_application or a_value = libusb_class_vendor_spec
		end

	libusb_class_per_interface: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_PER_INTERFACE"
		end

	libusb_class_audio: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_AUDIO"
		end

	libusb_class_comm: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_COMM"
		end

	libusb_class_hid: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_HID"
		end

	libusb_class_physical: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_PHYSICAL"
		end

	libusb_class_printer: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_PRINTER"
		end

	libusb_class_ptp: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_PTP"
		end

	libusb_class_image: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_IMAGE"
		end

	libusb_class_mass_storage: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_MASS_STORAGE"
		end

	libusb_class_hub: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_HUB"
		end

	libusb_class_data: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_DATA"
		end

	libusb_class_smart_card: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_SMART_CARD"
		end

	libusb_class_content_security: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_CONTENT_SECURITY"
		end

	libusb_class_video: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_VIDEO"
		end

	libusb_class_personal_healthcare: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_PERSONAL_HEALTHCARE"
		end

	libusb_class_diagnostic_device: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_DIAGNOSTIC_DEVICE"
		end

	libusb_class_wireless: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_WIRELESS"
		end

	libusb_class_application: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_APPLICATION"
		end

	libusb_class_vendor_spec: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_CLASS_VENDOR_SPEC"
		end

end
