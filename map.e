note
	description: "Objet pour une carte du jeu."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

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
			set_velocity (5)
			create walls_array.make (Walls_amount)
			create ennemy_array.make (Ennemy_amount)
			create ennemy_factory.make (a_renderer)
			walls_creation (a_renderer)
			ennemy_creation (a_renderer)
			make_map (a_renderer, "includes/images/complete_map.jpg")
		end

feature -- Accès

	Walls_amount:INTEGER = 13
			-- Le nombre de {MUR} de `Current'.

	Ennemy_amount:INTEGER = 6
			-- Le nombre d'{ENNEMI} de `Current'.

	walls_array:ARRAYED_LIST[MUR]
			-- La liste de tous les {MUR} de `Current'.

	ennemy_array:ARRAYED_LIST[AFFICHABLE]
			-- La liste de tous les ennemis de `Current'.

	total_height:INTEGER = 1200
			-- La hauteur de la `Current' complète.

	total_width:INTEGER = 1600
			-- La largeur de `Current' complète.

	velocity:INTEGER
			-- La vitesse que le fond de `Current' se déplace.

	ennemy_factory:ENNEMI_FACTORY
			-- Fabrique pour les {ENNEMI}.

	set_velocity (a_velocity:INTEGER)
			-- Changer la vitesse du fond de `Current' pour `a_velocity'.
		require
			Positive_velocity: a_velocity > 0
		do
			velocity := a_velocity
		ensure
			Is_assign: velocity = a_velocity
		end

	move_left
			-- Change la position de `Current' vers la gauche.
		do
			x := x - velocity
		end

	move_right
			-- Change la position de `Current' vers la droite.
		do
			x := x + velocity
		end

	move_up
			-- Change la position de `Current' vers le haut.
		do
			y := y - velocity
		end

	move_down
			-- Change la position de `Current' vers le bas.
		do
			y := y + velocity
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

	ennemy_creation (a_renderer:GAME_RENDERER)
			-- Crée tous les {ENNEMI} de `Current'.
		require
			ennemy_array.capacity = Ennemy_amount
		do
			ennemy_array.extend (ennemy_factory.generate_ennemy (670,30, a_renderer))
			ennemy_array.extend (ennemy_factory.generate_ennemy (100,100, a_renderer))
			ennemy_array.extend (ennemy_factory.generate_ennemy (100,100, a_renderer))
			ennemy_array.extend (ennemy_factory.generate_ennemy (100,100, a_renderer))
			ennemy_array.extend (ennemy_factory.generate_ennemy (100,100, a_renderer))
			ennemy_array.extend (ennemy_factory.generate_ennemy (100,100, a_renderer))
		ensure
			Is_all_assign: ennemy_array.count = Ennemy_amount
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
