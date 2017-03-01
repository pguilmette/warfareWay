note
	description: "Summary description for {MENU}."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

deferred class
	MENU

feature {NONE} -- Initialization

	make(a_window : GAME_WINDOW_RENDERED)
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
			a_window.renderer.set_drawing_color (create {GAME_COLOR}.make_rgb (128, 128, 128))
			a_window.renderer.draw_filled_rectangle (0, 0, a_window.width, a_window.height)
			create l_asset_top.make (a_window.renderer, "includes/images/asset_top.png")
			create l_asset_mid.make (a_window.renderer, "includes/images/asset_middle.png")
			create l_asset_bottom.make (a_window.renderer, "includes/images/asset_bottom.png")
			a_window.renderer.draw_texture (l_asset_top, 500, 5)
			a_window.renderer.draw_texture (l_asset_mid, 500, 190)
			a_window.renderer.draw_texture (l_asset_bottom, 500, 390)
		end

feature -- Access

	has_error:BOOLEAN
			-- Devient `True' si une erreur survient durant la création de `Current'

	--sections:ARRAYED_LIST[STRING]
			-- La liste des sections du menu

feature {NONE} -- Implementation

	show_sections(a_text_sections:ARRAYED_LIST[STRING])
			-- Affiche chaque section contenu dans `l_textSections' dans le menu
		local
		do

		end

end
