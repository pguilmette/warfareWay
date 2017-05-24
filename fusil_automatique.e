note
	description: "Objet pour le fusil automatique."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

class
	FUSIL_AUTOMATIQUE

inherit
	ARMES_TIRE

create
	make_for_ennemy,
	make_for_player

feature {NONE} -- Initialisation

	make_for_ennemy (a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'.
		do
			make_thread
			make_rifle_sound
			make_reload_sound
			make_projectile
			bullet_speed := 10
			initial_total_ammunition := 60
			total_ammunition := 60
			initial_clip_ammunition := 30
			clip_ammunition := 30
			damage := 30
			rate_of_fire := 0.05
			reloading := false
			weapon_filename := "includes/images/ennemi_rifle.png"
		ensure
			Is_assign_bullet_speed: bullet_speed = 10
			Is_assign_total_ammunition: total_ammunition = 60
			Is_assign_clip_ammunition: clip_ammunition = 30
			Is_assign_damage: damage = 30
			Is_assign_rate_of_fire: rate_of_fire = 0.05
			Is_assign_weapon_filename: weapon_filename.starts_with ("includes/images/")
			Is_assign_reloading: reloading = false
		end

	make_for_player
			-- Initialisation de `Current'.
		do
			make_thread
			make_rifle_sound
			make_projectile
			bullet_speed := 10
			initial_total_ammunition := 60
			total_ammunition := 60
			initial_clip_ammunition := 30
			clip_ammunition := 30
			damage := 30
			rate_of_fire := 0.05
			reloading := false
			weapon_filename := "includes/images/personnage_rifle.png"
		ensure
			Is_assign_bullet_speed: bullet_speed = 10
			Is_assign_total_ammunition: total_ammunition = 60
			Is_assign_clip_ammunition: clip_ammunition = 30
			Is_assign_damage: damage = 30
			Is_assign_rate_of_fire: rate_of_fire = 0.05
			Is_assign_weapon_filename: weapon_filename.starts_with ("includes/images/")
			Is_assign_reloading: reloading = false
		end

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
