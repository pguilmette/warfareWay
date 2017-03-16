note
	description: "Objet pour un personnage ennemi."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

class
	ENNEMI

inherit
	PERSONNAGE
		rename
			make as make_personnage
		end

create
	make

feature {NONE} -- Implémentation

	make(a_renderer:GAME_RENDERER)
		-- Initialisation de `Current'
		do
			make_personnage(a_renderer, "includes/images/ennemi.png")
		end

end
