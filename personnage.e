note
	description: "Objet pour un personnage du jeu."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

deferred class
	PERSONNAGE

inherit
	GAME_TEXTURE
		rename
			make as make_texture
		end

feature {NONE} -- Implémentation
	make(a_renderer:GAME_RENDERER; a_namefile:STRING)
		-- Initialise `Current'
		local
			l_image:IMG_IMAGE_FILE
		do
			has_error := False
			create l_image.make(a_namefile)
			if l_image.is_openable then
				l_image.open
				if l_image.is_open then
					make_from_image (a_renderer, l_image)
				else
					has_error := True
				end
			else
				has_error := True
			end
		end

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
				if going_down  then
					y := y + speed
				end
			end
		end

	go_left(a_timestamp:NATURAL_32)
		-- `Current' bouge à gauche
		do
			going_left := True
		end

	go_right(a_timestamp:NATURAL_32)
		-- `Current' bouge à droite
		do
			going_right := True
		end

	go_up(a_timestamp:NATURAL_32)
		-- `Current' bouge vers le haut
		do
			going_up := True
		end

	go_down(a_timestamp:NATURAL_32)
		-- `Current' bouge vers le bas
		do
			going_down := True
		end

	stop_left
		-- `Current' arrête de bouger vers la gauche
		do
			going_left := False
		end

	stop_right
		-- `Current' arrête de bouger vers la droite
		do
			going_right := False
		end

	stop_up
		-- `Current' arrête de bouger vers le haut
		do
			going_up := False
		end

	stop_down
		-- `Current' arrête de bouger vers le bas
		do
			going_down := False
		end

	x:INTEGER assign set_x
		-- Position horizontal de `Current'

	y: INTEGER assign set_y
		-- Position vertical de `Current'

	set_x(a_x:INTEGER)
		-- Assigne la valeur de `x' avec `a_x'

		do
			x := a_x
		ensure
			Is_assign: x = a_x
		end

	set_y(a_y:INTEGER)
		-- Assigne la valeur de `y' avec `a_y'
		do
			y := a_y
		ensure
			Is_assign: y = a_y
		end

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

end
