note
	description: "Objet principal pour démarrer le jeu."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

class
	ENGIN

inherit
	GAME_LIBRARY_SHARED
	AUDIO_LIBRARY_SHARED
	MPG_LIBRARY_SHARED

create
    make

feature {NONE} -- Initialization

	make
			-- Initialisation de `Current'
		local
			l_icon_image:GAME_IMAGE_BMP_FILE
			l_icon:GAME_SURFACE
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
		do
			create game_music.make
			game_music.play_music
			create l_icon_image.make ("includes/images/icon.bmp")
			create l_window_builder
			l_window_builder.set_dimension (800, 600)
			l_window_builder.set_title ("Warfare Way")
			l_window_builder.enable_must_renderer_synchronize_update
			window := l_window_builder.generate_window
			create player.make (window.renderer)
			create test_image.make (window.renderer, "includes/images/background.jpg")
			create test_minimap.make (window.renderer, "includes/images/comment_jouer.jpg")
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
			player.x := 375
			player.y := 200
			game_library.quit_signal_actions.extend (agent on_quit)
			window.renderer.draw_texture (test_image, 0, 0)
			window.key_pressed_actions.extend (agent on_key_pressed)
			window.key_released_actions.extend (agent on_key_released)
			game_library.iteration_actions.extend (agent on_iteration)
			if window.renderer.driver.is_present_synchronized_supported then
				game_library.launch_no_delay
			else
				game_library.launch
			end
		end

	window: GAME_WINDOW_RENDERED
			-- La fenêtre principale du jeu

	test_image: IMAGE
			-- Le fond de la fenêtre pour tester

	test_minimap: IMAGE
			-- Une minimap pour tester les touches

	game_music:MUSIQUE
			-- Musique du jeu

	player:JOUEUR
			-- Personnage que l'utilisateur joue

feature {NONE} -- Implementation

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Événement lorsqu'une touche est appuyée
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_tab then
					window.renderer.draw_texture (test_minimap, 100, 75)
				elseif a_key_state.is_a then
					player.go_left (a_timestamp)
				elseif a_key_state.is_d then
					player.go_right (a_timestamp)
				elseif a_key_state.is_w then
					player.go_up (a_timestamp)
				elseif a_key_state.is_s then
					player.go_down (a_timestamp)
				end
			end
		end

	on_key_released(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Événement lorsqu'une touche n'est plus appuyée
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_tab then
					window.renderer.draw_texture (test_image, 0, 0)
				elseif a_key_state.is_a then
					player.stop_left
				elseif a_key_state.is_d then
					player.stop_right
				elseif a_key_state.is_w then
					player.stop_up
				elseif a_key_state.is_s then
					player.stop_down
				end
			end
		end

	on_iteration(a_timestamp: NATURAL_32)
			-- Événement qui s'exécute à chaque iteration
		do
			player.update (a_timestamp)
			window.renderer.draw_texture (player, player.x, player.y)
			window.renderer.present
			audio_library.update
		end

	on_quit(a_timestamp: NATURAL_32)
			-- Appelé lorsque le 'X' est appuyé dans le coin
		do
			game_library.stop
		end

end
