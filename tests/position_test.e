note
	description: "Summary description for {POSITION_TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	POSITION_TEST

inherit
	POSITION

create
	make

feature {NONE} -- Initialisation
	make(a_center_x, a_center_y : INTEGER)

		do
			center_x := a_center_x
			center_y := a_center_y
		end

feature

	center_x : INTEGER
			-- <Precursor>
	center_y : INTEGER
			-- <Precursor>

end
