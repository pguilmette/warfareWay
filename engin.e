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
	TEXT_LIBRARY_SHARED

create
    make

feature {NONE} -- Initialisation

	make
			-- Initialisation de `Current'
		local
			l_icon_image:GAME_IMAGE_BMP_FILE
			l_icon:GAME_SURFACE
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
			l_menu:MENU_PRINCIPAL
			--l_font:TEXT_FONT
		do
			create game_music.make
			game_music.play_music
			create l_icon_image.make ("includes/images/icon.bmp")
			create l_window_builder
			l_window_builder.set_dimension (800, 600)
			l_window_builder.set_title ("Warfare Way")
			l_window_builder.enable_must_renderer_synchronize_update
			window := l_window_builder.generate_window
			--create l_font.make ("includes/fonts/Lobster-regular.ttf", 20)
			--create l_menu.make (window, l_font)
			create cursor
			create player.make (window.renderer)
			create ennemy.make (window.renderer)
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

feature -- Accès
	start_game
			-- Partir le jeu
		local
		do
			-- Initilisation des coordonnées
			player.x := 375
			player.y := 200

			ennemy.x := 300
			ennemy.y := 200

			-- Évenements du jeu
			game_library.quit_signal_actions.extend (agent on_quit)
			window.key_pressed_actions.extend (agent on_key_pressed)
			window.key_released_actions.extend (agent on_key_released)
			game_library.iteration_actions.extend (agent on_iteration)
			window.mouse_motion_actions.extend (agent cursor.on_mouse_move)
			if window.renderer.driver.is_present_synchronized_supported then
				game_library.launch_no_delay
			else
				game_library.launch
			end
		end

	window: GAME_WINDOW_RENDERED
			-- La fenêtre principale du jeu

	game_music:MUSIQUE
			-- Musique du jeu

	player:JOUEUR
			-- Personnage que l'utilisateur joue

	ennemy:ENNEMI
			-- Un ennemi de la carte

	cursor:CURSEUR
			-- Curseur du joueur

feature {NONE} -- Implementation

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Événement lorsqu'une touche est appuyée
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_a then
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
				if a_key_state.is_a then
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
		local
			l_angle_rad, l_angle_degree: REAL_64
		do
			window.renderer.clear
			ennemy.update (a_timestamp)
			player.update (a_timestamp)
			l_angle_rad := player.calculate_angle (cursor, player.x, player.y)
			l_angle_degree := -(l_angle_rad * (180/3.1416))
			window.renderer.draw_texture_with_rotation (player, player.x, player.y, 17, 20, l_angle_degree)
			window.renderer.draw_texture (ennemy, ennemy.x, ennemy.y)
			window.renderer.present
			audio_library.update
		end

	on_quit(a_timestamp: NATURAL_32)
			-- Appelé lorsque le 'X' est appuyé dans le coin
		do
			game_library.stop
		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
