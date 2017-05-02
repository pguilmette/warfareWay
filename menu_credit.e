note
	description: "Objet pour le menu des crédits."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

class
	MENU_CREDIT

inherit
	MENU
		redefine
			make
		end

create
	make

feature {NONE} -- Initialisation

	make
			-- Initialise `Current'.
		do
			Precursor (a_window, a_font)
			create sections.make_from_array (<<"Philippe Guilmette", "Étienne Boutet">>)
			show_sections (sections)
		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
