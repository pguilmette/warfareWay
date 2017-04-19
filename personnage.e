note
	description: "Objet pour un personnage du jeu."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

deferred class
	PERSONNAGE

inherit
	AFFICHABLE

feature -- Accès

	update(a_timestamp:NATURAL_32)
			-- Met à jour la surface de `a_timestamp'
		do
			if going_left or going_right or going_up or going_down then
				if going_left then
					x := x - speed
				end
				if going_right then
					x := x + speed
				end
				if going_up then
					y := y - speed
				end
				if going_down then
					y := y + speed
				end
			end
		end

	go_left(a_timestamp:NATURAL_32)
			-- `Current' bouge à gauche
		require
			Is_not_going_left: going_left = False
		do
			going_right := False
			going_left := True
		end

	go_right(a_timestamp:NATURAL_32)
			-- `Current' bouge à droite
		require
			Is_not_going_right: going_right = False
		do
			going_left := False
			going_right := True
		end

	go_up(a_timestamp:NATURAL_32)
			-- `Current' bouge vers le haut
		require
			Is_not_going_up: going_up = False
		do
			going_up := True
			going_down := False
		end

	go_down(a_timestamp:NATURAL_32)
			-- `Current' bouge vers le bas
		require
			Is_not_going_down: going_down = False
		do
			going_down := True
			going_up := False
		end

	stop_left
			-- `Current' arrête de bouger vers la gauche
		require
			Is_going_left: going_left = True
		do
			going_left := False
		end

	stop_right
			-- `Current' arrête de bouger vers la droite
		require
			Is_going_right: going_right = True
		do
			going_right := False
		end

	stop_up
			-- `Current' arrête de bouger vers le haut
		require
			Is_going_up: going_up = True
		do
			going_up := False
		end

	stop_down
			-- `Current' arrête de bouger vers le bas
		require
			Is_going_down: going_down = True
		do
			going_down := False
		end

	calculate_angle(a_position:POSITION)
			-- Permet de calculer l'angle entre le joueur et le curseur
		local
			l_x_distance, l_y_distance, l_angle, l_angle_degree: REAL_64
		do
			l_x_distance := a_position.center_x - (x + half_width)
			l_y_distance := a_position.center_y - (y + half_height)
			l_angle := atan2 (l_x_distance, l_y_distance)
			l_angle_degree := -(l_angle * (180/3.1416))
			rotation := l_angle_degree
		end

	half_width:REAL_64
			-- Moitié de la largeur de l'image

	half_height:REAL_64
			-- Moitié de la hauteur de l'image

	going_left:BOOLEAN
			-- Si `Current' va vers la gauche

	going_right:BOOLEAN
			-- Si `Current' va vers la droite

	going_up:BOOLEAN
			-- Si `Current' va vers le haut

	going_down:BOOLEAN
			-- Si `Current' va vers le bas

	speed:INTEGER = 3
			-- La vitesse du personnage

	active_weapon:INTEGER
			-- L'{ARMES} présentement utilisé par `Current'.

feature {NONE} -- Implémentation

	atan2 (distance_x, distance_y: REAL_64): REAL_64
			-- Pour calculer l'angle du personnage
	    external
	        "C signature (double, double): double use <math.h>"
	    alias
	        "atan2"
	    end

invariant
	Is_positive: speed > 0
	Is_not_opposite_y: not (going_up AND going_down)
	Is_not_opposite_x: not (going_left AND going_right)

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
