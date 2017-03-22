note
	description: "Objet pour les éléments principaux des menus."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

deferred class
	MENU

feature {NONE} -- Initialization

	make(a_window : GAME_WINDOW_RENDERED; a_font:TEXT_FONT)
			-- Initialisation de `Current'
		local
			l_text_title:TEXT_SURFACE_BLENDED
					-- Le texte à dessiner

			l_asset_top:IMAGE
					-- L'image dans le haut à droite du menu

			l_asset_mid:IMAGE
					-- L'image dans le centre à droite du menu

			l_asset_bottom:IMAGE
					-- L'image dans le bas à droite du menu
		do
			window := a_window
			window.renderer.set_drawing_color (create {GAME_COLOR}.make_rgb (128, 128, 128))
			window.renderer.draw_filled_rectangle (0, 0, a_window.width, a_window.height)
			window.key_pressed_actions.extend (agent on_key_pressed)
			create how_to_play_image.make (window.renderer, "includes/images/how_to_play_img.jpg")
			create l_asset_top.make (window.renderer, "includes/images/asset_top.png")
			create l_asset_mid.make (window.renderer, "includes/images/asset_middle.png")
			create l_asset_bottom.make (window.renderer, "includes/images/asset_bottom.png")
			window.renderer.draw_texture (l_asset_top, 500, 5)
			window.renderer.draw_texture (l_asset_mid, 500, 190)
			window.renderer.draw_texture (l_asset_bottom, 500, 390)
			create l_text_title.make ("Warfare Way", a_font, create {GAME_COLOR}.make_rgb (0, 0, 128))
			if not l_text_title.has_error then
				--window.surface.draw_texture (l_text_title, 20, 20)
			end
		end

feature -- Accès

	has_error:BOOLEAN
			-- Devient `True' si une erreur survient durant la création de `Current'

	how_to_play_image:IMAGE
			-- Image qui explique comment jouer

	window:GAME_WINDOW_RENDERED
			-- La fenêtre principale du jeu

	sections:ARRAYED_LIST[STRING]
			-- La liste des sections du menu

feature {NONE} -- Implémentation

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Événement lorsqu'une touche est appuyée
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_tab then
					window.renderer.draw_texture (how_to_play_image, 100, 75)
				end
			end
		end

	show_sections(a_text_sections:ARRAYED_LIST[STRING])
			-- Affiche chaque section contenu dans `sections' dans le menu
		require
			a_text_sections.count > 0
		local
			Width:INTEGER
			height:INTEGER
		do
			Width := 20
			height := 100
			across
				a_text_sections as section
			loop
				Io.put_string(section.item)
				Io.put_new_line
				height := height + 30
			end
		end

end
