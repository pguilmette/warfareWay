note
	description: "Objet pour les éléments de base d'un obstacle d'un niveau."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

deferred class
	OBSTACLE

feature {NONE} -- Implémentation

	make(a_renderer:GAME_RENDERER)
		-- Initialise `Current'
		do

		end

	width:INTEGER
			-- La largeur de l'obstacle

	height:INTEGER
			-- La hauteur de l'obstacle

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
