note
	description: "Summary description for {JOUEUR_SERVEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JOUEUR_SERVEUR

inherit JOUEUR
	redefine
		make
	end

create
	make

feature {NONE} -- Initialisation

	make(a_renderer:GAME_RENDERER)
				-- Initialisation de `Current'
			do
				Precursor(a_renderer)
				start_x := 20
				start_y := 20
			end
end
