note
	description: "Objet principal pour démarrer le jeu."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

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
			create {LINKED_LIST[AFFICHABLE]} viewable.make
			create player_client.make (window.renderer)
			create online.make
			player_client.set_x (30)
			player_client.set_y (30)
--			create player.make (window.renderer)
--			player.set_x (30)
--			player.set_y (30)
--			create player_2.make (window.renderer)
--			player_2.set_x (400)
--			player_2.set_y (200)
--			create ennemy.make (0,0, window.renderer)
--			ennemy.set_x (270)
--			ennemy.set_y (100)
			create map.make (window.renderer, "includes/images/complete_map.jpg")
			online.launch
			viewable.extend (map)
			viewable.append (map.walls_array)
			viewable.append (map.ennemy_array)
			viewable.extend (player_client)
--			viewable.extend (player_2)
--			viewable.extend (ennemy)
			if l_icon_image.is_openable then
				l_icon_image.open
				if l_icon_image.is_open then
					create l_icon.share_from_image (l_icon_image)
					l_icon.set_transparent_color (create {GAME_COLOR}.make_rgb (255, 0, 255))
					window.set_icon (l_icon)
				else
					print("Impossible de mettre une icône de fenêtre.")
				end
			end
		end

feature -- Accès
	start_game
			-- Partir le jeu
		local
		do
			-- Événements du jeu
			game_library.quit_signal_actions.extend (agent on_quit)
			window.key_pressed_actions.extend (agent on_key_pressed_client)
			window.key_released_actions.extend (agent on_key_released_client)
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

	player_client:JOUEUR_CLIENT
			-- Personnage que le joueur client joue

	game_music:MUSIQUE
			-- Musique du jeu

	map:MAP
			-- La carte du jeu

	cursor:CURSEUR
			-- Curseur du joueur

	viewable:CHAIN[AFFICHABLE]
			-- Objets à afficher dans le `window'

	online:MULTIJOUEUR
			-- Objet servant à jouer en ligne

feature {NONE} -- Implémentation

	on_key_pressed_client(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Événement lorsqu'une touche est appuyée
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_a AND a_key_state.is_d then
					player_client.stop_left
					player_client.stop_right
				elseif a_key_state.is_a then
					player_client.go_left (a_timestamp)
				elseif a_key_state.is_d then
					player_client.go_right (a_timestamp)
				end
				if a_key_state.is_w AND a_key_state.is_s then
					player_client.stop_up
					player_client.stop_down
				elseif a_key_state.is_w then
					player_client.go_up (a_timestamp)
				elseif a_key_state.is_s then
					player_client.go_down (a_timestamp)
				end
			end
		end

	on_key_released_client(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Événement lorsqu'une touche n'est plus appuyée
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_a AND player_client.going_left then
					player_client.stop_left
				elseif a_key_state.is_d AND player_client.going_right then
					player_client.stop_right
				elseif a_key_state.is_w AND player_client.going_up then
					player_client.stop_up
				elseif a_key_state.is_s AND player_client.going_down then
					player_client.stop_down
				end
			end
		end

	on_iteration(a_timestamp: NATURAL_32)
			-- Événement qui s'exécute à chaque iteration
		local
			l_item:AFFICHABLE
		do
			window.renderer.clear
			player_client.update (a_timestamp)
			player_client.calculate_angle (cursor)
			across map.walls_array as la_wall loop
				if player_client.going_right then
					la_wall.item.set_x (la_wall.item.x - map.velocity)
				end
				if player_client.going_left then
					la_wall.item.set_x (la_wall.item.x + map.velocity)
				end
				if player_client.going_up then
					la_wall.item.set_y (la_wall.item.y + map.velocity)
				end
				if player_client.going_down then
					la_wall.item.set_y (la_wall.item.y - map.velocity)
				end
			end
			across viewable as la_viewable loop
				l_item := la_viewable.item
				window.renderer.draw_sub_texture_with_rotation (la_viewable.item.image, la_viewable.item.start_x, la_viewable.item.start_y,
					la_viewable.item.width, la_viewable.item.height, la_viewable.item.x, la_viewable.item.y, la_viewable.item.rotation_center_x,
					la_viewable.item.rotation_center_y, la_viewable.item.rotation)
			end
			window.renderer.present
			audio_library.update
		end

	on_quit(a_timestamp: NATURAL_32)
			-- Appelé lorsque le 'X' est appuyé dans le coin
		do
			game_library.stop
		end

	can_go_up:BOOLEAN
			-- Le `player' peut aller en haut.
		do
			Result := map.y - map.velocity >= 0
		end

	can_go_down:BOOLEAN
			-- Le `player' peut aller en bas.
		do
			Result := map.y + window.renderer.output_size.height + map.velocity < map.height
		end

	can_go_left:BOOLEAN
			-- Le `player' peut aller à gauche.
		do
			Result := map.x - map.velocity >= 0
		end

	can_go_right:BOOLEAN
			-- Le `player' peut aller à droite.
		do
			Result := map.x + window.renderer.output_size.width + map.velocity < map.width
		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
