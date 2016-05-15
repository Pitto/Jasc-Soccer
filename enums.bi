'ENUMS
enum proto_pl_action
    none
    running
    jumping
    sliding
    falling
    falled
    gk_jumping
    gk_falled
    gk_falled_w_ball
    gk_w_ball
    throw_in
    free_kicker
    bench
end enum

enum proto_game_section
	splashscreen
	main_menu 
	tactic_editor 
	team_editor
	bhv_editor
	game
	pre_match_formation
	credits
	exit_game
end enum

enum proto_ball_position
	bp_corner_kick_tl = 0
	bp_corner_kick_tr
	bp_corner_kick_bl
	bp_corner_kick_br
	bp_penalty_top
	bp_penalty_bottom
	bp_throw_in_tl
	bp_throw_in_tr
	bp_throw_in_bl
	bp_throw_in_br
	bp_kick_off
	bp_free_kick
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
