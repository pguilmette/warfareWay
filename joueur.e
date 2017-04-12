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
			make_personnage(a_renderer, "includes/images/personnage_pistol.png")
			create rifle.make (0)
			create pistol.make
			create knife.make
			start_x := 0
			start_y := 0
			half_width := width/2
			half_height := height/2
		end

feature -- Accès

	calculate_angle(cursor:CURSEUR)
			-- Permet de calculer l'angle entre le joueur et le curseur
		local
			l_x_distance, l_y_distance, l_angle, l_angle_degree: REAL_64
		do
			l_x_distance := cursor.last_x - (x + half_width)
			l_y_distance := cursor.last_y - (y + half_height)
			l_angle := atan2 (l_x_distance, l_y_distance)
			l_angle_degree := -(l_angle * (180/3.1416))
			rotation := l_angle_degree
		end

	half_width:REAL_64
			-- Moitié de la largeur de l'image

	half_height:REAL_64
			-- Moitié de la hauteur de l'image

	rifle:FUSIL_AUTOMATIQUE
			-- Le {FUSIL_AUTOMATIQUE} de `Current'.

	pistol:PISTOLET
			-- Le {PISTOLET} de `Current'.

	knife:COUTEAU
			-- Le {COUTEAU} de `Current'.

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
