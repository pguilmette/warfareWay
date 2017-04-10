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
			l_font:TEXT_FONT
			--l_menu:MENU_PRINCIPAL
		do
			create game_music.make
			game_music.play_music
			create l_icon_image.make ("includes/images/icon.bmp")
			create l_window_builder
			l_window_builder.set_dimension (800, 600)
			l_window_builder.set_title ("Warfare Way")
			l_window_builder.enable_must_renderer_synchronize_update
			window := l_window_builder.generate_window
			create l_font.make ("includes/fonts/Lobster-regular.ttf", 20)
			-- Temporairement bloqué pour tester le jeu
			--create l_menu.make (window, l_font)
			create cursor
			create {LINKED_LIST[AFFICHABLE]} affichables.make
			create player.make (window.renderer)
			player.set_x (30)
			player.set_y (30)
			create ennemy.make (window.renderer)
			ennemy.set_x (670)
			ennemy.set_y (30)
			create map.make (window.renderer, "includes/images/complete_map.jpg")
			affichables.extend (map)
			affichables.append (map.walls_array)
			affichables.extend (player)
			affichables.extend (ennemy)
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

	map:MAP
			-- La carte du jeu

	ennemy:ENNEMI
			-- Un ennemi de la carte

	cursor:CURSEUR
			-- Curseur du joueur

	affichables:CHAIN[AFFICHABLE]
			-- Objets à afficher dans le `window'

feature {NONE} -- Implémentation

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
		do
			window.renderer.clear
			ennemy.update (a_timestamp)
			player.update (a_timestamp)
			player.calculate_angle (cursor)
			across map.walls_array as la_wall loop
				if player.going_right AND player.x <= 1200 AND player.y > 0 then
					la_wall.item.set_x (la_wall.item.x - player.speed)
				end
				if player.going_left AND player.x > 0 AND player.y > 0 then
					la_wall.item.set_x (la_wall.item.x + player.speed)
				end
				if player.going_up AND player.x > 0 AND player.y > 0  then
					la_wall.item.set_y (la_wall.item.y + player.speed)
				end
				if player.going_down AND player.x < 1600 AND player.y < 1200  then
					la_wall.item.set_y (la_wall.item.y - player.speed)
				end
			end
			across affichables as la_affichable loop
				window.renderer.draw_sub_texture_with_rotation (la_affichable.item.image, la_affichable.item.start_x, la_affichable.item.start_y,
					la_affichable.item.width, la_affichable.item.height, la_affichable.item.x, la_affichable.item.y, la_affichable.item.rotation_center_x,
					la_affichable.item.rotation_center_y, la_affichable.item.rotation)
			end

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
