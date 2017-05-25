note
	description: "Objet pour un joueur (côté serveur)."
	author: "Étienne Boutet"
	author: "Philippe Guilmette"
	date: "20170423"

class
	JOUEUR_SERVEUR

inherit
	JOUEUR
		redefine
			make
		end

create
	make

feature {NONE} -- Initialisation

	make(a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'
		do
			Precursor(a_renderer)
			start_x := 20
			start_y := 20
		end

invariant

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
