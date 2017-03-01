note
	description: "Summary description for {AUDIBLE}."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

deferred class
	AUDIBLE

inherit
	AUDIO_LIBRARY_SHARED
	MPG_LIBRARY_SHARED

feature {NONE} -- Initialisation
	make(a_namefile: STRING)
		-- Initialise `Current'
		do
			audio_library.enable_sound
			audio_library.sources_add
			source := audio_library.last_source_added
			create sound.make(a_namefile)
			sound.open
		end

feature -- Accès

	source:AUDIO_SOURCE
	sound:AUDIO_SOUND_WAV_FILE

	play_music
		-- Permet de faire jouer la musique du jeu
	do
		source.queue_sound_infinite_loop (sound)
		source.play
	end
end
