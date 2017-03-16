note
	description: "Summary description for {CURSEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CURSEUR

feature -- Accès
	last_x:INTEGER
		-- Dernière position en x du curseur
	last_y:INTEGER
		-- Dernière position en y du curseur

feature {NONE} -- Implémentation

	on_mouse_move(a_timestamp: NATURAL_32; a_mouse_state: GAME_MOUSE_MOTION_STATE)
		-- Lorsque le curseur bouge, change les information de `a_mouse_state'
	do
		last_x := a_mouse_state.x
		last_y := a_mouse_state.y
	end

	on_mouse_down(a_timestamp: NATURAL_32; a_mouse_state: GAME_MOUSE_BUTTON_RELEASED_STATE)
		-- Lorsque l'utilisateur pèse sur la souris
	do

	end

	on_mouse_up(a_timestamp: NATURAL_32; a_mouse_state: GAME_MOUSE_BUTTON_RELEASED_STATE)
		-- Lorsque l'utilisateur ne pèse plus sur la souris
	do

	end


end
