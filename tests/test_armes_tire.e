note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170419"
	testing: "type/manual"

class
	TEST_ARMES_TIRE

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE} -- Évènements

	on_prepare
			-- <Precursor>
		do
			create test_rifle.make (0)
			create test_pistol.make
		end

	test_rifle:FUSIL_AUTOMATIQUE
			-- Un {FUSIL_AUTOMATIQUE} de test.

	test_pistol:PISTOLET
			-- Un {PISTOLET} de test.

feature -- Test routines

	test_set_total_ammunition_normal
			-- Test normal de la routine `set_total_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.set_total_ammunition"
		local
			total_ammunition_ok:INTEGER
		do
			total_ammunition_ok := 45
			test_rifle.set_total_ammunition (total_ammunition_ok)
			assert ("test_set_total_ammunition_normal", total_ammunition_ok ~ test_rifle.total_ammunition)
		end

	test_set_total_ammunition_limite
			-- Test limite de la routine `set_total_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.set_total_ammunition"
		local
			total_ammunition_limite:INTEGER
		do
			total_ammunition_limite := 0
			test_rifle.set_total_ammunition (total_ammunition_limite)
			assert ("test_set_total_ammunition_limite", total_ammunition_limite ~ test_rifle.total_ammunition)
		end

	test_set_total_ammunition_errone
			-- Test erroné de la routine `set_total_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.set_total_ammunition"
		local
			total_ammunition_errone:INTEGER
		do
			total_ammunition_errone := -3243
			test_rifle.set_total_ammunition (total_ammunition_errone)
			assert ("test_set_total_ammunition_errone", total_ammunition_errone ~ test_rifle.total_ammunition)
		end

	test_set_clip_ammunition_normal
			-- Test normal de la routine `set_clip_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.set_clip_ammunition"
		local
			clip_ammunition_ok:INTEGER
		do
			clip_ammunition_ok := 5
			test_rifle.set_clip_ammunition (clip_ammunition_ok)
			assert ("test_set_clip_ammunition_normal", clip_ammunition_ok ~ test_rifle.clip_ammunition)
		end

	test_set_clip_ammunition_limite
			-- Test limite de la routine `set_clip_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.set_clip_ammunition"
		local
			clip_ammunition_limite:INTEGER
		do
			clip_ammunition_limite := 5
			test_rifle.set_clip_ammunition (clip_ammunition_limite)
			assert ("test_set_clip_ammunition_limite", clip_ammunition_limite ~ test_rifle.clip_ammunition)
		end

	test_set_clip_ammunition_errone
			-- Test erroné de la routine `set_clip_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.set_clip_ammunition"
		local
			clip_ammunition_errone:INTEGER
		do
			clip_ammunition_errone := -234
			test_rifle.set_clip_ammunition (clip_ammunition_errone)
			assert ("test_set_clip_ammunition_errone", clip_ammunition_errone ~ test_rifle.clip_ammunition)
		end

	test_shoot_weapon_total_ammunition_normal
			-- Test normal de la routine `shoot_weapon' pour l'attribut `total_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.shoot_weapon"
		local
			current_total_ammunition:INTEGER
		do
			test_rifle.set_total_ammunition (70)
			test_rifle.set_clip_ammunition (20)
			current_total_ammunition := test_rifle.total_ammunition
			test_rifle.shoot_weapon
			assert ("test_shoot_weapon_normal: total_ammunition", current_total_ammunition - 1 ~ test_rifle.total_ammunition)
		end

	test_shoot_weapon_clip_ammunition_normal
			-- Test normal de la routine `shoot_weapon' pour l'attribut `clip_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.shoot_weapon"
		local
			current_clip_ammunition:INTEGER
		do
			test_rifle.set_total_ammunition (70)
			test_rifle.set_clip_ammunition (20)
			current_clip_ammunition := test_rifle.clip_ammunition
			test_rifle.shoot_weapon
			assert ("test_shoot_weapon_normal: clip_ammunition", current_clip_ammunition - 1 ~ test_rifle.clip_ammunition)
		end

	test_shoot_weapon_total_ammunition_limite
			-- Test limite de la routine `shoot_weapon' pour l'attribut `total_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.shoot_weapon"
		local
			current_total_ammunition:INTEGER
		do
			test_rifle.set_total_ammunition (1)
			test_rifle.set_clip_ammunition (1)
			current_total_ammunition := test_rifle.total_ammunition
			test_rifle.shoot_weapon
			assert ("test_shoot_weapon_limite: total_ammunition", current_total_ammunition - 1 ~ test_rifle.total_ammunition)
		end

	test_shoot_weapon_clip_ammunition_limite
			-- Test limite de la routine `shoot_weapon' pour l'attribut `clip_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.shoot_weapon"
		local
			current_clip_ammunition:INTEGER
		do
			test_rifle.set_total_ammunition (1)
			test_rifle.set_clip_ammunition (1)
			current_clip_ammunition := test_rifle.clip_ammunition
			test_rifle.shoot_weapon
			assert ("test_shoot_weapon_limite: clip_ammunition", current_clip_ammunition - 1 ~ test_rifle.clip_ammunition)
		end

	test_shoot_weapon_total_ammunition_errone
			-- Test erroné de la routine `shoot_weapon' pour l'attribut `total_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.shoot_weapon"
		local
			current_total_ammunition:INTEGER
		do
			test_rifle.set_total_ammunition (0)
			test_rifle.set_clip_ammunition (0)
			current_total_ammunition := test_rifle.total_ammunition
			test_rifle.shoot_weapon
			assert ("test_shoot_weapon_errone: total_ammunition", current_total_ammunition - 1 ~ test_rifle.total_ammunition)
		end

	test_shoot_weapon_clip_ammunition_errone
			-- Test erroné de la routine `shoot_weapon' pour l'attribut `clip_ammunition'.
		note
			testing:  "covers/{ARMES_TIRE}.shoot_weapon"
		local
			current_clip_ammunition:INTEGER
		do
			test_rifle.set_total_ammunition (0)
			test_rifle.set_clip_ammunition (0)
			current_clip_ammunition := test_rifle.clip_ammunition
			test_rifle.shoot_weapon
			assert ("test_shoot_weapon_errone: clip_ammunition", current_clip_ammunition - 1 ~ test_rifle.clip_ammunition)
		end

	test_reload_normal
			-- Test normal de la routine `reload'.
		note
			testing:  "covers/{ARMES_TIRE}.reload"
		local
			before_total_ammunition:INTEGER
		do
			test_rifle.set_total_ammunition (60)
			test_rifle.set_clip_ammunition (8)
			before_total_ammunition := test_rifle.total_ammunition
			test_rifle.shoot_weapon
			test_rifle.launch
			assert ("test_reload_normal", test_rifle.total_ammunition ~ (before_total_ammunition - 1))
		end

	test_reload_missing_bullets_limite
			-- Test limite de la routine `reload'.
		note
			testing:  "covers/{ARMES_TIRE}.reload"
		local
			before_total_ammunition:INTEGER
		do
			test_rifle.set_total_ammunition (7)
			test_rifle.set_clip_ammunition (4)
			before_total_ammunition := test_rifle.total_ammunition
			test_rifle.shoot_weapon
			test_rifle.launch
			assert ("test_reload_missing_bullets_limite: pas assez de balles", test_rifle.total_ammunition ~ 6)
		end

	test_reload_full_clip_limite
			-- Test limite de la routine `reload'.
		note
			testing:  "covers/{ARMES_TIRE}.reload"
		local
			before_total_ammunition:INTEGER
		do
			test_rifle.set_total_ammunition (33)
			before_total_ammunition := test_rifle.total_ammunition
			test_rifle.launch
			assert ("test_reload_full_clip_limite: chargeur plein", test_rifle.total_ammunition ~ 33)
		end

end


