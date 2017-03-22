note
	description: "Objet pour un mur du niveau."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

class
	MUR

inherit
	OBSTACLE
		rename
			make as make_obstacle
		end

create
	make

feature {NONE} -- Implémentation

	make
			-- Initialise `Current'
		do

		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
