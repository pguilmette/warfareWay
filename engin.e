note
	description: "Summary description for {JEU}."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "$Date$"
	revision: "$Revision$"

class
	ENGIN

inherit
	GAME_LIBRARY_SHARED
	AUDIO_LIBRARY_SHARED
	MPG_LIBRARY_SHARED

create
    make

feature {NONE} -- Initialisation

	make
			-- Initialisation de `Current'
		local
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
		do
			create l_icon_image.make ("includes/images/icon.bmp")
			create l_window_builder
			l_window_builder.set_dimension (1024, 640)
			l_window_builder.set_title ("Warfare Way")
			l_window_builder.enable_must_renderer_synchronize_update
			window := l_window_builder.generate_window
		end

feature -- Access
	start_game
			-- Partir le jeu
		local
		do
			game_library.launch
		end

	window : GAME_WINDOW_RENDERED

end
