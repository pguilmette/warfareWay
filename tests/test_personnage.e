note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_PERSONNAGE

inherit
	EQA_TEST_SET
		redefine
			on_prepare,
			on_clean
		end
	PERSONNAGE
		undefine
			default_create
		end
	GAME_LIBRARY_SHARED
		undefine
			default_create
		end

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		local
			l_pixel_format:GAME_PIXEL_FORMAT
			l_builder:GAME_WINDOW_RENDERED_BUILDER
			l_window:GAME_WINDOW_RENDERED
		do
			game_library.enable_video
			create l_pixel_format
			l_pixel_format.set_bgr24
			create l_builder
			l_window := l_builder.generate_window
			create image.make (l_window.renderer, l_pixel_format, 10, 10)
			width := 1
			height := 1
			half_width := 10
			half_height := 10
		end

	on_clean
			-- <Precursor>
		do
			game_library.quit_library
		end

feature -- Test routines

	test_calculate_angle
			-- Test d'utilisation
		local
			l_position, l_position2 : POSITION_TEST
		do
			-- Cas normal
			create l_position.make(50, 50)
			x := 0
			y := 0
			half_width := 10
			half_height := 10
			calculate_angle (l_position)
			assert("Calculate_angle n'est pas valide.(Cas normal)", rotation.rounded = -45)
			-- Cas limite
			create l_position2.make(1, 1)
			half_width := 2
			half_height := 2
			calculate_angle(l_position2)
			assert("Calculate_angle n'est pas valide.(Cas limite)", rotation.rounded = 135 )
		end

end


