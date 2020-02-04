-- enum wrapper
class LIBUSB_STANDARD_REQUEST_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = libusb_request_get_status or a_value = libusb_request_clear_feature or a_value = libusb_request_set_feature or a_value = libusb_request_set_address or a_value = libusb_request_get_descriptor or a_value = libusb_request_set_descriptor or a_value = libusb_request_get_configuration or a_value = libusb_request_set_configuration or a_value = libusb_request_get_interface or a_value = libusb_request_set_interface or a_value = libusb_request_synch_frame or a_value = libusb_request_set_sel or a_value = libusb_set_isoch_delay
		end

	libusb_request_get_status: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_GET_STATUS"
		end

	libusb_request_clear_feature: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_CLEAR_FEATURE"
		end

	libusb_request_set_feature: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_SET_FEATURE"
		end

	libusb_request_set_address: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_SET_ADDRESS"
		end

	libusb_request_get_descriptor: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_GET_DESCRIPTOR"
		end

	libusb_request_set_descriptor: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_SET_DESCRIPTOR"
		end

	libusb_request_get_configuration: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_GET_CONFIGURATION"
		end

	libusb_request_set_configuration: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_SET_CONFIGURATION"
		end

	libusb_request_get_interface: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_GET_INTERFACE"
		end

	libusb_request_set_interface: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_SET_INTERFACE"
		end

	libusb_request_synch_frame: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_SYNCH_FRAME"
		end

	libusb_request_set_sel: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_REQUEST_SET_SEL"
		end

	libusb_set_isoch_delay: INTEGER 
		external
			"C inline use <libusb.h>"
		alias
			"LIBUSB_SET_ISOCH_DELAY"
		end

end
