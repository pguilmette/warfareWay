note
	description: "Summary description for {MENU_PRINCIPAL}."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

class
	MENU_PRINCIPAL

inherit
	MENU
		rename
			make as make_base
		end

create
	make

feature {NONE} -- Initialization

	make
		local
		do
			sections.extend ("Jouer")
		end

end
