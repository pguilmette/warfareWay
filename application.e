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

create
    make

feature {NONE} -- Initialization

    make
            -- Running the game.
        local
        	l_engin:detachable JEU
        do
        	game_library.enable_video
			game_library.hide_mouse_cursor
			create l_engin.make
			if not l_engin.has_error then
				l_engin.run
			end
			l_engin := Void
			game_library.clear_all_events
			game_library.quit_library
        end

end
