note
	description: "Objet pour le couteau."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

class
	COUTEAU

inherit
	ANIMATION
	ARMES

create
	make

feature {NONE} -- Initialisation

	make
			-- Initialisation de `Current'.
		do
			damage := 100
			weapon_filename := "includes/images/personnage_knife.png"
		ensure
			Has_damage_100: damage = 100
		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
