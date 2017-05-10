note
	description: "Summary description for {JOUEUR_CLIENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JOUEUR_CLIENT

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
			initialise(a_renderer, "includes/images/personnage_pistol.png")
		end

end
