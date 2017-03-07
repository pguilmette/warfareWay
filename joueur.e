note
	description: "Summary description for {JOUEUR}."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

class
	JOUEUR

inherit
	PERSONNAGE
		rename
			make as make_personnage
		end

create
	make

feature {NONE} -- Initialisation
	make(a_renderer:GAME_RENDERER)
		-- Initialisation de `Current'
		do
			make_personnage(a_renderer, "includes/images/personnage.png")
		end

end
