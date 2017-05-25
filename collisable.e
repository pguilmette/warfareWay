note
	description: "Objet pour les collisions du jeu."
	author: "Étienne Boutet"
	author: "Philippe Guilmette"
	date: "20170523"

deferred class
	COLLISABLE

feature -- Accès

	x : INTEGER_32
			-- Position en x de l'objet
		deferred end

	y : INTEGER_32
			-- Position en y de l'objet
		deferred end

	width : INTEGER_32
			-- Largeur de l'objet
		deferred end

	height : INTEGER_32
			-- Hauteur de l'objet
		deferred end


	valide_collision(a_objet_collision : COLLISABLE) : BOOLEAN
			-- Permet de valider si il y a une collision entre 2 objets
			-- Retourne vrai ou faux
		do
			Result :=
					valide_collision_from_collisables(current, a_objet_collision)
				or
					valide_collision_from_collisables(a_objet_collision, current)
		end

feature {NONE} -- Initialisation

	valide_collision_from_collisables(a_collisable_1, a_collisable_2:COLLISABLE) : BOOLEAN
			-- Permet de vérifier s'il y a une collision entre deux objets de type collisable.
		do
			Result :=
				(
					a_collisable_1.x >= a_collisable_2.x and
				  	a_collisable_1.x <= a_collisable_2.x + a_collisable_2.width and
				  	a_collisable_1.y >= a_collisable_2.y and
				  	a_collisable_1.y <= a_collisable_2.y + a_collisable_2.height
				) or (
			  		a_collisable_1.x + a_collisable_1.width >= a_collisable_2.x and
				  	a_collisable_1.x + a_collisable_1.width <= a_collisable_2.x + a_collisable_2.width and
				  	a_collisable_1.y >= a_collisable_2.y and
				  	a_collisable_1.y <= a_collisable_2.y + a_collisable_2.height
				) or (
			  		a_collisable_1.x >= a_collisable_2.x and
				  	a_collisable_1.x <= a_collisable_2.x + a_collisable_2.width and
				  	a_collisable_1.y + a_collisable_1.height >= a_collisable_2.y and
				  	a_collisable_1.y + a_collisable_1.height <= a_collisable_2.y + a_collisable_2.height
				) or (
				  	a_collisable_1.x + a_collisable_1.width >= a_collisable_2.x and
				  	a_collisable_1.x + a_collisable_1.width <= a_collisable_2.x + a_collisable_2.width and
				  	a_collisable_1.y + a_collisable_1.height >= a_collisable_2.y and
				  	a_collisable_1.y + a_collisable_1.height <= a_collisable_2.y + a_collisable_2.height
				)
		end

invariant

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
