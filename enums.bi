'ENUMS
enum proto_pl_action
    none = 0
    running = 1
    jumping = 2
    sliding = 3
    falling = 4
    falled = 5
    gk_jumping = 6
    gk_falled = 7
    gk_falled_w_ball = 8
    gk_w_ball = 9
    throw_in = 10
    free_kicker = 11
    bench = 12
end enum

enum proto_game_section
	main_menu = 0
	tactic_editor = 1
	game = 2
	credits = 3
	exit_game = 4
end enum

enum proto_match_event
    none = 0
    ball_in_game
    penalty_t0
    penalty_t1
    throw_in_lside_t0
    throw_in_lside_t1
    throw_in_rside_t0
    throw_in_rside_t1
    throw_in_tl_side_t0
    throw_in_tl_side_t1
    throw_in_tr_side_t0
    throw_in_tr_side_t1
    throw_in_bl_side_t0
    throw_in_bl_side_t1
    throw_in_br_side_t0
    throw_in_br_side_t1
    corner_tl_side_t0
    corner_tl_side_t1
    corner_tr_side_t0
    corner_tr_side_t1
    corner_bl_side_t0
    corner_bl_side_t1
    corner_br_side_t0
    corner_br_side_t1
    gk_t0_owner
    gk_t1_owner
    ball_on_centre_t0 
    ball_on_centre_t1
    foul_t0
    foul_t1
    team_presentation
    presentation
    resetting_start_position
    interval
    happy_t0
    happy_t1
end enum
