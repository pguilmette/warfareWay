note
	description: "Objet pour l'ensemble des effets sonores du jeu."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170419"

class
	SON

inherit
	AUDIBLE
		rename
			make as make_audible
		end

create
	make_rifle_sound,
	make_knife_sound,
	make_pistol_sound,
	make_reload_sound

feature {NONE} -- Initialisation

	make_rifle_sound
			-- Initialise `Current'.
		do
			make_audible ("include/audio/RIFLE_SHOT.WAV")
		end

	make_knife_sound
			-- Initialise `Current'.
		do
			make_audible ("include/audio/KNIFE_SLASH.WAV")
		end

	make_pistol_sound
			-- Initialise `Current'.
		do
			make_audible ("include/audio/PISTOL_SHOT.WAV")
		end

	make_reload_sound
			-- Initialise `Current'.
		do
			make_audible ("include/audio/RELOAD.WAV")
		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
