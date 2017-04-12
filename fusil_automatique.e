note
	description: "Objet pour le fusil automatique."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20160220"

class
	FUSIL_AUTOMATIQUE

inherit
	ARMES_TIRE

create
	make

feature {NONE} -- Initialisation

	make (a_character_type:INTEGER)
			-- Initialisation de `Current'.
		require
			Is_positive: a_character_type >= 0 and a_character_type < 2
		do
			bullet_speed := 10
			total_ammunition := 60
			clip_ammunition := 30
			damage := 30
			if a_character_type = 1 then
				weapon_filename := "includes/images/ennemi_rifle.png"
			else
				weapon_filename := "includes/images/personnage_rifle.png"
			end
		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
