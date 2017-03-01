note
	description: "Summary description for {IMAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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

end
