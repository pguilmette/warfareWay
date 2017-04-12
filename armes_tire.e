note
	description: "Objet pour déterminer les éléments des armes de tir."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

deferred class
	ARMES_TIRE

inherit
	ARMES

feature -- Accès

	bullet_speed:INTEGER
			-- La vitesse de la balle du fusil

	total_ammunition:INTEGER
			-- Le nombre de balles du fusil au total.

	clip_ammunition:INTEGER
			-- Le nombre de balles du fusil par chargeur.

invariant

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
