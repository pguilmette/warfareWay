note
	description: "Summary description for {JOUER_CLIENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JOUER_CLIENT

inherit
	JOUEUR
		redefine
			make
		end

create
	make

feature {NONE} -- Initialisation
	make(a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'
		do
			initialise(a_renderer, "includes/images/ennemi_rifle.png")
			start_x := 50
			start_y := 50
		end

end
