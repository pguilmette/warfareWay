note
	description: "Objet pour une carte du jeu."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

class
	MAP

create
	make

feature {NONE} -- Initialisation

	make(a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'
		do
			create background.make (a_renderer, "complete_map.jpg")
			--create walls_array.make (17)
		end

feature -- Accès

	background:IMAGE
			-- Le fond de la {MAP}

	--walls_array:ARRAYED_LIST[MUR]
			-- La liste de tous les murs de la carte.

	total_height:INTEGER = 1200
			-- La hauteur de la {MAP} complète.

	total_width:INTEGER = 1600
			-- La largeur de la {MAP} complète.

	velocity:INTEGER
			-- La vitesse que le fond de {MAP} se déplace.

	set_velocity (a_velocity:INTEGER)
			-- Changer la vitesse du fond de {MAP} pour `a_velocity'.
		require
			Positive_velocity: a_velocity > 0
		do
			velocity := a_velocity
		ensure
			Is_assign: velocity = a_velocity
		end

feature {NONE} -- Implémentation

	walls_creation
		local
			l_wall_1:MUR
			l_wall_2:MUR
			l_wall_3:MUR
			l_wall_4:MUR
			l_wall_5:MUR
			l_wall_6:MUR
			l_wall_7:MUR
			l_wall_8:MUR
			l_wall_9:MUR
			l_wall_10:MUR
			l_wall_11:MUR
			l_wall_12:MUR
			l_wall_13:MUR
		do
			create l_wall_1.make (10,0,10,10)
			create l_wall_2.make (10,0,0,0)
			create l_wall_3.make (10,0,0,0)
			create l_wall_4.make (10,0,0,0)
			create l_wall_5.make (10,0,0,0)
			create l_wall_6.make (0,10,0,0)
			create l_wall_7.make (0,10,0,0)
			create l_wall_8.make (0,10,0,0)
			create l_wall_9.make (0,10,0,0)
			create l_wall_10.make (0,10,0,0)
			create l_wall_11.make (0,10,0,0)
			create l_wall_12.make (0,10,0,0)
			create l_wall_13.make (0,10,0,0)
		end

invariant
	velocity > 0

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
