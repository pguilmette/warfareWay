note
	description: "Objet pour les éléments principaux des menus."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

deferred class
	MENU

feature {NONE} -- Initialization

	make(a_window : GAME_RENDERER; a_font:TEXT_FONT)
			-- Initialisation de `Current'
		local
			l_text_title:TEXT_SURFACE_BLENDED
			l_asset_top:IMAGE
			l_asset_mid:IMAGE
			l_asset_bottom:IMAGE
		do
			a_window.set_drawing_color (create {GAME_COLOR}.make_rgb (128, 128, 128))
			a_window.draw_filled_rectangle (0, 0, 800, 600)
			create how_to_play_image.make (a_window, "includes/images/how_to_play_img.jpg")
			create l_asset_top.make (a_window, "includes/images/asset_top.png")
			create l_asset_mid.make (a_window, "includes/images/asset_middle.png")
			create l_asset_bottom.make (a_window, "includes/images/asset_bottom.png")
			a_window.draw_texture (l_asset_top, 500, 5)
			a_window.draw_texture (l_asset_mid, 500, 190)
			a_window.draw_texture (l_asset_bottom, 500, 390)
			create l_text_title.make ("Warfare Way", a_font, create {GAME_COLOR}.make_rgb (0, 0, 128))
		end

feature -- Accès

	has_error:BOOLEAN
			-- Devient `True' si une erreur survient durant la création de `Current'

	how_to_play_image:IMAGE
			-- Image qui explique comment jouer

	sections:ARRAYED_LIST[STRING]
			-- La liste des sections du menu

feature {NONE} -- Implémentation

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Événement lorsqu'une touche est appuyée
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_tab then
					-- à faire
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

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
