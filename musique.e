note
	description: "Summary description for {MUSIQUE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MUSIQUE

inherit
	AUDIBLE
		rename
			make as make_audible
		end

create
	make

feature {NONE} -- Initialisation
	make
		-- Initialise `Current'
		do
			make_audible("includes/audio/htmiami.wav")
		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
