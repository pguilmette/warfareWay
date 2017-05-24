note
	description: "Objet pour les projectiles (balles)."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170510"

class
	PROJECTILE

create
	make

feature {NONE} -- Initialisation

	make
			-- Initialisation de `Current'.
		do
			bullet_speed := 1
		end

feature -- Accès

	bullet_speed:INTEGER
			-- La vitesse de la balle de {ARMES_TIRE}.

	angle_personnage:REAL_64
			-- L'angle du {PERSONNAGE}.

feature {NONE} -- Implémentation

	bullet_movement (a_angle:REAL_64)
			-- Le déplacement de `Current' lorsque le {PERSONNAGE} tire.
		local
			l_vitesse_projectile:REAL_64
		do
			l_vitesse_projectile := 1
			if (a_angle.rounded\\90 /= 0) then

			else
				l_vitesse_projectile := a_angle
			end
		end

invariant

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end

