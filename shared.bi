'__MAIN_________________________________________________________________
Dim shared Game_section as proto_game_section
Game_section = splashscreen
'match is PC vs PC or Human vs PC?
dim shared Human_control 				as integer = 0
'training mode, play with your team against only the opponent GK
dim shared Training_mode 				as integer = 0

'__FONTS________________________________________________________________
DIM SHARED SmallFont 	AS FontType
DIM SHARED UniFont 		AS FontType
DIM SHARED CoolFont 	AS FontType
DIM SHARED ButtonFont 	AS FontType

'__DELTA TIMING_________________________________________________________
dim SHARED Dt 			as single =0.0165' Delta Timing
DIM SHARED Debug 		as Integer = 0

'__EXIT FLAG - useful for menu navigation_______________________________
DIM shared Exit_flag as Integer = 0

'__TACTICS______________________________________________________________
'[0-9]Tactic slot;[0-9]Player slot;[0-35]Tile slot
dim shared tct_tile(0 to 9, 0 to 9, 0 to 35)	as Integer 'tactic array
dim shared tct_tile_label(10) as String*3 = {	"442","433","352",  _
												"532", "424","451", _
												"541","swp","att","def"} 
'__BEHAVIOUR____________________________________________________________
'[0-35] tile [0-9] player (GK doesn't have behaviour)
'it gives a percentage table for the behavior
'of the players owners of the ball - see 'get_pl_behavior' SUB
dim shared Bhv_tile(0 to 35, 0 to 9) as Integer 	'behavior array
dim shared Bhv_tile_edit_copy(0 to 35, 0 to 9) as Integer
dim shared Bhv_actions_labels(10) as String*16 =  {	"PASS NEAREST",_
													"PASS 2ND NEAREST",_
													"PASS SHORT SIDE",_
													"PASS LONG SIDE",_
													"PASS ENDLINE",_
													"PASS CENTER",_
													"RUN CENTRE",_
													"RUN TO NET",_
													"RUN TO ENDLINE",_
													"SHOOT IN TARGET"}
'__BITMAPS______________________________________________________________
'KIT overlay
DIM SHARED Kit_overlay(KIT_TOT_N) 	AS ANY PTR
'Players sprites
DIM SHARED Pl_sprite_0(0 to 2, 0 to PL_SPRITES_TOT_N) 	AS ANY PTR 
DIM SHARED Pl_sprite_1(0 to 2, 0 to PL_SPRITES_TOT_N) 	AS ANY PTR
DIM SHARED Gk_sprite(0 to 2, 0 to PL_SPRITES_TOT_N) 	AS ANY PTR 
DIM SHARED Pl_tact_sprite							 	AS ANY PTR 
'Other bitmaps stuff
DIM SHARED Cameraman_sprite(8) 	AS Uinteger ptr 
DIM SHARED Stadium_bitmap(2) 	AS Uinteger PTR
DIM SHARED Bench_bitmap 		as Uinteger ptr
DIM SHARED Ball_sprite(15) 		AS ANY PTR
DIM SHARED Net_sprite(2) 		AS ANY PTR
DIM SHARED Pitch_sprite(12) 	AS Uinteger PTR
DIM SHARED Back_net 			AS Uinteger PTR
DIM SHARED Banner_sprite 		AS ANY PTR
DIM SHARED Shadowed_sprite 		AS ANY PTR
DIM SHARED Shadowed_dark_sprite AS ANY PTR
DIM SHARED Slider_sprite 		AS ANY PTR
DIM SHARED Wallpaper(WALLPAPER_TOT_N) 	as any ptr
DIM SHARED Amiga_1200_bitmap 	as Uinteger ptr 'My Old Amiga 1200!
DIM SHARED Head_sprite(3) 		as Uinteger ptr
DIM SHARED Star_sprite(10) 		as Uinteger ptr 'stars of the players
DIM SHARED Dish_sprite 			as Uinteger ptr 'dish of penalty kick
DIM SHARED Splashscreen_sprite 	as Uinteger ptr 'stars of the players

DIM SHARED Workpage AS INTEGER 		'graphic buffer
DIM SHARED Addframe as Integer = 0 	'to be soon removed
'camera offset
DIM shared C_x_o 	as single = 0 
DIM shared C_y_o 	as single = 0 
dim shared Camera 	as camera_proto 'camera type

'__TYPES________________________________________________________________
dim shared Pl(PL_N_TOT*2) 			as player_proto 	'player type
dim shared Cameraman(8) 			as player_proto 	'player type
dim shared Ball 					as ball_proto 		'ball type
dim shared Ball_record(BALL_FRAMES_RECORD) as ball_proto'ball type
dim shared Team(2) 					as Team_proto 		'team
dim shared Pitch_data(6) 			as pitch_proto 'feature of the pitch
dim shared Replay_data(FRAMES_RECORD) 	as Replay_proto 'replay data


'__IN GAME USEFUL STUFF_________________________________________________
'-1: none; 0-etc. indicates the id of the pl that's receiving pass
dim shared PL_target_id 			as Integer = -1
'-1: none; 0-etc. indicates the id of the pl owning the ball
dim shared PL_ball_owner_id 		as Integer = -1
'for how much time owning the ball after the touch
dim shared PL_ball_owner_delay 		as Integer = PL_DELAY_TIME*2 
 'indicates the id of the team owning the ball
dim shared PL_team_owner_id 		as Integer = -1
dim shared PL_role(4) 				as String*1 = {"G","D","M","A"}

'__DEBUG________________________________________________________________
'this is useful for debug, to store and display shell-like messages
dim shared SHELL_message as string * 64

'__PLAYER IN-GAME INPUT_________________________________________________
'action input key - in this case the "CONTROL" key on the keyboard
Dim shared Key_pressed 					as integer = 0
dim shared Key_released 				as integer = 0
dim shared Key_pressed_time_start 		as double = 0
dim shared Key_pressed_time_stop 		as double = 0
dim shared Key_pressed_gap 				as double = 0
dim shared Key_released_time_start 		as double = 0


'__MAIN MENU ITEMS______________________________________________________
Dim Shared Main_menu_Item_selected 					As Integer = 0
Dim Shared Main_menu_Team_0_selected 				As Integer = 5
Dim Shared Main_menu_Team_1_selected	 			As Integer = 6
Dim Shared Main_menu_mins_selected 					As Integer = 0
Dim Shared Main_menu_pitch_type_selected 			As Integer = 0
Dim Shared Main_Menu_mode_selected 					As Integer = 1
Dim Shared Main_Menu_List_Teams(GAME_N_TOT_TEAMS) 	As Team_proto
Dim Shared Main_Menu_List_mins(4) 	As Integer = {3,5,7,10}
Dim Shared Main_Menu_List_pitch(4) 	As String*8 = 	{"MUDDY", "WET",_
													"SOFT","HARD",_
													"FROZEN"}
Dim Shared Main_Menu_Mode(2) 		As String*8=  {"PC v PC","PL v PC"}
Dim Shared Main_Menu_control(2) 	As String*17= {"CONTROL: Keyboard",_
												   "CONTROL: Joystick"}
Dim Shared Main_Menu_control_selected 				as integer = 0
Dim Shared Main_Menu_dimmer(MAIN_MENU_ITEMS_TOTAL) 	as single
scope
	dim c as integer
	for c = 0 to Ubound(Main_Menu_dimmer) - 1
		Main_Menu_Dimmer(c) = 0
	next c
end scope

'MATCH ENVIRONNEMENT VARIABLES__________________________________________
'indicates the actual match event
dim shared Match_event 				as proto_match_event 
Match_event = resetting_start_position 'default...
'delay between every state change
dim shared Match_event_delay 		as Integer = 0 
'stores the tile where the ball was before going off the pitch
dim shared Match_event_last_tile 	as Integer = 0
'store the old x pos of the ball
dim shared Match_event_old_ball_x 	as Single
 'store the old y pos of the ball 
dim shared Match_event_old_ball_y	as Single
Dim shared Timing as Match_timing_proto
dim shared Joystick as proto_Joystick
Joystick.id = 1

'__TACTIC EDITOR SHARED VARIABLES_______________________________________
dim shared tct_ed_TILE_W 			as integer = tct_ed_PITCH_W\6
dim shared tct_ed_TILE_H 			as integer = tct_ed_PITCH_H\6
dim shared tct_ed_ball_x 			as integer = PITCH_W + 20
dim shared tct_ed_ball_y 			as integer = PITCH_Y + 20
dim shared tct_ed_Ball_Current_Tile as integer = 0
dim shared tct_ed_Tactic_slot 		as integer = 0
dim shared tct_ed_Pl_Current_Tile 	as integer = 0
dim shared tct_ed_Pl_Selected 		as integer = 0
'[0-9]Tactic slot; '[0-9]Player slot; '[0-35]Tile slot
dim shared tct_ed_tct_tile(0 to 9, 0 to 9, 0 to 35) as Integer 'tactic array
'label of the tactic slot selected
dim shared tct_ed_tct_tile_label(10) as String*3 = 	{"442","433","352",_
													"532","424","451",_
													"541","SWP","ATT",_
													"DEF"} 
 'store the pl position for copy & paste
dim shared tct_ed_copypaste(10) 	as Integer
dim shared tct_ed_Has_copyed 		as Ubyte = 0
dim shared tct_ed_Has_saved 		as Ubyte = 0
dim shared tct_ed_Has_saved_display_time as Double
Dim shared tct_ed_mouse 			as mouse
Dim shared tct_ed_pl(10) 			as player_proto

Dim shared TE_col_sel 				as integer = 0
Dim shared TE_row_sel 				as integer = 0
Dim shared TE_select 				as integer = 1

Dim shared BE_row_sel 				as integer = 0
Dim shared BE_select 				as integer = 1
Dim shared Save_bhv 				as integer= 0

Dim shared Save_Replay 				as Boolean = false

'__CONTEXTUAL HELP______________________________________________________
Dim shared UM_txt_main_menu()			as string
Dim shared UM_txt_tactic_editor()		as string
Dim shared UM_txt_bhv_editor()			as string
Dim shared UM_txt_team_editor()			as string
Dim shared UM_txt_in_game_controls()	as string

Dim shared Display_Help as integer = 0
