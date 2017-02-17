note
	description: "Summary description for {JEU}."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "$Date$"
	revision: "$Revision$"

class
	ENGIN

create
    make

feature {NONE} -- Initialisation

	make
			-- Initialisation de `Current'
		local
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
		do
			create l_window_builder
			l_window_builder.set_dimension (1024, 640)
			l_window_builder.set_title ("Warfare Way")
			l_window_builder.enable_must_renderer_synchronize_update
		end

feature -- Access
	has_error : BOOLEAN

	start_game
		local
		do
			
		end

end
