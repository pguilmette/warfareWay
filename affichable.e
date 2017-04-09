note
	description: "Objet pour les éléments qui peuvent être affichés."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

deferred class
	AFFICHABLE

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

feature

	has_error:BOOLEAN

	image:GAME_TEXTURE

	start_x:INTEGER

	start_y:INTEGER

	width:INTEGER

	height:INTEGER

	rotation:REAL_64

	rotation_center_x:INTEGER

	rotation_center_y:INTEGER

	x:INTEGER assign set_x
			-- Position horizontal de `Current'

	y: INTEGER assign set_y
			-- Position vertical de `Current'

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

invariant

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
