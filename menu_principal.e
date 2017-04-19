note
	description: "Objet pour le menu principal."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

class
	MENU_PRINCIPAL

inherit
	MENU
		redefine
			make
		end

create
	make

feature {NONE} -- Initialisation

	make(a_window: GAME_WINDOW_RENDERED; a_font:TEXT_FONT)
			-- <Precursor>
		do
			Precursor (a_window, a_font)
			create sections.make_from_array (<<"Solo", "Multijoueur", "Crédits", "Quitter">>)
			show_sections (sections)
		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end

