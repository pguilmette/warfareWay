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
			l_icon_image:GAME_IMAGE_BMP_FILE
			l_icon:GAME_SURFACE
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
		do
			create l_icon_image.make ("includes/images/icon.bmp")
			create l_window_builder
			l_window_builder.set_dimension (800, 600)
			l_window_builder.set_title ("Warfare Way")
			l_window_builder.enable_must_renderer_synchronize_update
			window := l_window_builder.generate_window
			create test_image.make (window.renderer)
			if l_icon_image.is_openable then
				l_icon_image.open
				if l_icon_image.is_open then
					create l_icon.share_from_image (l_icon_image)
					l_icon.set_transparent_color (create {GAME_COLOR}.make_rgb (255, 0, 255))
					window.set_icon (l_icon)
				else
					print("Cannot set the window icon.")
				end
			end
		end

feature -- Access
	start_game
			-- Partir le jeu
		local
		do
			game_library.quit_signal_actions.extend (agent on_quit)
			game_library.iteration_actions.extend (agent on_iteration)
			if window.renderer.driver.is_present_synchronized_supported then
				game_library.launch_no_delay
			else
				game_library.launch
			end
		end

	window : GAME_WINDOW_RENDERED
			-- La fenêtre principale du jeu

	test_image: MAP
			-- Le fond de la fenêtre

feature {NONE} -- Implementation

	on_iteration(a_timestamp:NATURAL_32)
			-- Événement qui s'exécute à chaque iteration
		do
			window.renderer.draw_texture (test_image, 0, 0)
			window.renderer.present
		end

	on_quit(a_timestamp: NATURAL_32)
			-- Appelé lorsque le 'X' est appuyé dans le coin
		do
			game_library.stop
		end

end
