note
    description : "Objet principal du jeu pour initialiser les librairies"
    author      : "Philippe Guilmette"
    author      : "Étienne Boutet"
    generator   : "Eiffel Game2 Project Wizard"
    date        : "2017-02-07 08:03:10.728 +0000"

class
    APPLICATION

inherit
	GAME_LIBRARY_SHARED
	IMG_LIBRARY_SHARED

create
    make

feature {NONE} -- Initialization

    make
            -- Exécution du jeu
        local
        	l_engine : detachable ENGIN
        		-- L'engin principal du jeu
        do
        	game_library.enable_video
			game_library.hide_mouse_cursor
			image_file_library.enable_image (true, false, true)
			create l_engine.make
			if not l_engine.has_error then
				l_engine.start_game
			end
			l_engine := Void
			game_library.clear_all_events
			game_library.quit_library
			image_file_library.quit_library
        end

end
