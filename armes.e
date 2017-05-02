note
	description: "Objet qui détermine les éléments de base des armes."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

deferred class
	ARMES

inherit
	SON

feature -- Accès

	damage:INTEGER
			-- Le nombre de dégâts infligés par coup.

	weapon_filename:STRING
			-- Le nom du fichier de `Current'.

invariant

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
