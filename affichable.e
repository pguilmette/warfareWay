note
	description: "Objet pour les éléments qui peuvent être affichés."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

deferred class
	AFFICHABLE

inherit
	POSITION

feature {NONE} -- Implémentation
	make(a_renderer:GAME_RENDERER; a_namefile:STRING)
			-- Initialise `Current'
		local
			l_image:IMG_IMAGE_FILE
			l_pixel_format:GAME_PIXEL_FORMAT
			l_image_width_divise : REAL_64
			l_image_height_divise : REAL_64
		do
			create l_pixel_format
			l_pixel_format.set_bgra8888
			has_error := False
			create l_image.make(a_namefile)
			if l_image.is_openable then
				l_image.open
				if l_image.is_open then
					create image.make_from_image (a_renderer, l_image)
					x := 0
					y := 0
					start_x := 0
					start_y := 0
					width := image.width
					height := image.height
					l_image_width_divise := width/2
					l_image_height_divise := width/2
					rotation_center_x := l_image_width_divise.rounded
					rotation_center_y := l_image_height_divise.rounded
					rotation := 0
				else
					has_error := True
					create image.make(a_renderer, l_pixel_format, 1, 1)
				end
			else
				has_error := True
				create image.make(a_renderer, l_pixel_format, 1, 1)
			end
		end

	make_without_file(a_renderer:GAME_RENDERER; a_width, a_height, a_position_x, a_position_y:INTEGER)
			-- Initialise `Current'
		local
			l_pixel_format:GAME_PIXEL_FORMAT
			l_image_width_divise : REAL_64
			l_image_height_divise : REAL_64
			l_texture:GAME_TEXTURE_TARGET
		do
			create l_pixel_format
			l_pixel_format.set_bgra8888
			has_error := False
			x := a_position_x
			y := a_position_y
			start_x := 0
			start_y := 0
			width := a_width
			height := a_height
			l_image_width_divise := width/2
			l_image_height_divise := width/2
			rotation_center_x := l_image_width_divise.rounded
			rotation_center_y := l_image_height_divise.rounded
			rotation := 0
			create l_texture.make (a_renderer, l_pixel_format, a_width, a_height)
			a_renderer.set_target (l_texture)
			a_renderer.set_drawing_color (create {GAME_COLOR}.make_rgb (0, 0, 0))
			a_renderer.clear
			a_renderer.set_original_target
			image := l_texture
		end

	make_with_image (a_renderer:GAME_RENDERER; a_image:IMAGE)
			-- Initialise `Current'
		local
			l_pixel_format:GAME_PIXEL_FORMAT
			l_image_width_divise : REAL_64
			l_image_height_divise : REAL_64
		do
			create l_pixel_format
			l_pixel_format.set_bgra8888
			x := 0
			y := 0
			start_x := 0
			start_y := 0
			width := a_image.width
			height := a_image.height
			l_image_width_divise := width/2
			l_image_height_divise := width/2
			rotation_center_x := l_image_width_divise.rounded
			rotation_center_y := l_image_height_divise.rounded
			rotation := 0
		end

feature -- Accès

	has_error:BOOLEAN
			-- `True' si l'objet a une erreur.

	image:GAME_TEXTURE
			-- L'image à afficher.

	start_x:INTEGER
			-- La position de départ de `Current' sur l'axe horizontale.

	start_y:INTEGER
			-- La position de départ de `Current' sur l'axe verticale.

	width:INTEGER
			-- La largeur de `Current'.

	height:INTEGER
			-- La hauteur de `Current'.

	rotation:REAL_64
			-- La rotation de `Current' en degrées.

	rotation_center_x:INTEGER
			-- Centre de rotation en x de l'objet

	rotation_center_y:INTEGER
			-- Centre de rotation en y de l'objet

	x:INTEGER assign set_x
		-- Position en x de l'objet

	y:INTEGER assign set_y
		-- Position en y de l'objet

	set_y(a_y:INTEGER)
			-- Assigne la valeur de `y' avec `a_y'.
		do
			y := a_y
		ensure
			Is_assign: y = a_y
		end

	set_x(a_x:INTEGER)
			-- Assigne la valeur de `x' avec `a_x'.
		do
			x := a_x
		ensure
			Is_assign: x = a_x
		end

	set_start_x(a_x:INTEGER)
			-- Assigne la valeur de `start_x' avec `a_x'.
		do
			start_x := a_x
		ensure
			Is_assign: start_x = a_x
		end

	set_start_y(a_y:INTEGER)
			-- Assigne la valeur de `start_y' avec `a_y'.
		do
			start_y := a_y
		ensure
			Is_assign: start_y = a_y
		end

	set_width(a_width:INTEGER)
			-- Assigne la valeur de `width' avec `a_width'.
		do
			width := a_width
		ensure
			Is_assign: width = a_width
		end

	set_height(a_height:INTEGER)
			-- Assigne la valeur de `height' avec `a_height'.
		do
			height := a_height
		ensure
			Is_assign: height = a_height
		end

	set_rotation(a_rotation:INTEGER)
			-- Assigne la valeur de `rotation' avec `a_rotation'.
		do
			rotation := a_rotation
		ensure
			Is_assign: rotation = a_rotation
		end

	set_rotation_center_x(a_x:INTEGER)
			-- Assigne la valeur de `rotation_center_x' avec `a_x'.
		do
			rotation_center_x := a_x
		ensure
			Is_assign: rotation_center_x = a_x
		end

	set_rotation_center_y(a_y:INTEGER)
			-- Assigne la valeur de `rotation_center_y' avec `a_y'.
		do
			rotation_center_y := a_y
		ensure
			Is_assign: rotation_center_y = a_y
		end

	center_x:INTEGER
		-- Centre en x de l'objet
	do
		result := x + width//2
	end

	center_y:INTEGER
		-- Centre en y de l'objet
	do
		result := y + height//2
	end

invariant
	width > 0
	height > 0

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
