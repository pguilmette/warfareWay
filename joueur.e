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
			start_x := 0
			start_y := 0
			demi_width := width/2
			demi_height := height/2
		end

feature -- Accès
	calculate_angle(cursor:CURSEUR)
			-- Permet de calculer l'angle entre le joueur et le curseur
		local
			l_x_distance, l_y_distance, l_angle, l_angle_degree: REAL_64
		do
			l_x_distance := cursor.last_x - (x + demi_width)
			l_y_distance := cursor.last_y - (y + demi_height)
			l_angle := atan2 (l_x_distance, l_y_distance)
			l_angle_degree := -(l_angle * (180/3.1416))
			rotation := l_angle_degree
		end

	demi_width:REAL_64
			-- Moitié de la largeur de l'image

	demi_height:REAL_64
			-- Moitié de la hauteur de l'image

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
