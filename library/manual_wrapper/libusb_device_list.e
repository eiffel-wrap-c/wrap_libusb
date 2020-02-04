note
	description: "Summary description for {LIBUSB_DEVICE_LIST}."
	date: "$Date$"
	revision: "$Revision$"

class
	LIBUSB_DEVICE_LIST
inherit
	ANY
		redefine
			default_create
		end

create default_create


feature {NONE} -- Initialization

	default_create
		do
			create {ARRAYED_LIST [LIBUSB_DEVICE_STRUCT_API]} list.make (0)
		end

feature -- Access

	item: POINTER
			-- Handle to the C low level list.


	count: INTEGER
			-- Number of items.
		do
			Result := list.count
		end

	at (i: INTEGER): LIBUSB_DEVICE_STRUCT_API
			-- Element at `i'-th position
		require
			valid_index: i > 0 and then i <= count
		do
			Result := list.at (i)
		end

feature -- Change Element

	force (a_item: LIBUSB_DEVICE_STRUCT_API)
			-- Add `a_item' to end.
		do
			list.force (a_item)
		end


	set_item (a_item: like item)
		do
			item := a_item
		end


feature {NONE} -- Implementation

	list: LIST [LIBUSB_DEVICE_STRUCT_API]
		-- List of USB DEVICES
		--| The c structure is opaque.


end
