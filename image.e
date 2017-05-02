note
	description: "Objet pour créer une image à partir d'un fichier."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170328"

class
	IMAGE

inherit
	IMG_LIBRARY_SHARED
	GAME_TEXTURE
		rename
			make as make_texture
		end

create
	make

feature {NONE} -- Initialisation

	make(a_renderer: GAME_RENDERER; a_filename: STRING)
			-- Initialisation de `Current'
		local
			l_image: IMG_IMAGE_FILE
			l_pixel_format:GAME_PIXEL_FORMAT
		do
			create l_pixel_format
			l_pixel_format.set_bgra8888
			create l_image.make (a_filename)
			if l_image.is_openable then
				l_image.open
				if l_image.is_open then
					make_from_image (a_renderer, l_image)
				end
			end
		end

invariant

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
