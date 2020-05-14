note

	description: "This file has been generated by EWG. Do not edit. Changes will be lost!"

	generator: "Eiffel Wrapper Generator"

class LIBUSB_INTERFACE_STRUCT_API

inherit

	MEMORY_STRUCTURE


create

	make,
	make_by_pointer

feature -- Measurement

	structure_size: INTEGER
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	altsetting: LIST [LIBUSB_INTERFACE_DESCRIPTOR_STRUCT_API]
			-- Access member `altsetting`
		require
			exists: exists
		local
			-- mp: MANAGED_POINTER
			i: INTEGER
			-- l_ptr: POINTER
		do
			create {ARRAYED_LIST [LIBUSB_INTERFACE_DESCRIPTOR_STRUCT_API] } Result.make (num_altsetting)
			from
				i := 0
			until
				i = num_altsetting
			loop
				Result.force (altsetting_at (i))
				i := i + 1
			end

--			create mp.make_from_pointer (c_altsetting (item), num_altsetting * {LIBUSB_INTERFACE_DESCRIPTOR_STRUCT_API}.structure_size)
--			from
--				i := 0
--			until
--				i = num_altsetting
--			loop
--				l_ptr := mp.read_pointer (i*{LIBUSB_INTERFACE_DESCRIPTOR_STRUCT_API}.structure_size)
--				if l_ptr /= default_pointer then
--					Result.force (create {LIBUSB_INTERFACE_DESCRIPTOR_STRUCT_API}.make_by_pointer (l_ptr) )
--				end
--				i := i + 1
--			end
		ensure
			result_count: Result.count = num_altsetting
		end

	altsetting_at (i: INTEGER): LIBUSB_INTERFACE_DESCRIPTOR_STRUCT_API
		require
			valid_index: i>=0 and i < num_altsetting
		local
			l_ptr: POINTER
		do
			create Result.make
			l_ptr := c_altsetting_at (item, i)
			if l_ptr /= default_pointer then
				create Result.make_by_pointer (l_ptr)
			end
		end



	set_altsetting (a_value: LIBUSB_INTERFACE_DESCRIPTOR_STRUCT_API)
			-- Set member `altsetting`
		require
			a_value_not_void: a_value /= Void
			exists: exists
		do
			-- TODO Check
			set_c_altsetting (item, a_value.item)
		end

	num_altsetting: INTEGER
			-- Access member `num_altsetting`
		require
			exists: exists
		do
			Result := c_num_altsetting (item)
		ensure
			result_correct: Result = c_num_altsetting (item)
		end

	set_num_altsetting (a_value: INTEGER)
			-- Change the value of member `num_altsetting` to `a_value`.
		require
			exists: exists
		do
			set_c_num_altsetting (item, a_value)
		ensure
			num_altsetting_set: a_value = num_altsetting
		end

feature {NONE} -- Implementation wrapper for struct struct libusb_interface

	sizeof_external: INTEGER
		external
			"C inline use <libusb.h>"
		alias
			"sizeof(struct libusb_interface)"
		end

	c_altsetting (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <libusb.h>"
		alias
			"[
				&(((struct libusb_interface*)$an_item)->altsetting)
			]"
		end

	c_altsetting_at (an_item: POINTER; i: INTEGER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <libusb.h>"
		alias
			"[
				struct  libusb_interface_descriptor* laltsetting;
				laltsetting = ((struct libusb_interface*)$an_item)->altsetting;
				return &laltsetting [$i];
			]"
		end

	set_c_altsetting (an_item: POINTER; a_value: POINTER)
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <libusb.h>"
		alias
			"[
				((struct libusb_interface*)$an_item)->altsetting =  (struct libusb_interface_descriptor const*)$a_value
			]"
		ensure
			altsetting_set: a_value = c_altsetting (an_item)
		end

	c_num_altsetting (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <libusb.h>"
		alias
			"[
				((struct libusb_interface*)$an_item)->num_altsetting
			]"
		end

	set_c_num_altsetting (an_item: POINTER; a_value: INTEGER)
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <libusb.h>"
		alias
			"[
				((struct libusb_interface*)$an_item)->num_altsetting =  (int)$a_value
			]"
		ensure
			num_altsetting_set: a_value = c_num_altsetting (an_item)
		end

end
