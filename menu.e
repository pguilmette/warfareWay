note
	description: "Summary description for {MENU}."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

deferred class
	MENU

feature {NONE} -- Initialization

	make(window : GAME_WINDOW_RENDERED)
			-- Initialisation de `Current'
		local
			l_text_title:TEXT_SURFACE_BLENDED
				do
					Result := "Warfare Way"
				end
			l_text_sections:ARRAYED_LIST[STRING]
		do
			window.renderer.set_drawing_color (create {GAME_COLOR}.make_rgb (128, 128, 128))
			window.renderer.draw_filled_rectangle (0, 0, window.width, window.height)
			create asset_top.make (window.renderer, "includes/images/asset_top.jpg")
			create asset_mid.make (window.renderer, "includes/images/asset_middle.jpg")
			create asset_bottom.make (window.renderer, "includes/images/asset_bottom.jpg")
			--window.renderer.draw_texture (asset_top, 600, 30)
			--window.renderer.draw_texture (asset_mid, 600, 230)
			--window.renderer.draw_texture (asset_bottom, 600, 430)
		end

feature -- Access

	has_error:BOOLEAN
			-- Devient `True' si une erreur survient durant la création de `Current'

	asset_links:ARRAYED_LIST[STRING]
		do
			asset_links.put("includes/images/asset_top.jpg")
			asset_links.put("includes/images/asset_middle.jpg")
			asset_links.put("includes/images/asset_bottom.jpg")
		end

feature {NONE} -- Implementation

	show_sections(a_text_sections:ARRAYED_LIST[STRING])
			-- Affiche chaque section contenu dans `l_textSections' dans le menu
		local
		do

		end

	create_assets(a_links:ARRAYED_LIST[STRING])
			-- Crée les images à mettre sur les menus
		local
		do

		end

end
