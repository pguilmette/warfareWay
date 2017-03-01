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

	make(a_window: GAME_WINDOW_RENDERED)
		local
		do
			make_base(a_window)
			sections.extend ("Jouer")
		end

end
