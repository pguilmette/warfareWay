note
	description: "Objet pour une carte du jeu."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

class
	MAP

inherit
	AFFICHABLE
		rename
			make as make_map
		end


create
	make

feature {NONE} -- Initialisation

	make(a_renderer:GAME_RENDERER; a_filename:STRING)
			-- Initialisation de `Current'
		do
			set_velocity (1)
			create walls_array.make (Walls_amount)
			walls_creation (a_renderer)
			make_map (a_renderer, "includes/images/complete_map.jpg")
		end

feature -- Accès

	Walls_amount:INTEGER = 13
			-- Le nombre de {MUR} de `Current'.

	walls_array:ARRAYED_LIST[AFFICHABLE]
			-- La liste de tous les murs de `Current'.

	total_height:INTEGER = 1200
			-- La hauteur de la `Current' complète.

	total_width:INTEGER = 1600
			-- La largeur de `Current' complète.

	velocity:INTEGER
			-- La vitesse que le fond de `Current' se déplace.

	set_velocity (a_velocity:INTEGER)
			-- Changer la vitesse du fond de `Current' pour `a_velocity'.
		require
			Positive_velocity: a_velocity > 0
		do
			velocity := a_velocity
		ensure
			Is_assign: velocity = a_velocity
		end

feature {NONE} -- Implémentation

	walls_creation (a_renderer:GAME_RENDERER)
			-- Crée tous les {MUR} de `Current'.
		require
			walls_array.capacity = Walls_amount
		do
			walls_array.extend(create {MUR}.make (25,287,622,0, a_renderer))
			walls_array.extend(create {MUR}.make (25,312,935,0, a_renderer))
			walls_array.extend(create {MUR}.make (271,25,960,287, a_renderer))
			walls_array.extend(create {MUR}.make (230,25,1370,287, a_renderer))
			walls_array.extend(create {MUR}.make (282,25,0,641, a_renderer))
			walls_array.extend(create {MUR}.make (204,25,443,641, a_renderer))
			walls_array.extend(create {MUR}.make (25,237,622,404, a_renderer))
			walls_array.extend(create {MUR}.make (25,643,935,557, a_renderer))
			walls_array.extend(create {MUR}.make (271,25,960,557, a_renderer))
			walls_array.extend(create {MUR}.make (230,25,1370,557, a_renderer))
			walls_array.extend(create {MUR}.make (282,25,0,960, a_renderer))
			walls_array.extend(create {MUR}.make (108,25,443,960, a_renderer))
			walls_array.extend(create {MUR}.make (25,216,526,985, a_renderer))
		ensure
			Is_all_assign: walls_array.count = Walls_amount
		end

invariant
	Is_positive: velocity > 0

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
