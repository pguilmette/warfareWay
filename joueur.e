note
	description: "Objet pour un personnage qui peut être controllé."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

class
	JOUEUR

inherit
	PERSONNAGE
		rename
			make as make_personnage
		end

create
	make

feature {NONE} -- Initialisation
	make(a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'
		do
			make_personnage(a_renderer, "includes/images/personnage.png")
		end

feature -- Accès
	calculate_angle(a_cursor:CURSEUR; a_player_x:INTEGER; a_player_y:INTEGER): REAL_64
			-- Permet de calculer l'angle entre le joueur et le curseur
		local
			l_x_distance, l_y_distance, l_angle: REAL_64
		do
			l_x_distance := a_cursor.last_x - a_player_x
			l_y_distance := a_cursor.last_y - a_player_y
			l_angle := atan2 (l_x_distance, l_y_distance)
			Result := l_angle
		end

feature {NONE} -- Implémentation

	atan2 (distance_x, distance_y: REAL_64): REAL_64
			-- Pour calculer l'angle du personnage
	    external
	        "C signature (double, double): double use <math.h>"
	    alias
	        "atan2"
	    end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
