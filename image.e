note
	description: "Objet pour créer une image à partir d'un fichier."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160328"

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
		do
			create l_image.make (a_filename)
			if l_image.is_openable then
				l_image.open
				if l_image.is_open then
					make_from_image (a_renderer, l_image)
				end
			end
		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
