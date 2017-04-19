note
	description: "Objet pour déterminer les éléments des armes de tir."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

deferred class
	ARMES_TIRE

inherit
	THREAD
		rename
			make as make_thread
		end
	ARMES

feature -- Accès

	bullet_speed:INTEGER
			-- La vitesse de la balle du fusil

	total_ammunition:INTEGER
			-- Le nombre de balles du fusil au total.

	set_total_ammunition (a_total_bullets_left:INTEGER)
			-- Changer le nombre de balles restantes total de `Current' pour `a_total_bullets_left'.
		require
			Positive_amount: a_total_bullets_left >= 0
		do
			total_ammunition := a_total_bullets_left
		ensure
			Is_assign: total_ammunition = a_total_bullets_left
		end

	clip_ammunition:INTEGER
			-- Le nombre de balles du fusil par chargeur.

	set_clip_ammunition (a_bullets_left:INTEGER)
			-- Changer le nombre de balles restantes du chargeur de `Current' pour `a_bullets_left'.
		require
			Positive_amount: a_bullets_left >= 0
		do
			clip_ammunition := a_bullets_left
		ensure
			Is_assign: clip_ammunition = a_bullets_left
		end

	rate_of_fire:REAL
			-- La cadance de tir du fusil (temps entre chaque balle).

	reloading:BOOLEAN
			-- `True' si `Current' est en rechargement.

	reload_time:INTEGER = 3
			-- Le temps à recharger `Current' en secondes.

	shoot_weapon
		require
			total_ammunition > 0
			clip_ammunition > 0
			reloading = false
		do
			clip_ammunition := clip_ammunition - 1
			total_ammunition := total_ammunition - 1
		end


feature {NONE} -- Implémentation

	reload
		require
			reloading = false
		do
			reloading := true
			total_ammunition := total_ammunition // clip_ammunition
		ensure
			Is_assign_reloading: reloading = true
		end

	execute
			-- L'exécution du {THREAD}.
		do
			sleep (reload_time * (1000000000))
			reload
		end

invariant
	total_ammunition >= 0
	clip_ammunition >= 0
	rate_of_fire > 0
	bullet_speed > 0

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
