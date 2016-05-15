'SUBS DECLARATIONS-----------------------------------------------------------------------


'declare sub show_message (message as string, begin_time as integer, show_time as integer)
'draw whole screen shadowed
declare sub draw_whole_screen_shadowed()
'draw the button
declare sub draw_button (	x as integer, y as integer, w as integer,_
							h as integer, label as string,_
							stroke_color as Uinteger,_
							fill_color as Uinteger,_
							is_selected as integer,_
							stroke_color_selected as integer)

'draw pitch lines
declare sub draw_pitch_lines (   x as integer,_
                        y as integer,_
                        w as integer,_
                        h as integer,_
                        xm as integer,_
                        ym as integer,_
                        paw as integer,_
                        pah as integer,_  'penalty area height
                        pac as integer,_  'penalty area circle diameter
                        padw as integer,_  'penalty dish diameter
                        padd as integer,_  'penalty dish distance from net
                        gkw as integer,_  'half goalkeeper area
                        gkh as integer,_
                        lc as integer, _
                        cxo as integer,_
                        cyo as integer)
'load into an aray the teams data for the main menu
Declare Sub Load_teams_list()
'gets user input along the main menu
Declare Sub Update_main_menu()
'draw on screen the main menu
Declare Sub Draw_main_menu()

declare Sub display_team_editor()
declare Sub update_team_editor()
Declare sub draw_team_editor()
declare sub load_team_data_for_team_editor(n_team as string)

Declare Sub delete_player_sprites()
'draw and update the main menu
DECLARE SUB display_menu()
'load fontsd
DECLARE SUB load_fonts()
'load the pitchs variables
DECLARE SUB load_pitch_data()
'load tactics
DECLARE SUB load_tact()
'load behavior of the player owner of the ball
DECLARE SUB load_behavior()
'get user input to control the direction of the player 
'DECLARE SUB get_user_input_ways(c as integer)
'load bitmaps
DECLARE SUB load_bitmap()
'load player_sprites
DECLARE SUB load_player_sprites()
'load a whole text file and put it into an array
'thanks to Bulrush @ http://www.freebasic.net/forum/viewtopic.php?f=7&t=24284
DECLARE SUB load_whole_txt_file(Byref fn As String,  filearr() As String)

'paints the kits of the teams with a custom color - and also the color of the skin of
'the players
DECLARE SUB paint_kits(	c_overlay_0 as integer, c_shirt_0 as integer,_
						c_pants_0 as integer, c_socks_0 as integer, _
						c_overlay_1 as integer, c_shirt_1 as integer,_
						c_pants_1 as integer, c_socks_1 as integer)
'print a whole array to screen
declare sub print_whole_array(array() As String, x as integer, y as integer)
'put the ball in a specified place
declare sub put_ball_in_place(position as proto_ball_position)
'delete the sprites
DECLARE SUB delete_bitmap()
'cheks if the sprites have been rightly loaded
DECLARE SUB check_bitmap()
'checks if the ball goes off the game pitch
DECLARE SUB check_throw_in_corner_kick()
'debug id the tactic file has been correctly loaded
DECLARE SUB dbg_display_tct_file_check() 
'draws the nets
DECLARE SUB draw_top_net()
DECLARE SUB draw_bottom_net()
'draws the pitch
DECLARE SUB draw_pitch()
'update the ball
DECLARE SUB update_ball()
'draw the grid
DECLARE SUB draw_grid()
'draws a custom line giving x, y, radiants, lenght and color
DECLARE SUB draw_custom_line(x as single, y as single, rds as single, a_l as single, cl as Uinteger)
DECLARE SUB draw_pl_tile(tile as integer, tile_color as uinteger)
'draws the players
DECLARE SUB draw_players()
'puts the ball into the centre of the pitch
DECLARE SUB put_ball_on_centre()
' update the beahovior of the players
DECLARE SUB update_players()
declare sub update_single_player(id as integer)
' checks if the ball gest the limits of the pitch
' or if the ball goes into any net
DECLARE SUB check_ball_border_pitch_limit()
'updates the position of the camera following the ball with easing effect
DECLARE SUB update_camera_position()
'initialize the players proprietes
DECLARE SUB init_players_proprietes()
'record data for replay
DECLARE SUB record_replay_data (save as boolean)
'sets to 0 axis z of the ball and z_Speed of the ball
DECLARE SUB reset_ball_z()
'display the match on the screen *** IMPORTANT!
DECLARE SUB display_match()
'draws the ball
DECLARE SUB draw_ball()
'giving the id of the player who owns the ball, calculate in wich tile is,
'it manages the player behavior (for example: running to the net, passing, shooting, etc...)
DECLARE SUB get_pl_behavior(pl_id as Integer)
'a player without ball and far away from the ball must run the tactic
DECLARE SUB run_tactic(c as Integer)
'draws the bottom infos
DECLARE SUB draw_bottom_info()
'aknowledgements
DECLARE SUB draw_aknowledgements()
'intro
DECLARE SUB draw_intro()
'aftertouch Human control
DECLARE SUB get_user_spin()
'generic user input
DECLARE SUB get_user_input()
'initalization of the gfx
DECLARE SUB init_gfx()
'initialize the timing for the match
DECLARE SUB init_timing()
'debug
DECLARE SUB draw_debug()
'update the current match event
DECLARE SUB update_match_event()
'all the player MUST run the tactic except the pl_id send as argument
'if you want that ALL the pl MUST run the tactic send -1 as argument
DECLARE SUB run_tactic_all_players(c as integer)
'move a single player
DECLARE SUB move_player(c as integer)
'move all players
DECLARE SUB move_players()
' giving ids 1 and 0 reset the correct gk ready position
DECLARE SUB reset_gk_net_position (c as integer, distance_from_net as Integer)
'record the a track og ball position for debug
DECLARE SUB record_ball_position()
'this sub doesn't allow the ball to go far far away when its goes outside the game field
DECLARE SUB check_ball_limits()
'restore the original value of the players
DECLARE SUB restore_players_speed()
'reset the players to the start position in their middle half of the pitch after a goal or at beginning of a game
DECLARE SUB reset_player_start_positions(c as integer)
'shoot the ball in a defined place, with a defined speed & angle
DECLARE SUB shoot_ball(pl_id as integer, pl_trg_id as integer, x_trg as single, y_trg as single, alfa as single, spin as single)
'store the old ball position
DECLARE SUB store_ball_position()
'useful for DEBUG - draws arrows
declare sub draw_arrow(x as single, y as single, rds as single, a_l as single, cl as Uinteger)
'checks the goal posts
declare sub check_ball_woods()
'update the ball into the goal
declare sub update_ball_on_goal()
'display the pre-match teams
declare sub display_teams()
declare sub display_splashscreen()
declare sub update_splashscreen()
declare sub draw_splashscreen()

'TACTIC EDITOR SUBS
declare sub tct_ed_key_input_listener() 'checks if some input key are pressed
declare sub tct_ed_pos_copy()'copy on clipboard the pl positions 
declare sub tct_ed_pos_paste() 'paste the pl positions
declare sub tct_ed_draw_players()
declare sub tct_ed_init_pl_proprietes()
declare sub tct_ed_draw_pitch_lines()
declare sub tct_ed_update_pl_on_tact_tile()
declare sub tct_ed_draw_ball_grid(pitch_x as integer, pitch_y as integer, pitch_w as integer, pitch_h as integer)
declare sub tct_ed_draw_pitch(pitch_x as integer, pitch_y as integer, pitch_w as integer, pitch_h as integer)
declare sub tct_ed_draw_pl_grid(pitch_x as integer, pitch_y as integer, pitch_w as integer, pitch_h as integer)
declare sub tct_ed_load_default_tact()
declare sub tct_ed_print_tact_data()
declare sub tct_ed_save_data(slot_to_save as integer)
declare sub init_pitch_dimensions(x as integer, y as integer,_
                        w as integer, h as integer, slot as integer)
declare sub display_tactic_editor()
declare sub update_bhv_editor()
declare sub draw_bhv_editor()
declare sub display_bhv_editor()
declare sub load_bhv_data_for_editor()
declare sub armonize_bhv_values(tile as integer)


SUB armonize_bhv_values(tile as integer)
	dim c as integer = 0
	while be_checksum(tile) <> 1
		c = Int(rnd*10)
		'if sum < 100
		if 	be_checksum(tile) = -1 and c <> BE_row_sel and _
			Bhv_tile_edit_copy(tile, c) < 100 then
			Bhv_tile_edit_copy(tile, c) +=1
		end if
		'if sum > 100
		if be_checksum(tile) = 0 and c <> BE_row_sel and _
			Bhv_tile_edit_copy(tile, c) > 0 then
			Bhv_tile_edit_copy(tile, c) -=1
		end if
	wend
end sub

sub draw_arrow(x as single, y as single, rds as single, a_l as single, cl as Uinteger)
    line (x, y)-(x + a_l * cos(rds), y + a_l *  -sin(rds)),cl
    line (x + a_l * cos(rds), y + a_l *  -sin(rds))-(x + a_l/2 * cos(rds-0.5), y + a_l/2 *  -sin(rds-0.5)),cl
    line (x + a_l * cos(rds), y + a_l *  -sin(rds))-(x + a_l/2 * cos(rds+0.5), y + a_l/2 *  -sin(rds+0.5)),cl
end sub

sub draw_custom_line(x as single, y as single, rds as single, a_l as single, cl as Uinteger)
    line (x, y)-(x + a_l * cos(rds), y + a_l *  -sin(rds)),cl
end sub

SUB check_ball_limits()
    'border pitch limit check
    dim as integer is_ball_out = 0
    
    if (ball.x > PITCH_X+PITCH_W+BALL_X_BOUND) THEN
        ball.x = PITCH_X+PITCH_W+BALL_X_BOUND -5
        ball.rds = PI - ball.rds
        ball.speed *= 0.3:ball.z_speed *= 0.5
    END IF
    if (ball.x < PITCH_X - BALL_X_BOUND) THEN
        ball.x = PITCH_X - BALL_X_BOUND + 5
        ball.rds = PI - ball.rds
        ball.speed *= 0.3:ball.z_speed *= 0.5
    END IF
    if (ball.y > PITCH_Y + PITCH_H + BALL_Y_BOUND) THEN
        ball.y = PITCH_Y + PITCH_H + BALL_Y_BOUND - 5
        ball.rds = PI_DOUBLE - ball.rds
        ball.speed *= 0.3:ball.z_speed *= 0.5
    END IF
    if (ball.y <  PITCH_Y - BALL_Y_BOUND ) THEN
        ball.y = PITCH_Y - BALL_Y_BOUND + 5
        ball.rds = PI_DOUBLE - ball.rds
        ball.speed *= 0.3
        ball.z_speed *= 0.5
    END IF
    
END SUB

SUB check_ball_goals()
    'first of all, checks if the ball goes into any net
    if is_goal(0) or is_goal(1) then
		'save replay file
		Save_Replay = true
        if is_goal(0) and CBool((Team(0).att_dir = 0)) then
            Team(1).goal += 1
            match_event = happy_t0
            Team(0).kick_off = true
        end if
        if is_goal(0) and CBool((Team(0).att_dir = 1)) then
            Team(0).goal += 1
            match_event = happy_t1
            Team(1).kick_off = true
        end if
        if is_goal(1) and CBool((Team(0).att_dir = 0)) then
            Team(0).goal += 1
            match_event = happy_t1
            Team(1).kick_off = true
        end if
        if is_goal(1) and CBool((Team(0).att_dir = 1)) then
            Team(1).goal += 1
            match_event = happy_t0
            Team(0).kick_off = true
        end if
		Timing.time_diff = Timer
        match_event_delay = MATCH_EVENT_DEFAULT_DELAY*2
        camera.speed = 0
        PL_ball_owner_id = -1
    else
        'check if the ball goes outside the pitch
        check_throw_in_corner_kick() 
    end if
END SUB

SUB update_ball_on_goal()
	'update ball phisics when it is into the net and hits the net
    dim as boolean is_hitting_net = false
    if (ball.x < PITCH_NET_L_WOOD) or (ball.x > PITCH_NET_R_WOOD) then
        is_hitting_net = true
        ball.rds = PI - ball.rds
    end if
    if  (ball.y < PITCH_NET_TOP_Y - PITCH_NET_DEPTH) or _
        (ball.y > PITCH_NET_BOTTOM_Y + PITCH_NET_DEPTH) then
        is_hitting_net = true
        ball.rds = PI - ball.rds   
    end if
    if (is_hitting_net) then
        ball.speed *= PITCH_NET_BOUNCE_RATIO
        ball.x += 1 + PITCH_NET_WOOD_RADIUS * cos(ball.rds) 
        ball.y += 1 + PITCH_NET_WOOD_RADIUS * -sin(ball.rds)
    end if
end sub

SUB check_ball_woods()
    'I wish simplify this soon...
    
    dim top_check as integer = 0
    dim xl_check as integer = 0
    dim xr_check as integer = 0
    dim y_check as integer = 0
    
    'y top & down condition
    if  ((ball.y < PITCH_NET_TOP_Y + PITCH_NET_WOOD_RADIUS) and _
        (ball.y > PITCH_NET_TOP_Y - PITCH_NET_WOOD_RADIUS)) or _
        ((ball.y > PITCH_NET_BOTTOM_Y - PITCH_NET_WOOD_RADIUS) and _
        (ball.y < PITCH_NET_BOTTOM_Y + PITCH_NET_WOOD_RADIUS)) then
        y_check = 1
    end if
    
    'hit top condition
    if  ((ball.z > PITCH_NET_H - PITCH_NET_WOOD_RADIUS) and _
        (ball.z < PITCH_NET_H + PITCH_NET_WOOD_RADIUS)) and _
        ((ball.x > PITCH_NET_L_WOOD) and (ball.x < PITCH_NET_R_WOOD)) and _
        y_check then      
        top_check = 1
    end if
    'hit left condition
    if  ((ball.x > PITCH_NET_L_WOOD - PITCH_NET_WOOD_RADIUS) and _
        (ball.x < PITCH_NET_L_WOOD + PITCH_NET_WOOD_RADIUS)) and _
        (ball.z < PITCH_NET_H) and _
        y_check then      
        xl_check = 1
    end if
    'hit right condition
    if  ((ball.x > PITCH_NET_R_WOOD - PITCH_NET_WOOD_RADIUS) and _
        (ball.x < PITCH_NET_R_WOOD + PITCH_NET_WOOD_RADIUS)) and _
        (ball.z < PITCH_NET_H) and _ 
        y_check then
        xr_check = 1
    end if
    
    if top_check or xl_check or xr_check then
        ball.rds = PI_DOUBLE - ball.rds
        ball.x += 1 + PITCH_NET_WOOD_RADIUS * cos(ball.rds) 
		ball.y += 1 + PITCH_NET_WOOD_RADIUS * -sin(ball.rds)
        ball.spin = 0
	end if
END SUB

SUB check_bitmap()
    dim as Integer img_x = 0
    dim as Integer img_y = 0
    dim as Integer count = 0 
    dim as integer skin = 0
    
    screenlock ' Lock the screen
    screenset workpage, workpage xor 1 ' Swap work pages.
    img_x = 0
    img_y = 0
    cls
    for skin = 0 to 2
		for count = 0 to PL_SPRITES_TOT_N - 1
			if (count > 0) and (count MOD 21 = 0) then
				img_x = 0
				img_y += 20
			end if
			PUT (img_x,img_y), pl_sprite_0(skin, count),trans
			PUT (img_x,img_y), pl_sprite_1(skin, count),trans
			draw string (img_x,img_y), str(count)
			img_x += 56
		next count
    next skin
    workpage xor = 1 ' Swap work pages.
    flip
    screenunlock ' Unlock the page to display what has been drawn on the screen
    sleep 2000
END SUB


SUB load_bhv_data_for_editor()
	dim as integer tile, slot
    Dim ff As Ubyte
    ff = Freefile
    'read and store into array
    Open "_data/bhv.dat" For input As #ff
		for tile = 0 to TILES_BALL_N
				Input #ff, 	Bhv_tile_edit_copy(tile,0),Bhv_tile_edit_copy(tile,1),_
							Bhv_tile_edit_copy(tile,2),Bhv_tile_edit_copy(tile,3),_
							Bhv_tile_edit_copy(tile,4),Bhv_tile_edit_copy(tile,5),_
							Bhv_tile_edit_copy(tile,6),Bhv_tile_edit_copy(tile,7),_
							Bhv_tile_edit_copy(tile,8),Bhv_tile_edit_copy(tile,9)
		next tile
    Close #ff
END SUB

SUB check_throw_in_corner_kick()
    'throw in rside check
    if Ball.x > PITCH_X + PITCH_W then
        select case PL_team_owner_id
        case 0
            match_event = throw_in_rside_t1
        case 1
            match_event = throw_in_rside_t0
        end select
        Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        PL_team_owner_id = -1
        PL_ball_owner_id = -1
    end if
    'throw in lside check
    if Ball.x < PITCH_X then
        select case PL_team_owner_id
        case 0
            match_event = throw_in_lside_t1
        case 1
            match_event = throw_in_lside_t0
        end select
        Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        PL_team_owner_id = -1
        PL_ball_owner_id = -1
    end if
    'throw in tside check
    if Ball.y < PITCH_Y - 1 then
        if Team(0).att_dir = 1 and PL_team_owner_id = 0 then
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = throw_in_tl_side_t1
            else
                Match_event = throw_in_tr_side_t1
            end if
        end if
        if Team(0).att_dir = 1 and PL_team_owner_id = 1 then
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = corner_tl_side_t0
            else
                Match_event = corner_tr_side_t0
            end if
        end if
        if Team(0).att_dir = 0 and PL_team_owner_id = 0 then
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = corner_tl_side_t1
            else
                Match_event = corner_tr_side_t1
            end if
        end if
        if Team(0).att_dir = 0 and PL_team_owner_id = 1 then
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = throw_in_tl_side_t0
            else
                Match_event = throw_in_tl_side_t0
            end if
        end if
        Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        PL_team_owner_id = -1
        PL_ball_owner_id = -1
    end if
    'throw in bside check
    if Ball.y > PITCH_Y + PITCH_H + 1 then
        if Team(0).att_dir = 1 and PL_team_owner_id = 0 then
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = corner_bl_side_t1
            else
                Match_event = corner_br_side_t1
            end if
        end if
        if Team(0).att_dir = 1 and PL_team_owner_id = 1 then
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = throw_in_bl_side_t0
            else
                Match_event = throw_in_br_side_t0
            end if
        end if
        if Team(0).att_dir = 0 and PL_team_owner_id = 0 then
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = throw_in_bl_side_t1
            else
                Match_event = throw_in_br_side_t1
            end if
        end if
        if Team(0).att_dir = 0 and PL_team_owner_id = 1 then
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = corner_bl_side_t0
            else
                Match_event = corner_bl_side_t1
            end if
        end if
        Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        PL_team_owner_id = -1
        PL_ball_owner_id = -1
    end if
END SUB

SUB delete_bitmap()
	dim c as integer
    For c = 0 To 14
        If ball_sprite(c) Then ImageDestroy ball_sprite(c)
    Next
    For c = 0 To 7
        If Cameraman_sprite(c) Then ImageDestroy Cameraman_sprite(c)
    Next
    for c = 0 to KIT_TOT_N-1
		if Kit_overlay(c) 	then imagedestroy Kit_overlay(c)
    next c
    for c = 0 to Ubound(Wallpaper) - 1
		If Wallpaper(c)		Then ImageDestroy Wallpaper(c)
    next c
    
    if Pl_tact_sprite		Then ImageDestroy Pl_tact_sprite
    If net_sprite(0)		Then ImageDestroy net_sprite(0)
    If net_sprite(1)		Then ImageDestroy net_sprite(1)
    If Stadium_bitmap(0)	Then ImageDestroy Stadium_bitmap(0)
    If Stadium_bitmap(1)	Then ImageDestroy Stadium_bitmap(1)
    If Bench_bitmap			Then ImageDestroy Bench_bitmap
    If pitch_sprite(0)		Then ImageDestroy pitch_sprite(0)
    If pitch_sprite(1)		Then ImageDestroy pitch_sprite(1)
    If banner_sprite		Then ImageDestroy banner_sprite
    if Splashscreen_sprite	Then ImageDestroy Splashscreen_sprite
    if Shadowed_dark_sprite then ImageDestroy Shadowed_dark_sprite
    if Shadowed_sprite 		then ImageDestroy Shadowed_sprite
    if Dish_sprite	 		then ImageDestroy Dish_sprite
END SUB

SUB delete_player_sprites()
	dim as integer skin, count
	for skin = 0 to 2
		For count = 0 To PL_SPRITES_TOT_N - 1
			If pl_sprite_0(skin, count) Then ImageDestroy pl_sprite_0(skin, count)
			If pl_sprite_1(skin, count) Then ImageDestroy pl_sprite_1(skin, count)
		Next
	next skin
End sub

SUB display_menu()
	DO
		update_main_menu()
		Screensync
		Screenlock ' Lock the screen
		Screenset workpage, workpage xor 1 ' Swap work pages.
		Cls
		draw_main_menu()
		workpage xor = 1 ' Swap work pages.
		
		Screenunlock
		SLEEP SLEEP_TIME, 1
	LOOP UNTIL Exit_flag = 1
	Exit_flag = 0
END SUB

SUB display_splashscreen ()
	DO
		update_splashscreen()
		Screensync
		screenlock ' Lock the screen
		screenset workpage, workpage xor 1 ' Swap work pages.
		cls
		draw_splashscreen()
		workpage xor = 1 ' Swap work pages.
		screenunlock
		SLEEP SLEEP_TIME, 1
	LOOP UNTIL Exit_flag = 1
	Exit_flag = 0
	game_section = main_menu
END SUB

sub display_bhv_editor()
	DO
		update_bhv_editor()
		Screensync
		screenlock ' Lock the screen
		screenset workpage, workpage xor 1 ' Swap work pages.
		cls
		draw_bhv_editor()
		workpage xor = 1 ' Swap work pages.
		screenunlock
		SLEEP SLEEP_TIME, 1
	LOOP UNTIL Exit_flag = 1
	Exit_flag = 0
	game_section = main_menu
end sub

SUB display_match()
	
	dim e As EVENT
	dim c as integer
	static mins as integer = 0
	static reverse_pitch as integer = 0
	static selecting_tactic as integer = 0 
	static change_formation as integer = 0
	static pl_selected as integer = 1
	static pl_sel_0 as integer = -1
	static pl_sel_1 as integer = -1
	
	DO
		If (ScreenEvent(@e)) Then
			Select Case e.type
			Case EVENT_KEY_RELEASE
				'change delta timing 
				If (e.scancode = SC_Z) Then
					Dt -= 0.001
				End If
				If (e.scancode = SC_X) Then
					Dt += 0.001
				End If
				'show / hide in-game manual
			    If (e.scancode = SC_F1) Then
					Display_Help = 1 - Display_Help 
				End If
				'save replay
				If (e.scancode = SC_S) Then
					Save_Replay = true
				End If
				'show/hide tactic selection
				If (e.scancode = SC_T) Then
					selecting_tactic = 1 - selecting_tactic
					change_formation = 0
				End If
				'change on the fly the tactic of the team 0 with +/- keys
				If 	selecting_tactic and (e.scancode = SC_PLUS) and _
					Team(0).tact_module < 9 then
					Team(0).tact_module +=1
				end if
				If 	selecting_tactic and (e.scancode = SC_MINUS) and _
					Team(0).tact_module > 0 then
					Team(0).tact_module -=1
				end if
				'allow to select a the player
				If 	change_formation and (e.scancode = SC_ENTER) and _
					pl_sel_0 <> -1 then
					pl_sel_1 = pl_selected
					swap pl(pl_sel_0).tct_id, pl(pl_sel_1).tct_id
					swap pl(pl_sel_0), pl(pl_sel_1)
					pl_sel_0 = -1
					pl_sel_1 = -1
					exit select
				end if
				If 	change_formation and (e.scancode = SC_PLUS) and _
					pl_selected < 10 then
					pl_selected +=1
				end if
				If 	change_formation and (e.scancode = SC_MINUS) and _
					pl_selected > 1 then
					pl_selected -=1
				end if
				If 	change_formation and (e.scancode = SC_ENTER) and _
					pl_sel_0 = -1 then
					pl_sel_0 = pl_selected
				end if
				'show/hide formation
				If (e.scancode = SC_F) Then
					change_formation = 1 - change_formation
					selecting_tactic = 0
				End If
				
				If (e.scancode = SC_ESCAPE) Then
					Exit_flag = 1
					Display_Help = 0
				End If
				'activate vaious level of debug messages
				If (e.scancode = SC_D) Then
					Debug = Debug + 1
					if Debug > 10 then Debug = 0
				End If
				'reverse attack direction of the teams
				If DEBUG and (e.scancode = SC_R) Then
					swap Team(0).att_dir,Team(1).att_dir
				End if
			End Select
		End If

		
		Timing.time_current = Timer
		
		update_match_event()
		check_ball_woods()
		check_ball_limits()
		update_ball()
		get_user_input()
		update_camera_position()
	
		screensync
	
		'screensync 'wait for vsync
		'graphic output
		screenlock ' Lock the screen
		screenset workpage, workpage xor 1 ' Swap work pages.
		draw_pitch()
		draw_pitch_lines ( Pitch_data(Main_menu_pitch_type_selected).x,_
						Pitch_data(Main_menu_pitch_type_selected).y,_
						Pitch_data(Main_menu_pitch_type_selected).w,_
						Pitch_data(Main_menu_pitch_type_selected).h,_
						Pitch_data(Main_menu_pitch_type_selected).xm,_
						Pitch_data(Main_menu_pitch_type_selected).ym,_
						Pitch_data(Main_menu_pitch_type_selected).paw,_
						Pitch_data(Main_menu_pitch_type_selected).pah,_
						Pitch_data(Main_menu_pitch_type_selected).pac,_
						Pitch_data(Main_menu_pitch_type_selected).padw,_
						Pitch_data(Main_menu_pitch_type_selected).padd,_
						Pitch_data(Main_menu_pitch_type_selected).gkw,_
						Pitch_data(Main_menu_pitch_type_selected).gkh,_
						C_WHITE, c_x_o, c_y_o)
		if (Debug) then draw_debug()
		'draw the top stadium: 305 is the witch in pixel of the stadium tile
		for c = 0 to int(PITCH_W / 305) + 1
			PUT (PITCH_X - 150 - c_x_o + c * 305, PITCH_Y - 220 - c_y_o), Stadium_bitmap(0), trans
		next c
		'... the upper back net
		PUT (PITCH_MIDDLE_W - 146 - c_x_o, PITCH_Y - 140 - c_y_o ), back_net, trans
		draw_top_net()
		draw_players()
		draw_ball()
		record_replay_data(save_replay)
		draw_bottom_net()
		'...the lower back net
		PUT (PITCH_MIDDLE_W - 146 - c_x_o, PITCH_Y + PITCH_H + 10 - c_y_o ), back_net, trans
		'draw the bottom stadium: 305 is the witch in pixel of the stadium tile
		for c = 0 to int(PITCH_W / 305) + 1
			PUT (PITCH_X - 150 - c_x_o + c * 305, PITCH_Y + PITCH_H + 30 - c_y_o), Stadium_bitmap(1), pset
		next c
		
		draw_bottom_info()
		'display the selecting tactic menu
		if (selecting_tactic) then
			draw_button (50, 72, 180,_
						20, "TACTIC of " + Team(0).label,_
						C_WHITE, C_DARK_RED, 0, C_GRAY)
			
			for c = 0 to Ubound (tct_tile_label)-1
				draw_button (50, 100 + c * 22, 32 + 12 * is_equal(Team(0).tact_module, c),_
						20, tct_tile_label(c),_
						C_WHITE,_
						C_BLUE,_
						is_equal(Team(0).tact_module, c),_
						C_GRAY)
			next c
		end if
		'display change formation menu
		if (change_formation) then
			draw_button (50, 72, 200,_
						20, "Formation of " + Team(0).label,_
						C_WHITE, C_DARK_RED, 0, C_GRAY)
			for c = 1 to 10
				draw_button (50, 100 + c * 22, 35, 20, str(pl(c).number),_
						C_WHITE, C_BLUE, is_equal(pl_selected, c), C_GRAY)
				draw_button (90, 100 + c * 22, 180, 20, pl(c).label,_
						C_WHITE, C_BLUE, is_equal(pl_selected, c), C_GRAY)
				if pl_sel_0 = c then
					draw_button (90, 100 + c * 22, 180, 20, pl(c).label,_
						C_BLACK, C_DARK_RED, 0, C_GRAY)
				end if
			next c
		end if
		' display context-help
		if (Display_Help) then
			draw_whole_screen_shadowed()
			print_whole_array(UM_txt_in_game_controls(), 20, 20)
		end if
		
		workpage xor = 1 ' Swap work pages.
		screenunlock ' Unlock the page to display what has been drawn on the screen
		
		if CBool (Timer - Timing.time_start > 1) and Timing.play then
			Timing.actual_fps = Timing.fps
			Timing.fps = 0
			Timing.time_start = Timer
			Timing.seconds_elapsed +=1
		else
			Timing.fps +=1
		end if
		
		mins = 90/Timing.secs_to_play*Timing.seconds_elapsed
		
		'half time reverse attack direction of the team
		if (reverse_pitch = 0 and mins > 45) then
			reverse_pitch = 1 - reverse_pitch
			swap Team(0).att_dir, Team(1).att_dir
			Timing.time_diff = Timer
			match_event = interval
		end if
		
		if (90/Timing.secs_to_play*Timing.seconds_elapsed)>90 then Exit_flag = 1
		Timing.time_last = Timing.time_current
	
	LOOP UNTIL Exit_flag = 1
	delete_player_sprites()
	game_section = main_menu
END SUB

SUB display_teams()
	dim as integer c, x, y
	dim as integer h_padding = 24
	dim as integer v_padding = 24
	dim e As EVENT
	DO
		If (ScreenEvent(@e)) Then
			Select Case e.type
			Case EVENT_KEY_RELEASE
				If (e.scancode = SC_Escape) Then
					Exit do
				End If
			End Select
		End If
	
		screenlock ' Lock the screen
		screenset workpage, workpage xor 1 ' Swap work pages.
		cls
		PUT (0, 0), Wallpaper(0),pset
		y = 100
		x = 100
		
		PrintFont 100, 25, team(0).label, CoolFont, 1, 1
		PrintFont SCREEN_W -  len(pl(0).label) * 7, 25, team(1).label, CoolFont, 1, 1
		
		for c = 0 to Ubound(Pl)-1
			PrintFont x - h_padding, y + 3, str(pl(c).number), SmallFont, 1, 1
			PrintFont x, y, pl(c).label, CoolFont, 1, 1
		
			if (c < 11) then
				put (x - h_padding * 2, y - 8), pl_sprite_0(pl(c).skin, 102), trans
			else
				put (x - h_padding * 2, y - 8), pl_sprite_1(pl(c).skin, 102), trans
			end if
			y += v_padding
			if (c = 10) then
				y = 100
				x = SCREEN_W -  len(pl(0).label) * 7
			end if
		next c
		if (int(Timer) mod 2) then
			draw string (SCREEN_W - 128, SCREEN_H - 20), _
						"press ESC"
		end if
		workpage xor = 1 ' Swap work pages.
		screenunlock
		sleep 50,1
	LOOP
END SUB

Sub display_team_editor()
	DO	
		update_team_editor()
		Screensync
		Screenlock ' Lock the screen
		Screenset workpage, workpage xor 1 ' Swap work pages.
		Cls
		draw_team_editor()
		workpage xor = 1 ' Swap work pages.
		Screenunlock
		SLEEP SLEEP_TIME, 1
	LOOP UNTIL Exit_flag = 1
	game_section = main_menu
	Exit_flag = 0
end sub

SUB display_tactic_editor()

	dim e As EVENT

	DO
		If (ScreenEvent(@e)) Then
			Select Case e.type
			Case EVENT_KEY_RELEASE
				If (e.scancode = SC_Escape) Then
					Exit_flag = 1
					Display_Help = 0
				End If
				'save selected tactic
				If (e.scancode = SC_S) Then
					tct_ed_Save_data(tct_ed_tactic_slot)
					tct_ed_Has_Saved = 1
					tct_ed_Has_saved_display_time = Timer
				End If
				'save all tactic slots
				If (e.scancode = SC_A) Then
					tct_ed_Save_data(-1)
					tct_ed_Has_Saved = 1
					tct_ed_Has_saved_display_time = Timer
				End If
				If (e.scancode = SC_F1) Then
					Display_Help = 1 - Display_Help 
				End If
				
				
			End Select
		End If
	
		tct_ed_key_input_listener()
		
		screenlock ' Lock the screen
		screenset workpage, workpage xor 1 ' Swap work pages.
		cls
		PUT (0, 0), Wallpaper(6),pset
		tct_ed_draw_pitch(pitch_data(0).x, pitch_data(0).y,pitch_data(0).w, pitch_data(0).h)
		
		draw_pitch_lines ( Pitch_data(0).x,_
                            Pitch_data(0).y,_
                            Pitch_data(0).w,_
                            Pitch_data(0).h,_
                            Pitch_data(0).xm,_
                            Pitch_data(0).ym,_
                            Pitch_data(0).paw,_
                            Pitch_data(0).pah,_
                            Pitch_data(0).pac,_
                            Pitch_data(0).padw,_
                            Pitch_data(0).padd,_
                            Pitch_data(0).gkw,_
                            Pitch_data(0).gkh,_
                            C_WHITE, 0, 0)
		
		'draw_pitch_lines(pitch_data(0).x, pitch_data(0).y,pitch_data(0).w, pitch_data(0).h)
		tct_ed_draw_pl_grid(pitch_data(0).x, pitch_data(0).y,pitch_data(0).w, pitch_data(0).h)
		tct_ed_draw_ball_grid(pitch_data(0).x, pitch_data(0).y,pitch_data(0).w, pitch_data(0).h)
		tct_ed_update_pl_on_tact_tile()
		tct_ed_draw_players()
		
		line (tct_ed_mouse.x-5, tct_ed_mouse.y)-(tct_ed_mouse.x+5, tct_ed_mouse.y)
		line (tct_ed_mouse.x, tct_ed_mouse.y-5)-(tct_ed_mouse.x, tct_ed_mouse.y+5)
		
		tct_ed_print_tact_data()

		workpage xor = 1 ' Swap work pages.
		screenunlock
		sleep 50,1
	LOOP UNTIL Exit_flag = 1
	game_section = main_menu
end sub

SUB draw_aknowledgements()
	#define AKN_MAX_LINES 100
	dim txt(AKN_MAX_LINES) as string
	dim c as integer = 0
	Dim ff As Ubyte
    ff = Freefile
	Dim txt_y as integer = SCREEN_H
	
    Open "_data/aknow.txt" For input As #ff
		for c = 0 to AKN_MAX_LINES
			if (EOF(ff)) then exit for
			Line Input #ff, txt(c)
		next c
	Close #ff
    DO
		Screensync
		Screenlock ' Lock the screen
		Screenset workpage, workpage xor 1 ' Swap work pages.
		Cls
		workpage xor = 1 ' Swap work pages.
		PUT (0, 0), Wallpaper(2),pset
		PUT (SCREEN_W\2 - 128, txt_y - 150), Amiga_1200_bitmap, trans
		
			if (int(Timer) mod 2) then
				draw string (SCREEN_W - 128, SCREEN_H - 20), _
							"press J to exit"
			end if
			for c = 0 to Ubound(txt)
					if (left(txt(c),1)="*") then
					draw string (SCREEN_W\2 - len(txt(c))*4 + 2, _
							txt_y + c *10 + 2), txt(c), C_BLACK
					draw string (SCREEN_W\2 - len(txt(c))*4, _
							txt_y + c *10), txt(c), C_YELLOW
					continue for
				end if
				draw string (SCREEN_W\2 - len(txt(c))*4, _
							txt_y + c *10), txt(c)			
			next c
		txt_y -= 1
		
		Screenunlock
		SLEEP SLEEP_TIME, 1
		'if the credits have been entirely shown, exit from the loop
		if txt_y < -AKN_MAX_LINES*10 then exit do
		if multikey(SC_J) then
			Game_section = exit_game
			exit do
		end if
	LOOP
END SUB

SUB draw_ball()
    dim as integer offset_frame
    
    if (ball.z > 25) then
        if ball.z < 60 then
            offset_frame = 5
        else
            offset_frame = 10
        end if
    else
        offset_frame = 0
    end if
    
    if d_b_t_p(ball.x, ball.y, ball.old_x, ball.old_y) > 1 then
        ball.frame += 1
    end if
    
    if ball.frame MOD 5 = 0  then ball.frame = 0
    
    circle (ball.x-c_x_o, ball.y-c_y_o+2),ball.w, RGB (0,50,0),,,,F
    PUT (ball.x-c_x_o-8, ball.y- 8 - ball.z- c_y_o), ball_sprite(ball.frame + offset_frame), trans
    
END SUB

sub draw_bhv_editor()
	dim as integer x, y, w, c, padding, h
	padding = 5
	w = 32
	x = 360
	y = 50
	h = 16
	PUT (0, 0), Wallpaper(7),pset
	'uses some routines of tactic editor - the soccer field is the same
	tct_ed_draw_pitch(pitch_data(0).x, pitch_data(0).y,pitch_data(0).w, pitch_data(0).h)
	
	draw_pitch_lines ( Pitch_data(0).x, 	Pitch_data(0).y,	Pitch_data(0).w,_
						Pitch_data(0).h,	Pitch_data(0).xm,	Pitch_data(0).ym,_
						Pitch_data(0).paw,	Pitch_data(0).pah,	Pitch_data(0).pac,_
						Pitch_data(0).padw,	Pitch_data(0).padd,	Pitch_data(0).gkw,_
						Pitch_data(0).gkh,	C_WHITE, 0, 0)
	
	tct_ed_draw_ball_grid(pitch_data(0).x, pitch_data(0).y,pitch_data(0).w, pitch_data(0).h)
	
	draw_button 	(0, 0, SCREEN_W, 30, _
					"BEHAVIOR EDITOR", C_WHITE, C_DARK_BLUE,0,0)

	draw_button 	(0, SCREEN_H - 30, SCREEN_W, 30, _
					"PRESS CTRL + S to SAVE & CLOSE Editor",_
					C_WHITE, C_DARK_RED,0,0)
	
	for c = 0 to 9
		draw_button (	x, y, w, h, str(Bhv_tile_edit_copy(tct_ed_Ball_Current_Tile, c)),_
						C_GRAY, C_RED, is_equal(BE_row_sel, c) * BE_select, C_YELLOW)
		draw_button (	x + w + padding, y, 150, h, Bhv_actions_labels(c),_
						C_GRAY, C_DARK_RED, is_equal(BE_row_sel, c) * BE_select, C_YELLOW)
		line 	(x + w + padding + 150 + padding, y)- _
				(x + w + padding + 150 + padding + Bhv_tile_edit_copy(tct_ed_Ball_Current_Tile, c), y + h),C_DARK_GREEN, BF
		y = y + h + padding
	next c
	
	draw string (SCREEN_W - 100, SCREEN_H -20), "be_checksum" + str(be_checksum(tct_ed_Ball_Current_Tile))
	
	'context-help
    if (Display_Help) then
		draw_whole_screen_shadowed()
		print_whole_array(UM_txt_bhv_editor(), 20, 20)
	end if
	
end sub

SUB draw_bottom_info()
    dim d as Integer
    'show mins on the upper right corner of the monitor
    PrintFont SCREEN_W - 100, 20, "Mins " + str(int(90/Timing.secs_to_play*Timing.seconds_elapsed)), CoolFont, 1, 1
	'shows the name of the player owner of the ball
    if (pl_ball_owner_id <> -1) then
		PrintFont 10, 20, str(pl(pl_ball_owner_id).label), CoolFont, 1, 1
    end if
	'show scoring info when there is a pause in the game
    if Match_event_delay then
        for d = 0 to int (SCREEN_W / 32) +1 
            PUT (32*d, SCREEN_H\2 - 6), shadowed_sprite, trans
        next
        PrintFont 32, SCREEN_H \ 2, str(Team(0).label) + " " + str(Team(0).goal) + _
        " : " + str(Team(1).goal) + " " + str(Team(1).label), ButtonFont, 1, 1
        PrintFont 32, SCREEN_H \ 2 + 36, "Match_Event " + print_match_event(Match_event), SmallFont, 1, 1
    end if
    'bottom shadow
    for d = 0 to int (SCREEN_W / 32) +1 
        PUT (32*d, SCREEN_H-32), shadowed_sprite, trans
    next
    
    PrintFont SCREEN_W - 50, SCREEN_H - 20, str(Timing.actual_fps) + " Fps", SmallFont, 1, 1
    PrintFont 50, SCREEN_H - 20, SHELL_message, SmallFont, 1, 1
END SUB

SUB draw_bottom_net()
    
    PUT (PITCH_MIDDLE_W - 53 - c_x_o, PITCH_Y + PITCH_H - 28 - c_y_o ), net_sprite(1), trans
    
end sub

SUB draw_debug()
    dim as integer c
    static frame as integer
    'if clausole IMPORTANT!
    
    PrintFont 30, SCREEN_H - 60, "DEBUG LEVEL: " + str(Debug), Unifont, 1, 1
        
    if debug > 1 then draw_grid()
    if debug > 2 then
        'draw woods hit area
        circle (PITCH_NET_L_WOOD -c_x_o, PITCH_NET_TOP_Y - c_y_o), PITCH_NET_WOOD_RADIUS, C_DARK_RED,,,,F
        circle (PITCH_NET_R_WOOD -c_x_o, PITCH_NET_TOP_Y - c_y_o), PITCH_NET_WOOD_RADIUS, C_DARK_RED,,,,F
        circle (PITCH_NET_L_WOOD -c_x_o, PITCH_NET_BOTTOM_Y- c_y_o), PITCH_NET_WOOD_RADIUS, C_DARK_RED,,,,F
        circle (PITCH_NET_R_WOOD -c_x_o , PITCH_NET_BOTTOM_Y- c_y_o), PITCH_NET_WOOD_RADIUS, C_DARK_RED,,,,F
        line (PITCH_NET_L_WOOD - PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_TOP_Y - c_y_o)- _
            (PITCH_NET_L_WOOD + PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_TOP_Y - PITCH_NET_H - c_y_o),C_DARK_RED, BF
        line (PITCH_NET_R_WOOD - PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_TOP_Y - c_y_o)- _
            (PITCH_NET_R_WOOD + PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_TOP_Y - PITCH_NET_H - c_y_o),C_DARK_RED, BF
        line (PITCH_NET_L_WOOD - PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_BOTTOM_Y - c_y_o)- _
            (PITCH_NET_L_WOOD + PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_BOTTOM_Y - PITCH_NET_H - c_y_o),C_DARK_RED, BF
        line (PITCH_NET_R_WOOD - PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_BOTTOM_Y - c_y_o)- _
            (PITCH_NET_R_WOOD + PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_BOTTOM_Y - PITCH_NET_H - c_y_o),C_DARK_RED, BF
        line (PITCH_NET_L_WOOD - PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_BOTTOM_Y - PITCH_NET_H - PITCH_NET_WOOD_RADIUS- c_y_o)- _
            (PITCH_NET_R_WOOD + PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_BOTTOM_Y - PITCH_NET_H + PITCH_NET_WOOD_RADIUS - c_y_o),C_DARK_RED, BF
        line (PITCH_NET_L_WOOD - PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_TOP_Y - PITCH_NET_H - PITCH_NET_WOOD_RADIUS- c_y_o)- _
            (PITCH_NET_R_WOOD + PITCH_NET_WOOD_RADIUS - c_x_o, PITCH_NET_TOP_Y - PITCH_NET_H + PITCH_NET_WOOD_RADIUS - c_y_o),C_DARK_RED, BF
    end if
	if debug > 3 then
		
	
        if get_pl_to_pass(Pl_ball_owner_id) then
            line (pl(get_nrst_pl_ball(0)).x-c_x_o, pl(get_nrst_pl_ball(0)).y-c_y_o)-_
            (pl(get_pl_to_pass(Pl_ball_owner_id)).x-c_x_o,pl(get_pl_to_pass(Pl_ball_owner_id)).y-c_y_o), RGB(255,255,0)
        end if
        
        circle (Match_event_old_ball_x - C_x_o, Match_event_old_ball_y - C_y_o), 20, C_WHITE

        for c = 0 to Ubound(pl)-1
            if pl(c).team = PL_team_owner_id then
                circle (pl(c).x - C_x_o, pl(c).y - c_y_o),12, C_ORANGE,,,,F
            end if
            if pl(c).id = PL_ball_owner_id then
                circle (pl(c).x - C_x_o, pl(c).y - c_y_o),10, C_DARK_RED,,,,F
            end if
            if pl(c).id = PL_target_id then
                circle (pl(c).x - C_x_o, pl(c).y - c_y_o),8, C_GREEN,,,,F
            end if
            if pl(c).delay > 0 and pl(c).delay MOD 3 = 0 then
                circle (pl(c).x - C_x_o, pl(c).y - c_y_o),6, C_WHITE,,,,F
            end if
            draw_arrow(pl(c).x - c_x_o, pl(c).y - c_y_o, pl(c).rds, 25, C_GRAY)
        next c
        
        circle (Match_event_old_ball_x - C_x_o, Match_event_old_ball_y - c_y_o),6, RGB (255,255,0),,,,F
          
        if pl_ball_owner_id <> -1 then
            draw_arrow  (pl(pl_ball_owner_id).x - c_x_o, pl(pl_ball_owner_id).y - c_y_o, _
                        find_shoot_angle(pl_ball_owner_id), 50, C_WHITE)
        end if
        'BALL RDS
        draw_arrow  (ball.x - c_x_o, ball.y - c_y_o, _
                        ball.rds, 40, C_WHITE)
    end if
    if debug > 4 then
        for c = 0 to Ubound(pl)-1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+12, "ID: " + str(pl(c).id), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+24, "ACT: " + str(print_pl_action(pl(c).action)), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+30, "DLY: " + str(pl(c).delay), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+36, "TID: " + str(pl(c).tct_id), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+42, "SPD: " + str(pl(c).speed), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+48, "LBL: " + str(pl(c).label), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+54, "PTL: " + str(get_pl_tile(pl(c).id)), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+60, "RDS: " + str(pl(c).rds), SmallFont, 1, 1
            if PL_ball_owner_id > -1 then
                if pl(c).team then
                    draw_pl_tile(get_pl_tile(pl(c).id), C_GREEN)
                else
                    draw_pl_tile(get_pl_tile(pl(c).id), C_GRAY)
                end if
            end if        
        next c
        draw_arrow (20,206, (PI * Team(0).att_dir - PI_2), 10, Team(0).c_1)
    end if
    if debug > 5 then
		if PL_ball_owner_id > -1 then
			'Draw String 
			PrintFont 20, 20, pl(PL_ball_owner_id).label, CoolFont, 1, 1
			PrintFont 20, 38, SHELL_Message, SmallFont, 1, 1
			'draws the fieldview of the selected player
			draw_custom_line(pl(PL_ball_owner_id).x - c_x_o, pl(PL_ball_owner_id).y - c_y_o,_
							pl(PL_ball_owner_id).rds - PL_FIELD_VIEW_HALF, 200, C_BLUE)
			draw_custom_line(pl(PL_ball_owner_id).x - c_x_o, pl(PL_ball_owner_id).y - c_y_o,_
							pl(PL_ball_owner_id).rds + PL_FIELD_VIEW_HALF, 200, C_BLUE)
		end if
	end if
	if debug > 6 then
	    'DISPLAY BALL TRAJECTORIES
	    frame +=1
        for frame = 0 to BALL_FRAMES_RECORD - 1
        pset (Ball_record(frame).x -c_x_o, Ball_record(frame).y - c_y_o)
        next frame
        if frame > BALL_FRAMES_RECORD - 1 then frame = 0
	end if
	if debug > 7 then
	        'input key debug -------------------------------------
        if MULTIKEY(SC_UP) then
            line (40, 400)-(60,380), C_WHITE, BF
        end if
        if MULTIKEY(SC_DOWN) then
            line (40, 400)-(60,420), C_WHITE, BF
        end if
        if MULTIKEY(SC_LEFT) then
            line (20, 400)-(40,420), C_WHITE, BF
        end if
        if MULTIKEY(SC_RIGHT) then
            line (60, 400)-(80,420), C_WHITE, BF
        end if
        if MULTIKEY(SC_CONTROL) then
            line (100, 400)-(140,420), C_WHITE, BF
        end if
        
        line (40, 400)-(60,380), C_BLACK, B
        line (20, 400)-(40,420), C_BLACK, B
        line (40, 400)-(60,420), C_BLACK, B
        line (60, 400)-(80,420), C_BLACK, B
        line (100, 400)-(140,420), C_BLACK, B
	end if

        PrintFont 30, 200, "Team(0).att_dir: " + str(Team(0).att_dir), SmallFont, 1, 1
        PrintFont 30, 206, Team(0).label, SmallFont, 1, 1
        draw_arrow (20,246, (PI * Team(0).att_dir - PI_2), 10, Team(0).c_1)
        
        
        
        PrintFont DBG_TXT_OFFSET, 50, "PL_Team_owner_id: " + str(PL_team_owner_id), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 56, "Ball Spin: " + str(Ball.spin), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 74, "Match_event_delay: " + str(Match_event_delay), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 80, "Match Event: " + str(print_match_event(Match_Event)), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 86, "Match_event_last_tile: " + str(Match_event_last_tile), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 92, "Dt: " + str(Dt), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 98, "PL_ball_owner_delay: " + str(PL_ball_owner_delay), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 104, "PL_target_id: " + str(PL_target_id), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 110, "PL_ball_owner_id: " + str(PL_ball_owner_id), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 116, "PL_team_owner_id: " + str(PL_team_owner_id), SmallFont, 1, 1
end SUB

SUB draw_grid()
    dim as integer x, y, x2,y2, col, row, count
    count = 0
    dim col_width as integer = PITCH_W \ COL_TOT_N
    dim row_height as integer = PITCH_H \ ROW_TOT_N 
    for row = 0 to ROW_TOT_N -1 step 1
        for col = 0 to COL_TOT_N -1 step 1
            'draw the grid
            x = 	col * col_width + PITCH_X 
            y = 	row * row_height + PITCH_Y
            x2 = 	x + col_width
            y2 = 	y + row_height
            line (x-c_x_o,y-c_y_o)-(x2-c_x_o,y2-c_y_o),C_GRAY,b 
            draw string 	(x+ 30-c_x_o,y+5-c_y_o), str(count) + " : " _
							+ str(TILES_BALL_N - count), C_GRAY
            count +=1
        next col
    next row
    
    'highlights the Match_event_last_tile
    x = (Match_event_last_tile MOD COL_TOT_N) * col_width + PITCH_X
	y = int(Match_event_last_tile / ROW_TOT_N) * row_height + PITCH_Y
	x2 = x + col_width
    y2 = y + row_height
    line (x-c_x_o,y-c_y_o)-(x2-c_x_o,y2-c_y_o),C_YELLOW,B 
    line (x-c_x_o - 2,y-c_y_o - 2)-(x2-c_x_o + 2,y2-c_y_o + 2),C_YELLOW,B 
	
    if is_ball_into_penalty_area (0) then
        circle (ball.x - c_x_o, ball.y - c_y_o), 16, C_RED,,,,F
    end if
    if is_ball_into_penalty_area (1) then
        circle (ball.x - c_x_o, ball.y - c_y_o), 16, C_BLUE,,,,F
    end if
END SUB

sub draw_pl_tile(tile as integer, tile_color as Uinteger)
    dim as integer tile_row, tile_col, x1, x2, y1, y2
    tile_row = tile MOD 16
	tile_col = int(tile\16)
    'draw the box
    x1 = TILE_PL_W * tile_row + PITCH_X
    x2 = TILE_PL_W * tile_row + PITCH_X + TILE_PL_W
    y1 = TILE_PL_H * tile_col + PITCH_Y
    y2 = TILE_PL_H * tile_col + PITCH_Y + TILE_PL_H
    line (x1 - c_x_o, y1 - c_y_o)-(x2 - c_x_o, y2 - c_y_o),tile_color,BF
   ' draw string (x1 -c_x_o,y1 - c_y_o), str(tile) + ":" + str(TILES_PL_N - tile)
    PrintFont x1-c_x_o, y1-c_y_o, str(tile) + ":" + str(TILES_PL_N - tile), SmallFont, 1, 1
end sub

SUB draw_intro()
    
END SUB

sub draw_button (x as integer, y as integer, w as integer,_
							h as integer, label as string,_
							stroke_color as Uinteger,_
							fill_color as Uinteger,_
							is_selected as integer,_
							stroke_color_selected as integer)
	dim offset_line as integer = 2
	dim offset_shadow as integer = 1
	
	Line (x,y)-(x+w,y+h),fill_color,BF
	Line (x,y)-(x+w,y+h),stroke_color,B
	Line (x+w,y)-(x+w,y+h),stroke_color xor C_GRAY,B
	Line (x,y+h)-(x+w,y+h),stroke_color xor C_GRAY,B
	
	if (is_selected) then
		Line (x,y)-(x+w,y+h),fill_color or C_GRAY,BF	
		Line 	(x - offset_line,y - offset_line)-_
				(x+w + offset_line,_
				y+h + offset_line),stroke_color_selected,B
		Line 	(x - offset_line,y - offset_line -1)-_
				(x+w + offset_line,_
				y+h + offset_line + 1),stroke_color_selected,B
		
	end if
	
	PrintFont x + (w \ 2) - len(label)*7, y + 5, label, ButtonFont, 1, 1 
	
end sub


Sub draw_main_menu()
    Dim As Integer a, i
    dim btn_w as integer = 350 'width of the button
    dim btn_h as integer = 26 'height of the button
    dim btn_v_space as integer = 14 'vertical spacing of each button
    Dim top_margin as integer = 116

    'graphic statements
    'wallpaper
    PUT (0, 0), Wallpaper(1),pset
    
    draw_button 	(0, 0, SCREEN_W, 30, _
					str(GAME_NAME + " " + GAME_VERSION + " by " + GAME_AUTHOR),_
					C_WHITE, C_DARK_BLUE,0,0)
	'blinking "press F1"
	if (Timer MOD 2) then
    draw_button 	(SCREEN_W\2 - (len("Press F1 for HELP")\2) * 16, SCREEN_H - 30, (len("Press F1 for HELP")) * 16, 20, _
					str("Press F1 for HELP"), C_WHITE, C_DARK_RED,0,0)
	end if
	
	For a = 0 To MAIN_MENU_ITEMS_TOTAL
        Select Case a
        Case 0
			for i = lbound(Main_Menu_List_Teams) to ubound (Main_Menu_List_Teams) - 1
				draw_button (	SCREEN_W\2 - btn_w\2 - btn_w*(Main_menu_Team_0_selected - i) +  btn_w * Main_Menu_dimmer(a),_
						top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
						Main_Menu_List_Teams(i).label,_
						C_GRAY, C_GRAY,0,0)
						
			next i
			draw_button (SCREEN_W\2 - btn_w\2,_
			top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
			Main_Menu_List_Teams(Main_menu_Team_0_selected).label,_
			C_WHITE, C_BLUE,is_equal(a,Main_menu_Item_selected),C_WHITE)
        Case 1
			for i = lbound(Main_Menu_List_Teams) to ubound (Main_Menu_List_Teams) - 1
				draw_button (	SCREEN_W\2 - btn_w\2 - btn_w*(Main_menu_Team_1_selected - i) +  btn_w * Main_Menu_dimmer(a),_
						top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
						Main_Menu_List_Teams(i).label,_
						C_GRAY, C_GRAY,0,0)
			next i
   			draw_button (SCREEN_W\2 - btn_w\2,_
			top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
			Main_Menu_List_Teams(Main_menu_Team_1_selected).label,_
			C_WHITE, C_BLUE,is_equal(a,Main_menu_Item_selected),C_WHITE)
        Case 2
			for i = lbound(Pitch_data) to ubound (Pitch_data) - 1
				draw_button (	SCREEN_W\2 - btn_w\2 - btn_w*(Main_menu_pitch_type_selected - i) +  btn_w * Main_Menu_dimmer(a),_
						top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
						Pitch_data(i).label,_
						C_GRAY, C_GRAY,0,0)
			next i
			draw_button (SCREEN_W\2 - btn_w\2,_
			top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
			Pitch_data(Main_menu_pitch_type_selected).label,_
			C_WHITE, C_BLUE,is_equal(a,Main_menu_Item_selected),C_WHITE)
        Case 3
			for i = lbound(Main_Menu_List_mins) to ubound (Main_Menu_List_mins) - 1
				draw_button (	SCREEN_W\2 - btn_w\2 - btn_w*(Main_menu_mins_selected - i) +  btn_w * Main_Menu_dimmer(a),_
						top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
						Str(Main_Menu_List_mins(i)),_
						C_GRAY, C_GRAY,0,0)
			next i
   			draw_button (SCREEN_W\2 - btn_w\2,_
			top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
			Str(Main_Menu_List_mins(Main_menu_mins_selected)) + " mins.",_
			C_WHITE, C_BLUE,is_equal(a,Main_menu_Item_selected),C_WHITE)
        Case 4
			for i = lbound(Main_Menu_Mode) to ubound (Main_Menu_Mode) - 1
				draw_button (SCREEN_W\2 - btn_w\2 - btn_w*(Main_Menu_mode_selected - i) +  btn_w * Main_Menu_dimmer(a),_
						top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
						Str(Main_Menu_Mode(i)),_
						C_GRAY, C_GRAY,0,0)
			next i
   			draw_button (SCREEN_W\2 - btn_w\2,_
			top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
			Str(Main_Menu_Mode(Main_Menu_mode_selected)),_
			C_WHITE, C_BLUE,is_equal(a,Main_menu_Item_selected),C_WHITE)
        Case 5
			for i = lbound(Main_Menu_control) to ubound (Main_Menu_control) - 1
				draw_button (SCREEN_W\2 - btn_w\2 - btn_w*(Main_Menu_control_selected - i) +  btn_w * Main_Menu_dimmer(a),_
						top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
						Str(Main_Menu_control(i)),_
						C_GRAY, C_GRAY,0,0)
			next i
   			draw_button (SCREEN_W\2 - btn_w\2,_
			top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
			Str(Main_Menu_control(Main_Menu_control_selected)),_
			C_WHITE, C_BLUE,is_equal(a,Main_menu_Item_selected),C_WHITE)
        Case 6
            If Main_Menu_mode_selected Then
				draw_button (SCREEN_W\2 - btn_w,_
				top_margin + ((btn_h + btn_v_space) * a), btn_w*2, btn_h, _
				"PLAY",_
				C_WHITE, C_DARK_GREEN,is_equal(a,Main_menu_Item_selected),C_WHITE)
            Else
            	draw_button (SCREEN_W\2 - btn_w,_
				top_margin + ((btn_h + btn_v_space) * a), btn_w*2, btn_h, _
				"WATCH MATCH",_
				C_WHITE, C_GREEN,is_equal(a,Main_menu_Item_selected),C_WHITE)
            end if
        Case 7
			draw_button (SCREEN_W\2 - btn_w\2,_
			top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
			"Edit TACTICS",_
			C_WHITE, C_GRAY,is_equal(a,Main_menu_Item_selected),C_WHITE)
		Case 8
			draw_button (SCREEN_W\2 - btn_w\2,_
			top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
			"Edit Team - " + Main_Menu_List_Teams(Main_menu_Team_0_selected).label,_
			C_WHITE, C_GRAY,is_equal(a,Main_menu_Item_selected),C_WHITE)
		Case 9
			draw_button (SCREEN_W\2 - btn_w\2,_
			top_margin + ((btn_h + btn_v_space) * a), btn_w, btn_h, _
			"Edit Behaviour",_
			C_WHITE, C_GRAY,is_equal(a,Main_menu_Item_selected),C_WHITE)
        End Select
    Next a
    
    'context-help
    if (Display_Help) then
		draw_whole_screen_shadowed()
		print_whole_array(UM_txt_main_menu(), 20, 20)
	end if
   
End Sub

SUB draw_pitch()
    dim as Integer pitch_rows, pitch_cols, a, b, c
    dim banner_message as string*32
    pitch_rows = PITCH_H \ 32 + 8
    pitch_cols = PITCH_W \ 32 + 8
    
    'drawing the grass
    for a = -2 to pitch_rows -1
        for b = -2 to pitch_cols -1
            if is_in_camera_crop (PITCH_X + b*32, PITCH_Y + a*32, 128) then
                if a mod 2 = 0 then
                    PUT (PITCH_X - 64 + (b*32)- c_x_o, PITCH_Y - 64 +(a*32) - c_y_o),_
                    pitch_sprite(Main_menu_pitch_type_selected*2),Pset
                else
                    PUT (PITCH_X - 64 + (b*32)- c_x_o, PITCH_Y - 64 +(a*32) - c_y_o),_
                    pitch_sprite(Main_menu_pitch_type_selected*2+1),Pset
                end if
            end if
        next b
    next a
    
    'banner
    PUT (PITCH_X + 10 - c_x_o, PITCH_Y - 27 - c_y_o), banner_sprite, trans
    banner_message = GAME_NAME + " " + str(GAME_VERSION) + " ::: "
    PrintFont PITCH_X + 15 - c_x_o,  PITCH_Y - 20 - c_y_o, banner_message, SmallFont, 1,1
    
    PUT (PITCH_X + PITCH_W - 266 - c_x_o, PITCH_Y - 27 - c_y_o), banner_sprite, trans
    banner_message = GAME_AUTHOR_SITE
    draw string (PITCH_X + PITCH_W - 256 - c_x_o,  PITCH_Y - 20 - c_y_o), banner_message, RGB(50,50,50)
    
    'bench
    PUT (PITCH_X - 90 - c_x_o, PITCH_MIDDLE_H - c_y_o - 200), Bench_bitmap, trans
    PUT (PITCH_X - 90 - c_x_o, PITCH_MIDDLE_H - c_y_o + 20), Bench_bitmap, trans
    
    'cameraman
    for c = 0 to 7
		Cameraman(c).rds = _abtp(cameraman(c).x,cameraman(c).y, Ball.x, Ball.y)
		PUT (cameraman(c).x - c_x_o, cameraman(c).y - c_y_o),_
		Cameraman_sprite(start_frame_static(Cameraman(c).rds)),_
		trans
    next c
    
END SUB

sub draw_pitch_lines (  x as integer,_
                        y as integer,_
                        w as integer,_
                        h as integer,_
                        xm as integer,_
                        ym as integer,_
                        paw as integer,_
                        pah as integer,_  'penalty area height
                        pac as integer,_  'penalty area circle diameter
                        padw as integer,_  'penalty dish diameter
                        padd as integer,_  'penalty dish distance from net
                        gkw as integer,_  'half goalkeeper area
                        gkh as integer,_
                        lc as integer, _
                        cxo as integer,_
                        cyo as integer)
    'drawing the pitch's border lines
    Line (x - cxo, y - cyo)-(w + x - cxo, h + y - cyo), lc, b
    'middle line, circle , dish
    Line (x - cxo, ym - cyo)-(x + w - cxo, ym - cyo),lc
    put (xm - cxo - 8, ym - cyo - 8), Dish_sprite,trans
    circle (xm - cxo, ym - cyo), pac, lc
    
    'Top penalty area
    Line (xm - paw - cxo, y - cyo)-(xm + paw - cxo, y + pah - cyo), lc,B
    'Top Gk area
    Line (xm - gkw - cxo, y - cyo)-(xm + gkw - cxo, y + gkh - cyo), lc,B
    'top penalty dish
    put (xm - cxo - 8, y + padd - cyo - 8), Dish_sprite,trans
    'Circle (xm - cxo, y + padd - cyo), pac,lc,3.75,5.65
    'Bottom penalty area
    Line (xm - paw - cxo, y + h - cyo)-(xm + paw - cxo, y + h - pah - cyo), lc,B
    'Bottom Gk area
    Line (xm - gkw - cxo, y + h - cyo)-(xm + gkw - cxo, y + h - gkh - cyo), lc,B
    'Bottom penalty dish
    put (xm - cxo - 8, y + h - padd - cyo - 8), Dish_sprite,trans
    
end sub

SUB draw_players()
    dim as Integer b, c, lowest, start, change, ref, frame_offset
    dim a(PL_N_TOT * 2,2) as integer
    
    b = 0
    
    'z sorting by pl.y value - using selection sorting algorithm
    for c = 0 to PL_N_TOT * 2-1
        a(c,0) = c
        a(c,1) = pl(c).y
    next c
    
    for start = 0 to PL_N_TOT * 2 - 1 
        ref = a(start,1)
        change = 0 
        for b = start+1 to PL_N_TOT * 2 - 1 
            if a(b,1) < ref then
                ref = a(b, 1)
                lowest = b
                change = 1
            end if
        next b
        if change then
            swap a(lowest, 0), a(start, 0)
            swap a(lowest, 1), a(start, 1)
        end if
    next start
    
    'draws players, shadow, and circle under nearest pl to the ball
    for c = 0 to PL_N_TOT * 2 - 1
        'draws circles yellow or red under the nearest pl to the ball
        if DEBUG then
                if is_pl_into_opponent_penalty_area (pl(a(c,0)).id) then
                    circle (pl(a(c,0)).x - c_x_o, pl(a(c,0)).y - c_y_o),16, C_WHITE
                end if
        end if
        
        
        if (Human_control) then
            if get_nrst_pl_ball(pl(a(c,0)).team) = a(c,0) then 
                if pl(a(c,0)).team = 0 then
                    'another one ring if the pl is the ball owner
                    if a(c,0) = PL_ball_owner_id then
                        circle (pl(a(c,0)).x - c_x_o, pl(a(c,0)).y - c_y_o + 10),11, C_WHITE,,,,F
                    end if
                    circle (pl(a(c,0)).x - c_x_o, pl(a(c,0)).y - c_y_o + 10),9, RGB (200,0,100),,,,F
                    circle (pl(a(c,0)).x - c_x_o, pl(a(c,0)).y - c_y_o + 10),6, RGB (0,50,0),,,,F
                end if
            end if
        end if
        
        'puts the right set of sprites depending on the pl.action
        if is_in_camera_crop (pl(a(c,0)).x, pl(a(c,0)).y, 128) then
			'pl number display
			if (PL_ball_owner_id = pl(a(c,0)).id) then
				PrintFont	pl(a(c,0)).x - 5 - c_x_o, pl(a(c,0)).y-28-c_y_o,_
							str(pl(a(c,0)).number), Unifont, 1,1 
			end if
            select case pl(a(c,0)).action
            case 0 '*** at this moment undefined***
            case running
                
                pl(a(c,0)).frame_offset = 0
                pl(a(c,0)).dist += pl(a(c,0)).speed / 266
                if pl(a(c,0)).dist > 1 then
                    pl(a(c,0)).frame+=1
                    pl(a(c,0)).dist = 0
                end if
                if pl(a(c,0)).frame > 5 then pl(a(c,0)).frame=1
                if pl(a(c,0)).speed = 0 then pl((a(c,0))).frame = 0
                
                if pl(a(c,0)).team = 0 then
                    if pl(a(c,0)).role = "G" then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_0(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame), trans
                    end if
                else
                    if pl(a(c,0)).role = "G" then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_1(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame), trans
                    end if
                end if
            case jumping, sliding, falling, falled, throw_in, gk_falled_w_ball, free_kicker
                select case pl(a(c,0)).action
                    case jumping
                        pl(a(c,0)).frame_offset = 8
                    case sliding
                        pl(a(c,0)).frame_offset = 7
                    case falling, falled, gk_falled_w_ball
                        pl(a(c,0)).frame_offset = 6
                    case throw_in
                        pl(a(c,0)).frame_offset = 16
                    case free_kicker
                        pl(a(c,0)).frame_offset = 0
                end select
                
                if pl(a(c,0)).team = 0 then
                    if pl(a(c,0)).id < 2 then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame_offset), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_0(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame_offset), trans
                    end if
                else
                    if pl(a(c,0)).id < 2 then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame_offset), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_1(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame_offset), trans
                    end if
                end if
            
            case gk_jumping
                pl(a(c,0)).frame_offset +=1
                if pl(a(c,0)).frame_offset > 12 then pl(a(c,0)).frame_offset = 0
                if pl(a(c,0)).team = 0 then
                    if pl(a(c,0)).role = "G" then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+int(pl(a(c,0)).frame_offset/2)+9), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_0(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+int(pl(a(c,0)).frame_offset/2)+9), trans
                    end if
                else
                    if pl(a(c,0)).role = "G" then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+int(pl(a(c,0)).frame_offset/2)+9), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_1(pl(a(c,0)).skin, start_frame(pl(a(c,0)).rds)+int(pl(a(c,0)).frame_offset/2)+9), trans
                    end if
                end if

            case else
            end select
        end if
    next c
END SUB

SUB draw_splashscreen()
	static as single x1, x2, x3, y1, y2, y3
		
	dim easing as integer = 15
	x1 = SCREEN_W\2 - 130
	if (y1 < 50) then y1 = y1 + (50 - y1)/easing
	if (y2 < SCREEN_H\2 - 90) then y2 = y2 + (SCREEN_H\2 - 90 - y2)/easing
	if (y3 < SCREEN_H - 50) then y3 = y3 + (SCREEN_H - 50 - y3)/easing
	put (0,0), Wallpaper(4), pset

	PrintFont x1 - (len(GAME_SPLASHSCREEN_TEXT)*7)\2 , y1, GAME_SPLASHSCREEN_TEXT, ButtonFont, 2, 1 
	
	PrintFont x1 - 10, y1 + 30, _
	"This software is released under the Terms of the GNU GPL license v. 2.0", _
	SmallFont, 1, 1 
	
	PrintFont SCREEN_W\2 - 95, y3, "PRESS ESC TO START", CoolFont, 1, 1
	put (SCREEN_W\2 - 75, y2), Splashscreen_sprite, trans	
END SUB

Sub draw_team_editor()
	
	dim as integer col, row, x, y, w, h, x_padding, y_padding, mask_color, label_w
	dim labels(12) As String*16 = {"NUMBER","ROLE","NAME","SKIN","SPEED", "control", _
                       "POWER KICK", "POWER HEAD", "POWER TACKLE", "POWER GK", "PRECISION", "AVERAGE"}
	dim label as string = ""
	dim as integer pl_avg_value, star, box_height, dashed_line
	
	x = 20
	y = 50
	w = 25
	h = 24
	label_w = 200
	x_padding = 2
	y_padding = 5
	mask_color = C_WHITE
	
	PUT (0, 0), Wallpaper(3),pset
	draw_button 	(0, 0, SCREEN_W, 30, _
					"TEAM EDITOR " +_
					Main_Menu_List_Teams(Main_menu_Team_0_selected).label,_
					C_WHITE, C_DARK_BLUE,0,0)

	draw_button 	(0, SCREEN_H - 30, SCREEN_W, 30, _
					"PRESS CTRL + S to SAVE & CLOSE Editor",_
					C_WHITE, C_DARK_RED,0,0)

	for row = 0 to TE_ROWS-1
		pl_avg_value = (int((pl(row).speed_default + pl(row).control + _
						pl(row).pwr_kick + pl(row).pwr_head + _
						pl(row).pwr_tackle + pl(row).pwr_gk + _
						pl(row).precision)/7))
						
		star = int(pl_avg_value/10)
		if star < 0 then star = 0
		if star > 9 then star = 9
		
		for col = 0 to TE_COLS
			select case col
				case 0
					label = str(pl(row).number)
				case 1
					label = str(pl(row).role)
				case 2
					label = pl(row).label
				case 3
					label = "" 'str(pl(row).skin)
				case 4
					label = str(pl(row).speed_default)
					box_height = pl(row).speed_default
				case 5
					label = str(pl(row).control)
					box_height = pl(row).control
				case 6
					label = str(pl(row).pwr_kick)
					box_height = pl(row).pwr_kick
				case 7
					label = str(pl(row).pwr_head)
					box_height = pl(row).pwr_head
				case 8
					label = str(pl(row).pwr_tackle)
					box_height = pl(row).pwr_tackle
				case 9
					label = str(pl(row).pwr_gk)
					box_height = pl(row).pwr_gk
				case 10
					label = str(pl(row).precision)
					box_height = pl(row).precision
				case 11
					label = player_money_value(pl_avg_value)
			end select
			if col = 2 then
				w = 180
			elseif col = 3 then
				w = 14
			elseif col = 11 then
				w = 80
			else
				w = 44
			end if
			if col = TE_col_sel and row = TE_row_sel then
				mask_color = C_BLACK
			else
				mask_color = C_GRAY
			end if
			'mark selected line
			'draws boxes with a height in proportion of the value
			if TE_row_sel = row then
				if col > 3 and col < 11 then
					for dashed_line = 0 to box_height
						if dashed_line mod 2 then
							Line (x, y - dashed_line)-(x + w, y - dashed_line),  C_WHITE, , &b1010101010101010
						else
							Line (x, y - dashed_line)-(x + w, y - dashed_line),  C_WHITE, , &b0101010101010101
						end if
					next dashed_line
				end if
			end if
			'show the label for each value
			if col = TE_col_sel and row = TE_row_sel then
				if col > 2 then
				draw_button (x - label_w - x_padding, y, label_w, h, labels(col), C_GRAY, C_DARK_RED, 0, 0)
				else
				draw_button (x, y - h - y_padding, label_w, h, labels(col),	C_GRAY, C_DARK_RED, 0, 0)
				end if
			end if
			'mark selected value
			if col = TE_col_sel and row = TE_row_sel and TE_select then
				draw_button (x, y, w, h, label,	C_WHITE xor mask_color, C_BLUE xor mask_color, TE_select, C_WHITE)
			else
				draw_button (x, y, w, h, label,	C_GRAY xor mask_color, C_BLUE xor mask_color, 0, C_WHITE)
			end if
			'puts the stars
			if col = 11 then
				put (x + w + x_padding,y), Star_sprite(star), trans
			end if
			'head of the player
			if col = 3 then
				put (x + 2,y + 2), Head_sprite(pl(row).skin), trans
			end if
			x += w + x_padding
		next col
		x = 20
		y += h + y_padding
	next row
	
	'context-help
    if (Display_Help) then
		draw_whole_screen_shadowed()
		print_whole_array(UM_txt_team_editor(), 20, 20)
	end if
	
End sub

SUB draw_top_net()
    PUT (PITCH_MIDDLE_W - 53 - c_x_o, PITCH_Y - 38 - c_y_o ), net_sprite(0), trans
end sub

sub draw_whole_screen_shadowed()
    dim as integer col, row
    for row = 0 to int (SCREEN_H \ 32) +1
		for col = 0 to int (SCREEN_W \ 32) +1
			PUT (32*col, row * 32), Shadowed_dark_sprite, trans
		next col
    next row
end sub

SUB dbg_display_tct_file_check() 
	DO
		Screensync
		Screenlock ' Lock the screen
		Screenset workpage, workpage xor 1 ' Swap work pages.
		Cls
		scope
			dim as integer c, t
			draw string (5, 5), "BHV FILE CHECK - press ESC to EXIT"
			for t = 0 to 35
				draw string (10, t*10 +20), str(t)
				for c = 0 to 9
					PrintFont c*25 + DBG_TXT_OFFSET, t*6 +10, str(bhv_tile(t,c)), SmallFont, 1, 1
                 next c
			next t
		end scope
		workpage xor = 1 ' Swap work pages.
		Screenunlock
		SLEEP SLEEP_TIME, 1
	LOOP UNTIL MULTIKEY(SC_ESCAPE)
END SUB

'see comment below for details about the bhv_tile array
SUB get_pl_behavior(pl_id as Integer)
    dim tile as Integer '0-35
    dim decision as Integer '0-100
    dim pl_to_pass as Integer = 0
    
    decision = rnd*100
    tile = get_ball_tile(Team(pl(pl_id).team).att_dir)
    '--------------------------------------------------------------------
    'if there is enough room or THE Pl is outside penalty area - run to the opponent net
    if is_pl_into_opponent_penalty_area(pl_id) = 0 and _
        d_b_t_p (	pl(pl_id).x,pl(pl_id).y,_
					pl(get_nrst_pl_ball(1-pl(pl_id).team)).x,_
					pl(get_nrst_pl_ball(1-pl(pl_id).team)).y)_
					> PL_RUN_SPACE then
		
            ball.rds = _abtp (pl(pl_id).x, pl(pl_id).y,_
            PITCH_MIDDLE_W, PITCH_Y + (PITCH_H * (1 - Team(pl(pl_id).team).att_dir))) + rnd * .5 -.25
            ball.speed = pl(pl_id).speed
            SHELL_message = "run to opponent"
    '--------------------------------------------------------------------
    'else get standard behaviour table
    else
        select case decision
        case 0 to bhv_tile(tile, 0) '0: PASS TO NEAREST
            SHELL_message =  str(decision) + " TILE " + str(tile) + " PASS to nearest"
            shoot_ball  (pl_id, get_nrst_pl_pass(pl_id),_
                        pl(get_nrst_pl_pass(pl_id)).x,_
                        pl(get_nrst_pl_pass(pl_id)).y, 0.05, 0)
            PL_target_id = get_nrst_pl_pass(pl_id)
            exit sub
        case bhv_tile(tile, 0)+1 to bhv_tile(tile, 1)	'1: pass_to_2nd_nearest
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " PASS 2nd nearest"
            pl_to_pass = rnd*2 + 1
            shoot_ball  (pl_id, get_nrst2_pl_pass(pl_id, pl_to_pass),_
                        pl(get_nrst2_pl_pass(pl_id, pl_to_pass)).x,_
                        pl(get_nrst2_pl_pass(pl_id, pl_to_pass)).y, 0.1, 0)
            PL_target_id = get_nrst2_pl_pass(pl_id, pl_to_pass)
            exit sub
        case bhv_tile(tile, 1)+1 to bhv_tile(tile, 2)	'2: pass_short_side
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " PASS Short Side"
            shoot_ball  (pl_id, get_nrst_pl_pass(pl_id),_
                        pl(get_nrst_pl_pass(pl_id)).x,_
                        pl(get_nrst_pl_pass(pl_id)).y, 0.2, 0)
            PL_target_id = get_nrst_pl_pass(pl_id)
            exit sub
        case bhv_tile(tile, 2)+1 to bhv_tile(tile, 3)	'3: pass_long_side
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " PASS Long Side"
            shoot_ball  (pl_id, get_nrst_pl_pass(pl_id),_
                        pl(get_nrst_pl_pass(pl_id)).x,_
                        pl(get_nrst_pl_pass(pl_id)).y, 0.3, 0)
            PL_target_id = get_nrst_pl_pass(pl_id)
            exit sub
        case bhv_tile(tile, 3)+1 to bhv_tile(tile, 4)	'4: pass_endline
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " PASS Endline"
            shoot_ball  (pl_id, get_nrst_pl_pass(pl_id),_
                        pl(get_nrst_pl_pass(pl_id)).x,_
                        pl(get_nrst_pl_pass(pl_id)).y, 0.5,0)
            PL_target_id = get_nrst_pl_pass(pl_id)
            exit sub
        case bhv_tile(tile, 4)+1 to bhv_tile(tile, 5) '5: pass_center 
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " PASS center"
            shoot_ball  (pl_id, get_centerest_pl_to_pass(pl_id),_
                        pl(get_centerest_pl_to_pass(pl_id)).x,_
                        pl(get_centerest_pl_to_pass(pl_id)).y, 0.6, 0)
            PL_target_id = get_centerest_pl_to_pass(pl_id)
            exit sub
        case bhv_tile(tile, 5)+1 to bhv_tile(tile, 6)	'6: run_to_centre
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " R U N centre"
            ball.speed += ((rnd*5 + 5) * M_Pixel)
            ball.rds = _abtp (pl(pl_id).x, pl(pl_id).y, pl(pl_id).x, PITCH_MIDDLE_H) + rnd * .25 -.125
            PL_target_id = -1 ' The pl is not passing to anyone
            
            exit sub
        case bhv_tile(tile, 6)+1 to bhv_tile(tile, 7)	'7: run_to_net
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " R U N to net"
            
            reset_ball_z()

            ball.rds = _abtp (pl(pl_id).x, pl(pl_id).y,_
            PITCH_MIDDLE_W , (PITCH_Y + PITCH_H * (1 - Team(pl(pl_id).team).att_dir))) + rnd * .25 -.125
            ball.speed += ((rnd*5 + 5) * M_Pixel)
            PL_target_id = -1 ' The pl is not passing to anyone
            
            
            exit sub
        case bhv_tile(tile, 7)+1 to bhv_tile(tile, 8)	'8: run_to_endline
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " R U N to endline"
            
            ball.rds = _abtp (	pl(pl_id).x, pl(pl_id).y,_
								pl(pl_id).x, PITCH_Y + (PITCH_H * (1 - Team(pl(pl_id).team).att_dir)))
            
            ball.speed += pl(pl_id).speed
            PL_target_id = -1 ' The pl is not passing to anyone
            
            
            exit sub
        case bhv_tile(tile, 8)+1 to 100             '9: shoot_in_target
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " SHOOT in TARGET"
            
            ball.rds = find_shoot_angle(pl_id)
            ball.spin = 0.5 * rnd - 0.25
            
            if decision mod 2 = 0 then 
                reset_ball_z()
                ball.speed = (pl(pl_id).pwr_kick/100) * BALL_MAX_SPEED
                ball.z_speed_init = rnd(10)+30 * M_PIXEL
                ball.z_speed=ball.z_speed_init
            else
                reset_ball_z()
                ball.speed = (pl(pl_id).pwr_kick/100) * BALL_MAX_SPEED
                ball.z_speed_init = rnd(5)+15 * M_PIXEL
            end if
            
            PL_target_id = -1 ' The pl is not passing to anyone
            PL_team_owner_id = pl(pl_id).team
            exit sub
        case else
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " *** SORRY <undefined>"
            exit sub
            
        end select
    end if
END SUB

SUB get_user_input()

    'in Debug mode use some custom keys to check the correct behaviour of
    'the Match_event
    if DEBUG then
        if Multikey(SC_0) then Match_event = ball_in_game : Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        if Multikey(SC_1) then Match_event = corner_tl_side_t0 : Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        if Multikey(SC_2) then Match_event = corner_tr_side_t0 : Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        if Multikey(SC_3) then Match_event = throw_in_lside_t0 : Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        if Multikey(SC_4) then Match_event = throw_in_rside_t0 : Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        if Multikey(SC_5) then Match_event = penalty_t0 : Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        if Multikey(SC_6) then Match_event = penalty_t1 : Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        if Multikey(SC_7) then Match_event = foul_t0 : Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        if Multikey(SC_8) then Match_event = foul_t1 : Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
    end if
    
END SUB

SUB get_user_spin()
	if 	CBool(Timer - Key_released_time_start > 0.2) and _
		CBool(Timer - Key_released_time_start < 0.4) and is_PL_input_rds() then
		if	is_PL_input_rds() then
			Ball.x_spin += cos(get_PL_input_rds)
			Ball.y_spin += -sin(get_PL_input_rds)
			Ball.spin = cos(Ball.rds-_abtp(0, 0, Ball.x_spin, Ball.y_spin)+PI_2) '/ BALL_SPIN_RATIO
		end if
		Key_released_time_start = 0.0
		Ball.x_spin = 0
		Ball.y_spin = 0
	end if
END SUB

SUB get_user_input_action(c as Integer)
    dim user_key_action as integer = 0
    'if the input is via Joystick
    if (Main_Menu_control_selected) then
        GetJoystick(Joystick.id,Joystick.buttons,Joystick.x,Joystick.y)
    
    	if (Joystick.buttons And (1 Shl 0)) then user_key_action = 1
    else
        if Multikey(SC_CONTROL) then user_key_action = 1
    end if
    
    'if Human press the CTRL key that wasn't pressed before
    If user_key_action and key_pressed = 0 then
        Key_pressed = 1
        Key_released = 0
        Key_pressed_time_start = Timer
    end if
    'CTRL key released
    If user_key_action = 0 and key_pressed = 1 then
        Key_pressed = 0
        Key_released = 1
    end if
    ' if the CTRL key has been released then...
    if Cbool(Key_released) and is_ball_controllable_by_human(c) then
        Key_pressed_gap = timer - Key_pressed_time_start
        
        Key_released = 0
        Key_pressed = 0
        reset_ball_z()
        
        if Key_pressed_gap < 0.30 then
            'passing
            if get_pl_to_pass(c) then
				shoot_ball  (c, get_pl_to_pass(c),_
                        pl(get_pl_to_pass(c)).x,_
                        pl(get_pl_to_pass(c)).y, 2 * Key_pressed_gap, 0)
            else
                ball.rds = pl(c).rds
                ball.speed = pl(c).speed + 70 * M_Pixel
                'no pass anyone
                PL_target_id = -1
            end if
        else 
            ball.rds = pl(c).rds
            ball.speed = pl(c).pwr_kick * Key_pressed_gap * M_Pixel
            ball.z_speed = 20 * M_Pixel
            ball.z_speed_init = ball.z_speed
            'no pass anyone
            PL_target_id = -1
        end if
        Key_released_time_start = Timer
        PL_ball_owner_id = c
        PL_team_owner_id = pl(c).team
        pl(c).delay = 50
        Match_event = ball_in_game
        if pl(c).action = throw_in 		then pl(c).action = running
        if pl(c).action = free_kicker 	then pl(c).action = running
    end if
    
    'if the CTRL key is released but the pl is not owner of the ball
    'or can't control it
    if (Key_released) then
        Key_released = 0
        Key_pressed = 0
        Key_pressed_time_start = 0
        Key_pressed_gap = 0
        If is_ball_headkickable(c) then
            shell_message = " - KEY CTRL Headkick"
            pl(c).speed *= SPEED_RATIO_HEADING
            pl(c).delay = 25
            pl(c).action = 2 '2 = headkicking
            exit sub
        end if
        If is_ball_slidable(c) then
            shell_message = " - KEY CTRL slide"
            pl(c).speed *= SPEED_RATIO_SLIDING
            pl(c).delay =  35
            pl(c).action = sliding
            pl(c).rds = _abtp(pl(c).x, pl(c).y, ball.x, ball.y)
            exit sub
        end if
        end if
END SUB

SUB init_gfx()
	'init camera dimensions
	camera.w = SCREEN_W
	camera.h = SCREEN_H
	camera.x = PITCH_MIDDLE_W
	camera.y = PITCH_MIDDLE_H
	'GFX INIT--------------------------------------------------------------------------------
	ScreenRes SCREEN_W,SCREEN_H,24,2,0 ' Sets the graphic mode
	SCREENSET 1, 0
	CLS
	WindowTitle GAME_NAME + " " + Str(GAME_VERSION) + " by " + str(GAME_AUTHOR)
	'hides the mouse
    SetMouse 320, 240, 0
    load_fonts()
END SUB

SUB init_team_data()
    'attack directions initializations
    Team(0).att_dir = rnd*1
    Team(1).att_dir = 1 - Team(0).att_dir
    'goal initializations
    Team(0).goal = 0
    Team(1).goal = 0
    'fill the kits with the team default colors
    paint_kits(	Team(0).c_4, Team(0).c_1,Team(0).c_2,Team(0).c_3,_
				Team(1).c_4,Team(1).c_1,Team(1).c_2,Team(1).c_3)
				
	Team(0).kick_off = false
	Team(1).kick_off = false
	
	if int(rnd*1) then
		Team(0).kick_off = true
	else
		Team(1).kick_off = true
	end if
	
END SUB

SUB init_players_proprietes()
    dim as integer t, c
    dim id as integer = 0
    Dim ff As Ubyte
    ff = Freefile
    'read data from text file and store into array
    for t = 0 to 1
    Open "_data/" + Team(t).id + ".team.csv" For input As #ff
        for c = (PL_N_TOT)*t to PL_N_TOT+((PL_N_TOT)*t)-1 
            'assign values from file
            Input #ff,  pl(c).number,pl(c).role,pl(c).label,pl(c).skin,_
                       pl(c).speed_default,pl(c).control,pl(c).pwr_kick,_
                       pl(c).pwr_head,pl(c).pwr_tackle,pl(c).pwr_gk,_
                       pl(c).precision
            pl(c).tct_id = pl(c).number - 2
            pl(c).speed_default = (pl(c).speed_default/100)*PL_DEFAULT_SPEED
            pl(c).speed = pl(c).speed_default
            pl(c).team = t
            pl(c).w = 10
            pl(c).delay = 0
            pl(c).active = 1 ' by default the pl is ready to perform any action
            pl(c).action = running 'by default the pl can run
            pl(c).rds = 0
            pl(c).frame = 0
            pl(c).frame_offset = 0
            pl(c).dist = 0
            pl(c).delay = 0
            pl(c).y = PITCH_Y + (PITCH_H\4) + ((PITCH_H\2)*(t xor 1))
            'assign id
            pl(c).id = c
            pl(c).is_in_place = false
            pl(c).x = PITCH_X - 100
            pl(c).y = PITCH_H\2 + PITCH_Y
        next c
    Close #ff
    next t
    'initialize who is receiving the ball (none)
    PL_target_id = -1
END SUB

SUB init_timing()
	Timing.time_start = Timer
	Timing.fps = 0
	Timing.actual_fps = 0
	Timing.time_last = Timer
	Timing.time_current = Timer
	Timing.seconds_elapsed = 0
	Timing.secs_to_play = 60 * Main_Menu_List_mins(Main_menu_mins_selected)
	Timing.injury_time = rnd * 4 + 2
END SUB

SUB load_bitmap()
    dim as integer img_x, img_w, img_y, img_h, count, action, offset, c
    'loading players sprites------------------------------------------------------------
    img_w = 21
    img_h = 25
    img_x = 0
    img_y = 0
    
    'loading team overlay kits
    for c = 0 to KIT_TOT_N-1
    	BLOAD "img\kit_"+ str(c)+".bmp", 0
		Kit_overlay(c) = IMAGECREATE(357,200)
		get (0,0)-(356,199), Kit_overlay(c)
    next c
    
    'loading logo
    BLOAD "img\splashscreen.bmp", 0
    Splashscreen_sprite = IMAGECREATE(150, 180)
    get (0,0)-(149,179), Splashscreen_sprite
    
    'loading stadium
    BLOAD "img\stadium_top.bmp", 0
    Stadium_bitmap(0) = IMAGECREATE(305, 192)
    get (0,0)-(304,191), Stadium_bitmap(0)
	BLOAD "img\stadium_bottom.bmp", 0
    Stadium_bitmap(1) = IMAGECREATE(305, 192)
    get (0,0)-(304,191), Stadium_bitmap(1)
    
    'loading bench
    BLOAD "img\bench.bmp", 0
    Bench_bitmap = IMAGECREATE(80, 150)
    get (0,0)-(79,149), Bench_bitmap
    
    'loading penalty dish
    BLOAD "img\dish.bmp", 0
    Dish_sprite = IMAGECREATE(16, 16)
    get (0,0)-(15,15), Dish_sprite
    
	'loading my old Amiga 1200
	BLOAD "img\amiga_1200.bmp", 0
    Amiga_1200_bitmap = IMAGECREATE(256, 131)
    get (0,0)-(255,130), Amiga_1200_bitmap

    'loading back net
    BLOAD "img\back_net.bmp", 0
    Back_net = IMAGECREATE(292,100)
    get (0,0)-(291,99), Back_net
    
    'loading ball sprites
    BLOAD "img\ball_sprites.bmp", 0
    img_x = 0
    img_y = 0
    for count = 0 to 14
        ball_sprite(count) = IMAGECREATE (img_w, img_h)
        GET (img_x, img_y)-(img_x + 15, img_y + 15), ball_sprite(count)
        img_x += 16
    next count
    
    'loading cameraman sprites
    BLOAD "img\cameraman.bmp", 0
    img_x = 0
    img_y = 0
    for count = 0 to 7
        Cameraman_sprite(count) = IMAGECREATE (16, 25)
        GET (img_x, img_y)-(img_x + 15, img_y + 24), Cameraman_sprite(count)
        img_x = 0
        img_y += 25
    next count
    
    'loading head sprites
    BLOAD "img\heads.bmp", 0
    for c = 0 to 2
        Head_sprite(c) = IMAGECREATE (10, 12)
        GET (c*10, 0)-(c*10+9, 11), Head_sprite(c)
    next c
    
    'loading stars sprites
    BLOAD "img\stars.bmp", 0
    for c = 0 to 9
        Star_sprite(c) = IMAGECREATE (80, 16)
        GET (0, c*16)-(79, c*16+15), Star_sprite(c)
    next c
    
    'loading tactict editor player sprite
    BLOAD "img\tact_sprite.bmp", 0
    Pl_tact_sprite = IMAGECREATE (26, 48)
    GET (0, 0)-(25, 47), Pl_tact_sprite
        
    BLOAD "img\slider.bmp",0
    Slider_sprite = IMAGECREATE(92,59)
    get (0,0)-(91,58), Slider_sprite
    
    'loading net sprites
    BLOAD "img\net_0.bmp",0
    net_sprite(0) = IMAGECREATE(106,38)
    GET (0,0)-(105,37), net_sprite(0)
    BLOAD "img\net_1.bmp",0
    net_sprite(1) = IMAGECREATE(106,38)
    GET (0,0)-(105,37), net_sprite(1)
    
    'loading pitch grass
    BLOAD "img\pitch.bmp",0
    for c = 0 to 11
        pitch_sprite(c) = IMAGECREATE(32,32)
        GET (c*32,0)-(c*32+31,31), pitch_sprite(c)
    next c
    
    'loading advertising banner
    BLOAD "img\banner.bmp",0
    banner_sprite = IMAGECREATE(256,24)
    GET (0,0)-(255,23), banner_sprite
    
    'loading the shadowet texture
    BLOAD "img\shadowed.bmp",0
    shadowed_sprite = IMAGECREATE(32,32)
    GET (0,0)-(31,31), shadowed_sprite
    
    BLOAD "img\shadowed_dark.bmp",0
    Shadowed_dark_sprite = IMAGECREATE(32,32)
    GET (0,0)-(31,31), Shadowed_dark_sprite
    
    'wallpapers
    for c = 0 to WALLPAPER_TOT_N - 1
		BLOAD "img\wallp_" + str(c) + ".bmp",0
		Wallpaper(c)= IMAGECREATE(800,600)
		GET (0,0)-(799,599), Wallpaper(c)
    next c
        
END SUB

SUB load_player_sprites()
    dim as integer img_x, img_w, img_y, img_h, count, c
    'loading players sprites-------------------------
    img_w = 21
    img_h = 25
    img_x = 0
    img_y = 0
    'load and stores the sprites into two array
    'one array for each team… then with paint_kits sub
    'the color of the kits of the sprites will be changed
    for c = 0 to 2
		img_x = 0
		img_y = 0
		BLOAD "img\pl_sprites_" + str(c)+ ".bmp", 0
		PUT (0,0), Kit_overlay(Team(0).kit), trans
		
		for count = 0 to PL_SPRITES_TOT_N -1
			if (count > 0) and (count MOD 17 = 0) then
				img_x = 0
				img_y += img_h
			end if
			Pl_sprite_0(c, count) = IMAGECREATE (img_w, img_h)
			gk_sprite(c, count) = IMAGECREATE (img_w, img_h)
			GET (img_x, img_y)-(img_x + 20, img_y + 24), Pl_sprite_0(c, count)
			GET (img_x, img_y)-(img_x + 20, img_y + 24), gk_sprite(c, count)
			img_x += img_w
		next count
	next c
	
	for c = 0 to 2
		img_x = 0
		img_y = 0
		BLOAD "img\pl_sprites_" + str(c)+ ".bmp", 0
		PUT (0,0), Kit_overlay(Team(1).kit), trans
		
		for count = 0 to PL_SPRITES_TOT_N -1
			if (count > 0) and (count MOD 17 = 0) then
				img_x = 0
				img_y += img_h
			end if
			Pl_sprite_1(c, count) = IMAGECREATE (img_w, img_h)
			GET (img_x, img_y)-(img_x + 20, img_y + 24), Pl_sprite_1(c, count)
			img_x += img_w
		next count
	next c
	
	
	
end sub

SUB load_behavior()
'BEHAVIOR DATA
'each row represents the behavior of the player OWNER of the ball in "x" tile
'every column represents a percentage [...]
'So, if the pl owns the ball in the 0 tile he could:
'DATA    [tile 0] 10,20,10,20,4,4,10,4,18,0
' 10% pass to nearest, 20% pass to 2nd nearest, 10% pass by short side,
'20% pass longside, 4% pass to the endline pl [...] and so on...

'fields meaning:
'0: pass_to_nearest; 1: pass_to_2nd_nearest; 2: pass_short_side; 3: pass_long_side
'4:pass_endline; 5: pass_center; 6: run_to_centre; 7: run_to_net
'8: run_to_endline; 9: shoot_in_target
'(see functions meaning on the top of this file)
'IMPORTANT: the SUM of each row is always 100
    dim as integer tl, c, temp 
    Dim ff As Ubyte
    ff = Freefile
    'read and store into array
    Open "_data/bhv.dat" For input As #ff
    for tl = 0 to 35
            Input #ff, bhv_tile(tl,0),bhv_tile(tl,1),bhv_tile(tl,2),bhv_tile(tl,3),_
                bhv_tile(tl,4),bhv_tile(tl,5),bhv_tile(tl,6),bhv_tile(tl,7),_
                bhv_tile(tl,8),bhv_tile(tl,9)
    next tl
    Close #ff
    'transform 10, 20, 35 -> 10, (20+10) = 30, (10+20+35) = 65 [...] and so on
    For tl = 0 To 35
        for c = 1 to 9
            temp = bhv_tile(tl,c-1)
            bhv_tile(tl,c) += temp
        next c
    Next tl
END SUB

SUB load_fonts()
    LoadFont "Fonts\SmallFont.bmp", 	SmallFont	, 1
    LoadFont "Fonts\UniFont.bmp", 		UniFont		, 1
    LoadFont "Fonts\CoolFont.bmp", 		CoolFont	, 1
    LoadFont "Fonts\ButtonFont.bmp", 	ButtonFont	, 2
END SUB

SUB load_pitch_data()
    Dim ff As Ubyte
    ff = Freefile
    Dim flc As Integer = 0
    Open "_data/pitch.dat" For Input As #ff
    Do Until Eof(ff) 
        Input #ff, Pitch_data(flc).label, Pitch_data(flc).bounce_ratio,_
        Pitch_data(flc).friction_ratio 
        flc +=1
    Loop
    Close #ff
END SUB

Sub init_pitch_dimensions(x as integer, y as integer,_
                        w as integer, h as integer, slot as integer)
    Pitch_data(slot).x = x
    Pitch_data(slot).y = y
    Pitch_data(slot).w = w
    Pitch_data(slot).h = h
    Pitch_data(slot).xm = Pitch_data(slot).w \ 2 + Pitch_data(slot).x
    Pitch_data(slot).ym = Pitch_data(slot).h \ 2 + Pitch_data(slot).y
    Pitch_data(slot).paw = Pitch_data(slot).w \ 3 'half penalty area width
    Pitch_data(slot).pah = Pitch_data(slot).h \ 6 'penalty area height
    Pitch_data(slot).pac = Pitch_data(slot).w \ 10 'penalty area circle diameter
    Pitch_data(slot).padw = 2 'penalty dish diameter
    Pitch_data(slot).padd = Pitch_data(slot).pah \ 2'penalty dish distance from net
    Pitch_data(slot).gkw = Pitch_data(slot).paw \ 2 'half goalkeeper area width
    Pitch_data(slot).gkh = Pitch_data(slot).pah \ 3 'goalkeeper area height
    Pitch_data(slot).cdw = 2 'corner dish diameter
    
    Cameraman(0).x = x - 30		:	Cameraman(0).y = y - 25
    Cameraman(1).x = x + w + 10	:	Cameraman(1).y = y - 25
    Cameraman(2).x = x - 30		:	Cameraman(2).y = y + h\2 + 10
    Cameraman(3).x = x + w + 10	:	Cameraman(3).y = y + h\2 + 10
    Cameraman(4).x = x - 30		:	Cameraman(4).y = y + h - 10
    Cameraman(5).x = x + w + 10	:	Cameraman(5).y = y + h - 10
    Cameraman(6).x = x + w - w\2 - 150:	Cameraman(6).y = y + h + 10
    Cameraman(7).x = x + w - w\2 - 150:	Cameraman(7).y = y - 40
    
end sub

SUB load_tact()
    'the "tct_tile" array indicates in wich tile the player must be with corresponding
    'ball position. For example: ball in tile 0 -> read from tct_tile array = player in tile 1
    Dim ff As UByte
    dim as integer slot, c, tl
    dim path as string*32
    ff = FreeFile
    for slot = 0 to 9
        path = "_data\" + tct_tile_label(slot) +".tac"
        Open path For input As #ff
        for c = 0 to 9
            for tl = 0 to 35
                Input #ff, tct_tile(slot,c,tl)
            next tl
        next c
        Close #ff
    next slot
END SUB

SUB load_team_data_for_team_editor(n_team as string)
	dim as integer t, c
    Dim ff As Ubyte
    ff = Freefile
    'read data from text file
    Open "_data/" + n_team + ".team.csv" For input As #ff
	for c = 0 to TE_TOT_PLAYERS-1
		'assign values from file
		Input #ff,  pl(c).number,pl(c).role,pl(c).label,pl(c).skin,_
				   pl(c).speed_default,pl(c).control,pl(c).pwr_kick,_
				   pl(c).pwr_head,pl(c).pwr_tackle,pl(c).pwr_gk,_
				   pl(c).precision
	next c
    Close #ff
END SUB

Sub load_teams_list()
    'File handle statements-------------
    Dim ff As Ubyte
    ff = Freefile
    Dim flc As Integer = 0
    Open "_data/list_teams.team" For Input As #ff
    Do Until Eof(ff) 
        Input #ff, Main_Menu_List_Teams(flc).id, Main_Menu_List_Teams(flc).label,_
        Main_Menu_List_Teams(flc).c_1,Main_Menu_List_Teams(flc).c_2,_
        Main_Menu_List_Teams(flc).c_3,Main_Menu_List_Teams(flc).c_4,_
        Main_Menu_List_Teams(flc).tact_module, Main_Menu_List_Teams(flc).kit
        flc +=1
    Loop
    Close #ff
End Sub

SUB load_whole_txt_file(Byref fn As String,  filearr() As String)
    'Thanks to bulrush for this very useful sub
    'this is a snippet based on his source
    'http://www.freebasic.net/forum/viewtopic.php?f=7&t=24284
    'this sub read a whole text file and put it into an array
    Dim As Integer filenum,res,outpos,i,ub
    Dim As String procname,ln

    outpos 	= 1
    filenum = Freefile
    res 	= Open (fn, For Input, As #filenum)

	While (Not Eof(filenum))
		Line Input #filenum, ln ' Get one whole text line
		Redim Preserve filearr(outpos)
		filearr(outpos)	= ln
		outpos += 1
	Wend

    Close #filenum

    ub = Ubound(filearr)
END SUB


SUB move_player(c as integer)
    '###IMPORTANT!#####
    'update pl position moving him
    pl(c).x +=  cos(pl(c).rds)*pl(c).speed * Dt
    pl(c).y +=  -sin(pl(c).rds)*pl(c).speed * Dt
END SUB

SUB move_all_players()
    dim c as integer = 0
    for c = 0 to PL_N_TOT * 2 - 1
		pl(c).action = running
		move_player(c)
		pl(c).delay =0
    next c
END SUB

SUB paint_kits(c_overlay_0 as integer, c_shirt_0 as integer, c_pants_0 as integer, c_socks_0 as integer, _
    c_overlay_1 as integer, c_shirt_1 as integer, c_pants_1 as integer, c_socks_1 as integer)
    
    Dim as integer count, pitch, c, skin
    Dim pixels As Any Ptr
    dim as Integer img_w = 0
    dim as Integer img_h = 0
	for skin = 0 to 2
		for count = 0 to PL_SPRITES_TOT_N - 1
			If 0 <> ImageInfo( pl_sprite_0(skin, count),img_w ,img_h,, pitch, pixels ) Then
				Print "unable to retrieve image information."
				Sleep
				End
			End If
			'Paint the sprite white the selected color image by directly manipulating pixel memory.
			For y As Integer = 0 To img_h
				Dim row As Integer Ptr = pixels + y * pitch
				For x As Integer = 0 To img_w
					if row[x] = C_KIT_SHIRT 	then row[x] = c_shirt_0
					if row[x] = C_KIT_PANTS 	then row[x] = c_pants_0
					if row[x] = C_KIT_SOCKS 	then row[x] = c_socks_0
					if row[x] = C_KIT_OVERLAY 	then row[x] = c_overlay_0
				Next x
			Next y
			If 0 <> ImageInfo( pl_sprite_1(skin, count),img_w ,img_h,, pitch, pixels ) Then
				Print "unable to retrieve image information."
				Sleep
				End
			End If
			'Paint the sprite white the selected color image by directly manipulating pixel memory.
			For y As Integer = 0 To img_h
				Dim row As Integer Ptr = pixels + y * pitch
				For x As Integer = 0 To img_w
					if row[x] = C_KIT_SHIRT 	then row[x] = c_shirt_1
					if row[x] = C_KIT_PANTS 	then row[x] = c_pants_1
					if row[x] = C_KIT_SOCKS		then row[x] = c_socks_1
					if row[x] = C_KIT_OVERLAY 	then row[x] = c_overlay_1
				Next x
			Next y
		next count
    next skin
    
END SUB

sub print_whole_array(array() As String, x as integer, y as integer)
	dim c as integer
	for c = 0 to Ubound(array)
		draw string (x, y), array(c), C_BLACK
		'draw in yellow lines that begins with '#' char
		if (left(array(c),1)="#") then
			draw string (x - 1, y - 1), array(c), C_YELLOW
		else
			draw string (x - 1, y - 1), array(c), C_WHITE
		end if
		y += 10
	next c
end sub

SUB put_ball_on_centre()
    ball.rds 		= 0
    ball.x 			= 1+ PITCH_MIDDLE_W
    ball.y 			= 1+ PITCH_MIDDLE_H
    Match_event_old_ball_x = ball.x
    Match_event_old_ball_y = ball.y
    ball.z 			= 0
    ball.z_speed 	= 0
    ball.speed 		= 0
    ball.spin 		= 0
    ball.w 			= 4
    ball.frame		=0
    ball.x_spin 	= 0
	ball.y_spin 	= 0
END SUB

SUB reset_ball_z()
    ball.z 				= 0
    ball.z_speed 		= 0
    ball.z_speed_init 	= 0
END SUB

SUB reset_gk_net_position (c as integer, distance_from_net as Integer)
    
    ' if the gk is far away from the net then he comeback to the net
    if d_b_t_p(pl(c).x, pl(c).y, _
    PITCH_MIDDLE_W, PITCH_Y + PITCH_H * (Team(pl(c).team).att_dir)_
    + distance_from_net - distance_from_net * 2 * (Team(pl(c).team).att_dir)) > 5 then
        pl(c).rds =  _abtp(pl(c).x, pl(c).y, _
                    PITCH_MIDDLE_W, PITCH_Y + PITCH_H * (Team(pl(c).team).att_dir)_
                    + distance_from_net - distance_from_net * 2 * (Team(pl(c).team).att_dir))
        pl(c).speed = pl(c).speed_default
        pl(c).delay = 0
        pl(c).active = 1
        'when He gets the net remain there
    else
        pl(c).speed = 0
        pl(c).x = PITCH_MIDDLE_W
        pl(c).y = 	PITCH_Y + PITCH_H * (Team(pl(c).team).att_dir)_
					+ distance_from_net - distance_from_net * 2 * (Team(pl(c).team).att_dir)
        'when stay in the net always watch the ball
        pl(c).rds = _abtp(pl(c).x,pl(c).y, ball.x, ball.y)
    end if
END SUB

SUB reset_player_start_positions(c as integer)
	dim as single x_trg, y_trg
	dim as integer tile_row, tile_col, tile
	tile =  tct_tile    (Team(pl(c).team).tact_module, _
                            pl(c).tct_id, _
                            32)

	'get the row and the column
	tile_row = tile MOD 16
	tile_col = 16-int(tile\16)
	'convert in xy coords
	x_trg = (tile_row * PITCH_W\16) + PITCH_X + PITCH_W\32
	if (team(pl(c).team).att_dir) then
		y_trg = PITCH_Y + PITCH_H\2 + (tile_col * PITCH_H\32)
	else
		y_trg = PITCH_Y + PITCH_H\2 - (tile_col * PITCH_H\32)
	end if
	'returns the right rds to the tile
	pl(c).rds = _abtp (pl(c).x,pl(c).y,x_trg,y_trg)
	'if the distance is less than 5 then the pl has reached the position
	if d_b_t_p(pl(c).x,pl(c).y,x_trg,y_trg) < 5 then
		pl(c).speed = 0
		pl(c).is_in_place = true
		'watch the ball
		pl(c).rds = _abtp(pl(c).x, pl(c).y, Ball.x, Ball.y)
	else
		pl(c).is_in_place = false
		pl(c).speed = pl(c).speed_default
	end if
END SUB

SUB restore_players_speed()
    dim c as Integer
    for c = 0 to (PL_N_TOT*2-1)
        pl(c).speed = pl(c).speed_default
        pl(c).active = 1 
    next c
END SUB

SUB run_tactic(c as Integer)
    dim as single x_trg, y_trg
    dim as integer tile_row, tile_col, tile
    'get the right tile to reach
    'IMPORTANT - Do not remove this condition - I will fix this soon...
    if  get_ball_tile(team(pl(c).team).att_dir) >= 0 and _
        get_ball_tile(team(pl(c).team).att_dir) <= TILES_BALL_N then
		tile =  tct_tile    (Team(pl(c).team).tact_module, _
                            pl(c).tct_id, _
                            get_ball_tile(team(pl(c).team).att_dir))

		'offset of the tactic tile when the ball is of the goalkeeeper
		'or when there is a penalty kick or a throw in
		'(in this case all players have to go outside penalty area)		
		select case match_event
			case gk_t0_owner, gk_t1_owner, penalty_t0, penalty_t1, _	
			throw_in_tl_side_t0, throw_in_tl_side_t1, _
			throw_in_tr_side_t0, throw_in_tr_side_t1, _
			throw_in_bl_side_t0, throw_in_bl_side_t1, _
			throw_in_br_side_t0, throw_in_br_side_t1
			'if (team(pl(c).team).att_dir = 1) then
				if tile > 2 and tile < 14 then tile +=48
				if tile > 17 and tile < 30 then tile +=32
				if tile > 33 and tile < 46 then tile +=16
	'		else
				if tile > 209 and tile < 222 then tile -=16
				if tile > 225 and tile < 238 then tile -=32
				if tile > 241 and tile < 254 then tile -=48
	'		end if
		end select
		
		if (team(pl(c).team).att_dir) then
			tile = TILES_PL_N - tile
		end if
		
		'get row and column
		tile_row = tile MOD 16
		tile_col = 16-int(tile\16)
		'convert in xy coords
		x_trg = (tile_row * PITCH_W\16) + PITCH_X + PITCH_W\32
		y_trg = PITCH_H - (tile_col * PITCH_H\16) + PITCH_H\16
		
		'returns right rds to tile
		pl(c).rds = _abtp (pl(c).x,pl(c).y,x_trg,y_trg)
		'if the distance is less than 5 then the pl has reached the position
		if d_b_t_p(pl(c).x,pl(c).y,x_trg,y_trg) < 5 then
			pl(c).speed = 0
			'watch the ball
			pl(c).rds = _abtp(pl(c).x, pl(c).y, Ball.x, Ball.y)
		else
			pl(c).speed = pl(c).speed_default
		end if
	end if
END SUB

SUB run_tactic_all_players(c as integer)
    dim d as Integer = 0
    for d = 0 to Ubound(pl)-1
        if pl(d).role = "G" then continue for 'the gk doesnt' must follow tactic
        if d = c then continue for
        run_tactic(d)
    next d
END SUB

SUB shoot_ball(pl_id as integer, pl_trg_id as integer, x_trg as single, y_trg as single, alfa as single, spin as single)
    dim dist as single 'distance between ball and target
    dim speed as single 'meter/second
    'distance betweeen ball and target
    dist = d_b_t_p (Ball.x, Ball.y, x_trg, y_trg)
    speed = sqr(GRAVITY_ACCEL * dist/ sin (alfa*2)) * 0.85
    reset_ball_z()
    'angle and speed, z_speed, spin
    Ball.speed = speed * cos(alfa) * M_Pixel
    Ball.z_speed_init = speed * sin(alfa) * M_Pixel
    Ball.z_speed = Ball.z_speed_init
    Ball.spin = spin
    if abs(spin) > 0.1 then
		Ball.rds = _abtp(Ball.x, Ball.y, x_trg, y_trg) + (spin * sqr(dist))
    else
		Ball.rds = _abtp(Ball.x, Ball.y, x_trg, y_trg)
    end if
    'the pl became the ball owner
    PL_ball_owner_id = pl_id
    PL_team_owner_id = pl(pl_id).team
    PL_target_id = pl_trg_id
END SUB

SUB record_ball_position()
    'record n. BALL_RECORD_FRAME each time is called
    static frame as integer
    Ball_record(frame).x = Ball.x
    Ball_record(frame).y = Ball.y
    frame +=1
    if frame > BALL_FRAMES_RECORD - 1 then frame = 0
    '--------------------------------------------
END SUB

SUB record_replay_data (save as boolean)
	Dim ff As UByte
    ff = FreeFile
	static frame as integer
	frame += 1
	dim as integer b, c
	
	if frame > FRAMES_RECORD-1 then frame = 0
	'store camera x & y offset
	Replay_data(frame).co(0) = c_x_o
	Replay_data(frame).co(1) = c_y_o
	
	'store player positions, & their frame used
	for c = 0 to PL_N_TOT*2 -1
		Replay_data(frame).pl(c,0)= pl(c).x
		Replay_data(frame).pl(c,1)= pl(c).y
		Replay_data(frame).pl(c,2)= start_frame(pl(c).rds) + _
									pl(c).frame_offset + pl(c).frame
	next c
	
	'store ball position
	Replay_data(frame).ball(0) = int (Ball.x)
	Replay_data(frame).ball(1) = int (Ball.y)
	Replay_data(frame).ball(2) = int (Ball.z)
	Replay_data(frame).ball(3) = Ball.frame
	
	'___SAVE REPLAY DATA_______________________
	if save then
        Open "replay/" + str(int(rnd*100000000)) + ".rep" For Output As #ff
        for c = frame + 1 to FRAMES_RECORD-1
			'store players positions
			for b = 0 to PL_N_TOT*2-1
				Write #ff, 	str(Replay_data(c).pl(b,0)) + "," + _
							str(Replay_data(c).pl(b,1)) + "," + _
							str(Replay_data(c).pl(b,2))
			next b
			'store ball position
			Write #ff,	str(Replay_data(c).ball(0)) + "," + _
						str(Replay_data(c).ball(1)) + "," + _
						str(Replay_data(c).ball(2)) + "," + _
						str(Replay_data(c).ball(3))
        next c
        for c = 0 to frame
			'store players positions
			for b = 0 to PL_N_TOT*2-1
				Write #ff, 	str(Replay_data(c).pl(b,0)) + "," + _
							str(Replay_data(c).pl(b,1)) + "," + _
							str(Replay_data(c).pl(b,2))
			next b
			'store ball position
			Write #ff,	str(Replay_data(c).ball(0)) + "," + _
						str(Replay_data(c).ball(1)) + "," + _
						str(Replay_data(c).ball(2)) + "," + _
						str(Replay_data(c).ball(3))
        next c
        Close #ff
		Save_Replay = false
	end if
	

END SUB

SUB store_ball_position()
    
    'store old ball x y values INTO the match field
    if  Ball.y > PITCH_Y and Ball.y < PITCH_Y + PITCH_H and _
        Ball.x > PITCH_X and Ball.x < PITCH_X + PITCH_W and _
        Match_event = ball_in_game then 
        Match_event_old_ball_y = Ball.y
        Match_event_old_ball_x = Ball.x
    end if
    'store in which tile the ball is
    if get_ball_tile(0) > 0 and get_ball_tile(0) <= 35 then
        Match_event_last_tile = get_ball_tile(0)
    end if
    
END SUB

SUB update_splashscreen()
	dim e As EVENT
	If (ScreenEvent(@e)) Then
		Select Case e.type
			Case EVENT_KEY_RELEASE
				If (e.scancode = SC_ESCAPE) then
					Exit_flag = 1
				end if
		End Select
	End If
END SUB

Sub update_team_editor()
	dim e As EVENT
	dim Save_team as integer = 0
	dim as integer t, c
    Dim ff As Ubyte
    ff = Freefile

	If MULTIKEY(SC_S) and MULTIKEY(SC_CONTROL) Then
		Save_team = 1
	End If
	
	If (ScreenEvent(@e)) Then
		Select Case e.type
		Case EVENT_KEY_RELEASE
		    'context help show/hide
		    If (e.scancode = SC_F1) Then
                Display_Help = 1 - Display_Help 
            End If
		
			If (e.scancode = SC_Escape) Then
				Exit_flag = 1
				TE_select = 0
				TE_row_sel = 0
				TE_col_sel = 0
				Display_Help = 0
			End If
			If (e.scancode = SC_Enter) Then
				TE_select = 1 - TE_select
			End If
			if TE_select = 0 then
				If (e.scancode = SC_UP) 	Then TE_row_sel -=1
				If (e.scancode = SC_DOWN) 	Then TE_row_sel +=1
				If (e.scancode = SC_RIGHT) 	Then TE_col_sel +=1
				If (e.scancode = SC_LEFT) 	Then TE_col_sel -=1
			end if
			if TE_select then
				select case TE_col_sel
					'case 0
						'label = str(pl(row).number)
					'case 1
						'label = str(pl(row).role)
					case 2
						'label = pl(row).label
						If (e.scancode = SC_SPACE) then  pl(TE_row_sel).label = pl(TE_row_sel).label+" "
						If (e.scancode = SC_A) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"A"
						If (e.scancode = SC_B) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"B"
						If (e.scancode = SC_C) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"C"
						If (e.scancode = SC_D) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"D"
						If (e.scancode = SC_E) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"E"
						If (e.scancode = SC_F) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"F"
						If (e.scancode = SC_G) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"G"
						If (e.scancode = SC_H) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"H"
						If (e.scancode = SC_I) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"I"
						If (e.scancode = SC_J) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"J"
						If (e.scancode = SC_K) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"K"
						If (e.scancode = SC_L) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"L"
						If (e.scancode = SC_M) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"M"
						If (e.scancode = SC_N) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"N"
						If (e.scancode = SC_O) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"O"
						If (e.scancode = SC_P) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"P"
						If (e.scancode = SC_Q) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"Q"
						If (e.scancode = SC_R) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"R"
						If (e.scancode = SC_S) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"S"
						If (e.scancode = SC_T) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"T"
						If (e.scancode = SC_U) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"U"
						If (e.scancode = SC_V) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"V"
						If (e.scancode = SC_W) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"W"
						If (e.scancode = SC_X) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"X"
						If (e.scancode = SC_Y) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"Y"
						If (e.scancode = SC_Z) then  pl(TE_row_sel).label = pl(TE_row_sel).label+"Z"
						If (e.scancode = SC_BACKSPACE) then pl(TE_row_sel).label = ""
					case 3
						'label = str(pl(row).skin)
						If (e.scancode = SC_UP and pl(TE_row_sel).skin < 2) Then pl(TE_row_sel).skin +=1
						If (e.scancode = SC_DOWN and pl(TE_row_sel).skin > 0) 	Then pl(TE_row_sel).skin -=1
					case 4
						If (e.scancode = SC_UP) 	Then pl(TE_row_sel).speed_default +=10
						If (e.scancode = SC_DOWN) 	Then pl(TE_row_sel).speed_default -=10
						If (e.scancode = SC_RIGHT) 	Then pl(TE_row_sel).speed_default +=1
						If (e.scancode = SC_LEFT) 	Then pl(TE_row_sel).speed_default -=1
						if pl(TE_row_sel).speed_default > 100 	then pl(TE_row_sel).speed_default = 100
						if pl(TE_row_sel).speed_default < 0 	then pl(TE_row_sel).speed_default = 0
					case 5
						If (e.scancode = SC_UP) 	Then pl(TE_row_sel).control +=10
						If (e.scancode = SC_DOWN) 	Then pl(TE_row_sel).control -=10
						If (e.scancode = SC_RIGHT) 	Then pl(TE_row_sel).control +=1
						If (e.scancode = SC_LEFT) 	Then pl(TE_row_sel).control -=1
						if pl(TE_row_sel).control > 100 	then pl(TE_row_sel).control = 100
						if pl(TE_row_sel).control < 0 		then pl(TE_row_sel).control = 0
					case 6
						If (e.scancode = SC_UP) 	Then pl(TE_row_sel).pwr_kick +=10
						If (e.scancode = SC_DOWN) 	Then pl(TE_row_sel).pwr_kick -=10
						If (e.scancode = SC_RIGHT) 	Then pl(TE_row_sel).pwr_kick +=1
						If (e.scancode = SC_LEFT) 	Then pl(TE_row_sel).pwr_kick -=1
						if pl(TE_row_sel).pwr_kick > 100 	then pl(TE_row_sel).pwr_kick = 100
						if pl(TE_row_sel).pwr_kick < 0 		then pl(TE_row_sel).pwr_kick = 0
					case 7
						If (e.scancode = SC_UP) 	Then pl(TE_row_sel).pwr_head +=10
						If (e.scancode = SC_DOWN) 	Then pl(TE_row_sel).pwr_head -=10
						If (e.scancode = SC_RIGHT) 	Then pl(TE_row_sel).pwr_head +=1
						If (e.scancode = SC_LEFT) 	Then pl(TE_row_sel).pwr_head -=1
						if pl(TE_row_sel).pwr_head > 100 	then pl(TE_row_sel).pwr_head = 100
						if pl(TE_row_sel).pwr_head < 0 		then pl(TE_row_sel).pwr_head = 0
					case 8
						If (e.scancode = SC_UP) 	Then pl(TE_row_sel).pwr_tackle +=10
						If (e.scancode = SC_DOWN) 	Then pl(TE_row_sel).pwr_tackle -=10
						If (e.scancode = SC_RIGHT) 	Then pl(TE_row_sel).pwr_tackle +=1
						If (e.scancode = SC_LEFT) 	Then pl(TE_row_sel).pwr_tackle -=1
						if pl(TE_row_sel).pwr_tackle > 100 	then pl(TE_row_sel).pwr_tackle = 100
						if pl(TE_row_sel).pwr_tackle < 0 		then pl(TE_row_sel).pwr_tackle = 0
					case 9
						If (e.scancode = SC_UP) 	Then pl(TE_row_sel).pwr_gk +=10
						If (e.scancode = SC_DOWN) 	Then pl(TE_row_sel).pwr_gk -=10
						If (e.scancode = SC_RIGHT) 	Then pl(TE_row_sel).pwr_gk +=1
						If (e.scancode = SC_LEFT) 	Then pl(TE_row_sel).pwr_gk -=1
						if pl(TE_row_sel).pwr_gk > 100 	then pl(TE_row_sel).pwr_gk = 100
						if pl(TE_row_sel).pwr_gk < 0 		then pl(TE_row_sel).pwr_gk = 0
					case 10
						If (e.scancode = SC_UP) 	Then pl(TE_row_sel).precision +=10
						If (e.scancode = SC_DOWN) 	Then pl(TE_row_sel).precision -=10
						If (e.scancode = SC_RIGHT) 	Then pl(TE_row_sel).precision +=1
						If (e.scancode = SC_LEFT) 	Then pl(TE_row_sel).precision -=1
						if pl(TE_row_sel).precision > 100 	then pl(TE_row_sel).precision = 100
						if pl(TE_row_sel).precision < 0 		then pl(TE_row_sel).precision = 0
				end select
			end if
		End Select
	End If
	'limits of selection
	if TE_row_sel > TE_ROWS - 2 then TE_row_sel = TE_ROWS -1
	if TE_row_sel < 0 then TE_row_sel = 0
	if TE_col_sel > TE_COLS - 2 then TE_col_sel = TE_COLS - 1
	if TE_col_sel < 0 then TE_col_sel = 0
	
	'save the file
	if (Save_team) then
		Open "_data/" + Main_Menu_List_Teams(Main_menu_Team_0_selected).id + ".team.csv" For Output As #ff
		for c = 0 to TE_TOT_PLAYERS-1
			'assign values
			Write #ff,  pl(c).number,pl(c).role,pl(c).label,pl(c).skin,_
				   pl(c).speed_default,pl(c).control,pl(c).pwr_kick,_
				   pl(c).pwr_head,pl(c).pwr_tackle,pl(c).pwr_gk,_
				   pl(c).precision
		next c
		Close #ff
		Save_team = 0
		Exit_flag = 1
	end if
End sub


SUB update_ball()
    
    ball.old_x = ball.x
    ball.old_y = ball.y
    'this to desn't allow the ball to become a missile
    if ball.speed > BALL_MAX_SPEED then ball.speed = BALL_MAX_SPEED
    if ball.speed < BALL_MIN_SPEED then ball.speed = 0
    
    ball.z += (ball.z_speed - GRAVITY * M_PIXEL) * Dt
    ball.z_speed -= GRAVITY * M_PIXEL
        
    if (ball.z < 0) then
        ball.z_speed_init *= _
        Pitch_data(Main_menu_pitch_type_selected).bounce_ratio
        ball.z_speed = ball.z_speed_init
        ball.z = 0
		ball.spin = 0
		ball.x_spin = 0
		ball.y_spin = 0
    end if
    if ball.z < 0.5 then
        ball.spin = 0
        ball.z = 0
        ball.speed = ball.speed *_
        Pitch_data(Main_menu_pitch_type_selected).friction_ratio        
    else
        ball.speed = ball.speed * AIR_FRICTION
        'if the ball is owned by human player then update the after effect
        if (PL_ball_owner_id <> -1) then
            if (pl(PL_ball_owner_id).team = 0) then
                get_user_spin()
            end if
        end if
		
    end if
	
	ball.rds += ball.spin/BALL_SPIN_RATIO
    'ball position
    ball.x += cos(ball.rds)*ball.speed * Dt
    ball.y += -sin(ball.rds)*ball.speed * Dt
END SUB

SUB update_camera_position()
    camera.speed = d_b_t_p(camera.x, camera.y, ball.x, ball.y) / CAMERA_EASING_RATIO
    camera.x += cos(_abtp(camera.x, camera.y, ball.x, ball.y))*camera.speed * Dt
    camera.y += -sin(_abtp(camera.x, camera.y, ball.x, ball.y))*camera.speed * Dt
    
    'padding & border limit check
    if (camera.x < PITCH_X + camera.w/2 - CAMERA_X_PADDING) then
        camera.x = PITCH_X + camera.w/2 - CAMERA_X_PADDING
    end if
    if (camera.x > PITCH_X + PITCH_W - camera.w/2 + CAMERA_X_PADDING) then
        camera.x = PITCH_X + PITCH_W - camera.w/2 + CAMERA_X_PADDING
    end if
    if (camera.y > PITCH_Y + PITCH_H - camera.h/2 + CAMERA_Y_PADDING) then
        camera.y = PITCH_Y + PITCH_H - camera.h/2 + CAMERA_Y_PADDING
    end if
    if (camera.y < PITCH_Y + camera.h/2 - CAMERA_Y_PADDING) then
        camera.y = PITCH_Y + camera.h/2 - CAMERA_Y_PADDING
    end if
    'update global variables
    c_x_o = camera.x - camera.w/2
    c_y_o = camera.y - camera.h/2
END SUB

Sub update_main_menu()
	dim e As EVENT
	dim scroll as integer
	dim c as integer
	scroll = 0
	
	for c = 0 to Ubound(Main_Menu_Dimmer)-1
		if abs(Main_Menu_Dimmer(c)) > 0.1 then
			Main_Menu_Dimmer(c) *= MAIN_MENU_DIMMER_EASING
		else
			Main_Menu_Dimmer(c) = 0
		end if
	next c
	
    If (ScreenEvent(@e)) Then
        Select Case e.type
        Case EVENT_KEY_RELEASE
            If (e.scancode = SC_UP) Then
                Main_menu_Item_selected -=1
            End If
            If (e.scancode = SC_DOWN) Then
                Main_menu_Item_selected +=1
            End If
            If (e.scancode = SC_RIGHT) Then
                scroll = 1
                Main_Menu_Dimmer(Main_menu_Item_selected) = 1
            End If
            If (e.scancode = SC_LEFT) Then
                scroll = -1
                Main_Menu_Dimmer(Main_menu_Item_selected) = -1
            End If
            If (e.scancode = SC_F1) Then
                Display_Help = 1 - Display_Help 
            End If
            If (e.scancode = SC_Escape) Then
                Game_section = credits
                Exit_flag = 1
            End If
        End Select
    End If

    If Main_menu_Item_selected > MAIN_MENU_ITEMS_TOTAL _
		Then Main_menu_Item_selected = MAIN_MENU_ITEMS_TOTAL
    If Main_menu_Item_selected < 0 Then Main_menu_Item_selected = 0
    
    Select Case Main_menu_Item_selected
    Case 0
        If scroll = 1 And Main_menu_Team_0_selected < Ubound(Main_Menu_List_Teams)-1 Then
            Main_menu_Team_0_selected +=1
        End If
        If scroll = -1 And Main_menu_Team_0_selected > Lbound(Main_Menu_List_Teams) Then
            Main_menu_Team_0_selected -=1
        End If
    Case 1
        If scroll = 1 And Main_menu_Team_1_selected < Ubound(Main_Menu_List_Teams)-1 Then
            Main_menu_Team_1_selected +=1
        End If
        If scroll = -1 And Main_menu_Team_1_selected > Lbound(Main_Menu_List_Teams) Then
            Main_menu_Team_1_selected -=1
        End If
    Case 2
        If scroll = 1 And Main_menu_pitch_type_selected < Ubound(Pitch_data)-1 Then
            Main_menu_pitch_type_selected +=1
        End If
        If scroll = -1 And Main_menu_pitch_type_selected > Lbound(Pitch_data) Then
            Main_menu_pitch_type_selected -=1
        End If
    Case 3
        If scroll = 1 And Main_menu_mins_selected < Ubound(Main_Menu_List_mins)-1 Then
            Main_menu_mins_selected +=1
        End If
        If scroll = -1 And Main_menu_mins_selected > Lbound(Main_Menu_List_mins) Then
            Main_menu_mins_selected -=1
        End If
    Case 4
        If scroll = 1 And Main_Menu_mode_selected < Ubound(Main_Menu_Mode)-1 Then
            Main_Menu_mode_selected +=1
        End If
        If scroll = -1  And Main_Menu_mode_selected > Lbound(Main_Menu_Mode) Then
            Main_Menu_mode_selected -=1
        End If
    Case 5
        'check if joystick is available
        If scroll = 1 And Main_Menu_control_selected < Ubound(Main_menu_control)-1 and _
        GetJoystick(Joystick.id,Joystick.buttons,Joystick.x,Joystick.y) = 0 Then
            Main_Menu_control_selected +=1
        End If
        If scroll = -1  And Main_Menu_control_selected > Lbound(Main_menu_control) Then
            Main_Menu_control_selected -=1
        End If
    Case 6
        If Multikey(SC_ENTER) Then
            Team(0) = Main_Menu_List_Teams(Main_menu_Team_0_selected)
            Team(1) = Main_Menu_List_Teams(Main_menu_Team_1_selected)
            '---------------
            if Main_Menu_mode_selected then
                Human_control = 1
            else
                Human_control = 0
            end if
            Training_mode = 0
            Exit_flag = 1
            Match_event = resetting_start_position
            Timing.time_diff = Timer
            Game_section = game
        End If
	Case 7
        If Multikey(SC_ENTER) Then
			tct_ed_load_default_tact()
			tct_ed_init_pl_proprietes()
			init_pitch_dimensions(50, 50, 320, 400, _
						Main_menu_pitch_type_selected)
			tct_ed_TILE_W = 320 / 6
			tct_ed_TILE_H = 400 / 6
			
			Exit_flag = 1
			Game_section = Tactic_editor
        End If
    Case 8
        If Multikey(SC_ENTER) Then
			Exit_flag = 1
			Game_section = Team_Editor
        End If
    Case 9
        If Multikey(SC_ENTER) Then
			Exit_flag = 1
			Game_section = Bhv_Editor
        End If
    End Select
    'important! resets to 0 the horizontal scroll of the selected item
    scroll = 0
End Sub
 
sub update_match_event()
    'p is the id of the player selected to perform actions... and the other just watch!
    static p as Integer
    static match_flag as integer ' useful to not perform twice a match_Event
    dim as integer rnd_pl, c
    
    record_ball_position()
    
    'delay check <IMPORTANT!> ---------
    'if more than 0 then -1
    if Match_event_delay then Match_event_delay -=1
    
    'delay check for the Player owner of the ball <IMPORTANT!> ---------
    'if more than 0 then -1
    if PL_ball_owner_id then
        PL_ball_owner_delay -= 1
    else
        PL_ball_owner_delay = PL_DELAY_TIME*2
        PL_ball_owner_id = -1
    end if
    
    select case match_event
		' ##############################################################
		' INTERVAL OF THE MATCH
		' ##############################################################
		' all the players have to go outside the pitch
		case interval
			Timing.play = false
			put_ball_on_centre()
			for c = 0 to Ubound(pl)
				pl(c).rds = _abtp (pl(c).x,pl(c).y, PITCH_X - 100, PITCH_MIDDLE_H)
				pl(c).speed = pl(c).speed_default
				move_player(c)
			next c
			'after some seconds of pause the game restarts
			if Timer - Timing.time_diff > TIME_PAUSE_EVENT then
				Match_event = resetting_start_position
			end if
		' #############################################################
		' BALL IN GAME
		' #############################################################
        case ball_in_game
			Timing.play = true
            store_ball_position() 'store the ball position for free kicks
            check_ball_goals() 'only if the ball is in game, there may be goals
            'check_pl_collisions() 'only with ball in game pl may collide each other
            update_players() ' IMPORTANT
        ' #############################################################
		' PENALTY
		' #############################################################
        case penalty_t0, penalty_t1
			Timing.play = false
            reset_gk_net_position (0,0)
            reset_gk_net_position (11,0)
            if Match_event_delay then
                if Match_event = penalty_t0 then
                    p = get_nrst_pl_ball_free_kick(0)
                else
                    p = get_nrst_pl_ball_free_kick(1)
                end if
                'all have to follow tactic but not the pl(p)
                run_tactic_all_players(p)
                move_all_players()
            else
                if d_b_t_p(pl(p).x, pl(p).y, Ball.x,Ball.y) < 5 then
                    pl(p).action = free_kicker
                    pl(p).x = Ball.x
                    pl(p).y = Ball.y
                    update_players()
                else
                    if Match_event = penalty_t0 then
                        ball.x = PITCH_MIDDLE_W + 2
                        ball.y = PITCH_Y + ((PITCH_H - PITCH_PENALTY_AREA/1.5 - 48) * Team(1).att_dir) + PITCH_PENALTY_AREA/1.5 - 48
                    else
                        ball.x = PITCH_MIDDLE_W + 2
                        ball.y = PITCH_Y + ((PITCH_H - PITCH_PENALTY_AREA/1.5 - 48) * Team(0).att_dir) + PITCH_PENALTY_AREA/1.5 - 48
                    end if
                pl(p).rds = _abtp(pl(p).x, pl(p).y,Ball.x,Ball.y)
                reset_ball_z()
                restore_players_speed()
                'all the players still continue to move themselves
                run_tactic_all_players(p)
                move_all_players()
                end if
            end if
        ' #############################################################
		' THROW IN - BOTH HORIZONTAL SIDES 
		' #############################################################
        case throw_in_lside_t0, throw_in_rside_t0, throw_in_lside_t1, throw_in_rside_t1
            Timing.play = false
            reset_gk_net_position (0,25)
            reset_gk_net_position (11,25)
            if Match_event_delay then
                if Match_event = throw_in_lside_t0 or Match_event = throw_in_rside_t0 then
                    p = get_nrst_pl_ball_free_kick(0)
                else
                    p = get_nrst_pl_ball_free_kick(1)
                end if
                'all have to follow tactic but not the pl(p)
                run_tactic_all_players(p)
                move_all_players()
            else
                if d_b_t_p(pl(p).x, pl(p).y, Ball.x,Ball.y) < 5 then
                    pl(p).action = throw_in
                    pl(p).x = Ball.x
                    pl(p).y = Ball.y
                    update_players()
                else
                    if Match_event = throw_in_lside_t0 or _
                    Match_event = throw_in_lside_t1 then 
                        ball.x = PITCH_X + 5
                        ball.y = Match_event_old_ball_y
                    else
                        ball.x = PITCH_X + PITCH_W - 5
                        ball.y = Match_event_old_ball_y
                    end if
                pl(p).rds = _abtp(pl(p).x, pl(p).y,Ball.x,Ball.y)
                reset_ball_z()
                restore_players_speed()
                'all the players still continue to move themselves
                run_tactic_all_players(p)
                move_all_players()
                end if
            end if
    
        ' #############################################################
		' THROW IN - BOTTOM AND UPPER SIDE
		' #############################################################
		case throw_in_tl_side_t0, throw_in_tl_side_t1, _
			throw_in_tr_side_t0, throw_in_tr_side_t1, _
			throw_in_bl_side_t0, throw_in_bl_side_t1, _
			throw_in_br_side_t0, throw_in_br_side_t1

			Timing.play = false
			
			if 	Match_event = throw_in_tl_side_t0 _
				or Match_event = throw_in_tr_side_t0 _
				or Match_event = throw_in_bl_side_t0 _
				or Match_event = throw_in_br_side_t0 then
				p = 0 'id of gk team 0
			else
				p = 11 'id of gk team 1
			end if
						
			if Match_event_delay then
				run_tactic_all_players(-1)
				move_all_players()
				reset_gk_net_position (0,25)
				reset_gk_net_position (11,25)
			else
				select case Match_event
					case throw_in_tl_side_t0, throw_in_tl_side_t1
						ball.x = PITCH_MIDDLE_W - PITCH_PENALTY_AREA/2
						ball.y = PITCH_Y + PITCH_PENALTY_AREA/4
					case throw_in_tr_side_t0, throw_in_tr_side_t1
						ball.x = PITCH_MIDDLE_W + PITCH_PENALTY_AREA/2
						ball.y = PITCH_Y + PITCH_PENALTY_AREA/4
					case throw_in_bl_side_t0, throw_in_bl_side_t1
						ball.x = PITCH_MIDDLE_W - PITCH_PENALTY_AREA/2
						ball.y = PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/4
					case throw_in_br_side_t0, throw_in_br_side_t1
						ball.x = PITCH_MIDDLE_W + PITCH_PENALTY_AREA/2
						ball.y = PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/4
				end select

				if d_b_t_p(pl(p).x, pl(p).y, Ball.x,Ball.y) < 5 then
					'the gk launches the ball
					shoot_ball  (p, -1,_
								PITCH_MIDDLE_W ,_
								PITCH_MIDDLE_H, 0.75,0)
					'IMPORTANT!
					match_event = ball_in_game
				else
					pl(p).rds = _abtp(pl(p).x, pl(p).y,Ball.x,Ball.y)
					reset_ball_z()
					restore_players_speed()
					'all the players still continue to move themselves
					run_tactic_all_players(-1)
					move_all_players()
				end if
			end if

        ' #############################################################
		' CORNER KICKS
		' #############################################################
		case corner_tl_side_t0, corner_tl_side_t1, _
			corner_tr_side_t0, corner_tr_side_t1, _
			corner_bl_side_t0, corner_bl_side_t1, _
			corner_br_side_t0, corner_br_side_t1

		Timing.play = true
		
		reset_gk_net_position (0,15)
		reset_gk_net_position (11,15)
		
		if Match_event_delay then
			if Match_event = corner_tl_side_t0 or Match_event = corner_tr_side_t0 or _
			Match_event = corner_bl_side_t0 or Match_event = corner_br_side_t0 then
				p = get_nrst_pl_ball_free_kick(0)
			else
				p = get_nrst_pl_ball_free_kick(1)
			end if
			'all have to follow tactic but not the pl(p)
			run_tactic_all_players(p)
			move_all_players()
		else
			select case Match_event
				case corner_tl_side_t0, corner_tl_side_t1
					ball.x = PITCH_X + 7
					ball.y = PITCH_Y + 7
				case corner_tr_side_t0, corner_tr_side_t1
					ball.x = PITCH_X + PITCH_W - 7
					ball.y = PITCH_Y + 7
				case corner_bl_side_t0, corner_bl_side_t1
					ball.x = PITCH_X + 7
					ball.y = PITCH_Y + PITCH_H - 7
				case corner_br_side_t0, corner_br_side_t1
					ball.x = PITCH_X + PITCH_W - 7
					ball.y = PITCH_Y + PITCH_H - 7
			end select
			if d_b_t_p(pl(p).x, pl(p).y, Ball.x,Ball.y) < 5 then
				pl(p).action = free_kicker
				pl(p).x = Ball.x
				pl(p).y = Ball.y
				update_players()
			else
				reset_ball_z()
				pl(p).rds = _abtp(pl(p).x, pl(p).y,Ball.x,Ball.y)
				restore_players_speed()
				'all the players still continue to move themselves
				run_tactic_all_players(p)
				move_all_players()
			end if
		end if
		case gk_t0_owner, gk_t1_owner
			Timing.play = false

			select case Match_event
				case gk_t0_owner
					p = 0
				case gk_t1_owner
					p = 11
			end select
			if Match_event_delay then
				run_tactic_all_players(-1) 'all the players run the tactic
				move_all_players()
				pl(p).speed = 0
			else
				pl(p).action = free_kicker
				update_players()
			end if
		' #############################################################
		' BALL ON CENTRE AT THE BEGINNING  OF THE MATCH OR AFTER A GOAL
		' #############################################################
		case ball_on_centre_t0, ball_on_centre_t1
			Timing.play = false
		
			if Match_event = ball_on_centre_t0 then
				p = get_nrst_pl_ball_free_kick(0)
			else
				p = get_nrst_pl_ball_free_kick(1)
			end if
			
			if d_b_t_p(pl(p).x, pl(p).y, Ball.x,Ball.y) < 5 then
				pl(p).action = free_kicker
				pl(p).x = Ball.x
				pl(p).y = Ball.y
				'accept input from only one player
				update_single_player(p)
			else
				pl(p).speed = pl(p).speed_default
				pl(p).rds = _abtp(pl(p).x, pl(p).y,Ball.x,Ball.y)
				pl(p).action = running
				move_player(p)
			end if
		' #############################################################
		' FOULS
		' #############################################################
		case foul_t0, foul_t1

			Timing.play = false
			reset_gk_net_position (0,15)
			reset_gk_net_position (11,15)
			
			if Match_event_delay then
				if Match_event = foul_t0 then
					p = get_nrst_pl_ball_free_kick(0)
				else
					p = get_nrst_pl_ball_free_kick(1)
				end if
				'all have to follow tactic but not the pl(p)
				run_tactic_all_players(p)
				move_all_players()
			else
				if d_b_t_p(pl(p).x, pl(p).y, Ball.x,Ball.y) < 5 then
					pl(p).action = free_kicker
					pl(p).x = Ball.x
					pl(p).y = Ball.y
					update_players()
				else
					Ball.x = Match_event_old_ball_x
					Ball.y = Match_event_old_ball_y
					reset_ball_z()
					pl(p).rds = _abtp(pl(p).x, pl(p).y,Ball.x,Ball.y)
					restore_players_speed()
					'all the players still continue to move themselves
					run_tactic_all_players(p)
					move_all_players()
				end if
			end if
    
		case presentation
		' #############################################################
		' PLAYERS IN START POSITION
		' #############################################################
		case resetting_start_position
			if Timer - Timing.time_diff > TIME_PAUSE_EVENT*2 then
				if Team(0).kick_off then
					Match_event = ball_on_centre_t0
				else
					Match_event = ball_on_centre_t1
				end if
			end if
			for c = 0 to Ubound(pl) - 1
				if pl(c).role<>"G" then
					reset_player_start_positions(c)
				else
					reset_gk_net_position (0,15)
					reset_gk_net_position (11,15)
				end if
			next c
			move_all_players()
		' #############################################################
		' AFTER-GOAL CELEBRATIONS
		' #############################################################
		case happy_t0, happy_t1
			Timing.play = false
			if Match_event_delay then
				update_ball_on_goal()
			else
				put_ball_on_centre()
				Match_event = resetting_start_position
			end if
	end select
end sub

sub update_bhv_editor()
	dim e As EVENT
	dim as integer c, tile
	Dim ff As Ubyte
    ff = Freefile
	
	If (ScreenEvent(@e)) Then
		Select Case e.type
			Case EVENT_KEY_RELEASE
				If (e.scancode = SC_F1) Then
					Display_Help = 1 - Display_Help 
				End If
				If (e.scancode = SC_ESCAPE) then
					Exit_flag = 1
					BE_select = 1
					Display_Help = 0
				end if
				If (e.scancode = SC_S) then
					Save_bhv = 1
				end if
				'ball tile position update by user
				if BE_select = 0 then
					if (e.scancode = SC_RIGHT) and tct_ed_Ball_Current_Tile + 1 < 36 and (tct_ed_Ball_Current_Tile + 1)mod 6 <>0 then
						tct_ed_Ball_Current_Tile +=1
					end if
					if (e.scancode = SC_LEFT) and tct_ed_Ball_Current_Tile - 1 >= 0 and tct_ed_Ball_Current_Tile mod 6 <>0  then
						tct_ed_Ball_Current_Tile -=1
					end if
					if (e.scancode = SC_UP) and tct_ed_Ball_Current_Tile - 6 >= 0 then
						tct_ed_Ball_Current_Tile -=6
					end if
					if (e.scancode = SC_DOWN) and tct_ed_Ball_Current_Tile + 6 < 36 then
						tct_ed_Ball_Current_Tile +=6
					end if
				end if
				'on enter key access to modify values
				if (e.scancode = SC_ENTER)  then
					BE_select = 1 - BE_select
				end if
				if BE_select then
					if (e.scancode = SC_UP) then
						BE_row_sel -= 1
					end if
					if (e.scancode = SC_DOWN)then
						BE_row_sel += 1
					end if
				end if
		End Select
	End If
	'right and left cursor to increase values
	if BE_row_sel > 9 then BE_row_sel = 9
	if BE_row_sel < 0 then BE_row_sel = 0
	
	if Multikey (SC_RIGHT) and BE_select then
		Bhv_tile_edit_copy(tct_ed_Ball_Current_Tile, BE_row_sel) += 1
	end if
	if Multikey (SC_LEFT) and BE_select then
		Bhv_tile_edit_copy(tct_ed_Ball_Current_Tile, BE_row_sel) -= 1
	end if
	'input value check - not less than 0 or more than 100
	if Bhv_tile_edit_copy(tct_ed_Ball_Current_Tile, BE_row_sel) < 0 then
		Bhv_tile_edit_copy(tct_ed_Ball_Current_Tile, BE_row_sel) = 0
	end if
	if Bhv_tile_edit_copy(tct_ed_Ball_Current_Tile, BE_row_sel) > 100 then
		Bhv_tile_edit_copy(tct_ed_Ball_Current_Tile, BE_row_sel) = 100
	end if
	'correct ratio of % values
	armonize_bhv_values(tct_ed_Ball_Current_Tile)
	
	'save the behaviour file
	if (Save_bhv) then
		Open "_data/bhv.dat" For Output As #ff
			for tile = 0 to TILES_BALL_N
				Write #ff,_
				Bhv_tile_edit_copy(tile, 0),Bhv_tile_edit_copy(tile, 1),_
				Bhv_tile_edit_copy(tile, 2),Bhv_tile_edit_copy(tile, 3),_
				Bhv_tile_edit_copy(tile, 4),Bhv_tile_edit_copy(tile, 5),_
				Bhv_tile_edit_copy(tile, 6),Bhv_tile_edit_copy(tile, 7),_
				Bhv_tile_edit_copy(tile, 8),Bhv_tile_edit_copy(tile, 9)
			next tile
		Close #ff
		Save_bhv = 0
	end if

end sub

SUB update_players()
    dim as Integer c, d
    dim decision as Integer = 0
    dim pl_to_pass as Integer = 0
    dim as single trg_x, trg_y
    
    'the following is a very bad try to give a decent AI to the players
    for c = 0 to Ubound(pl)
        'this is useful for the pl behaviour
        decision = rnd*100
        'this is useful for the sprites
        pl(c).old_x = pl(c).x
        pl(c).old_y = pl(c).y
        
    select case pl(c).action
        case running
            'countdown of the delay
            if pl(c).delay > 1 then
                pl(c).delay -=1
            else
                pl(c).delay = 0
            end if
            
            'goalkeepers routine
            if pl(c).role = "G" then
'                ' if the ball is into the area then the GK runs to the ball
                if is_ball_into_penalty_area (Team(pl(c).team).att_dir) and _
                Cbool(pl(c).delay = 0) and CBool(PL_team_owner_id <> pl(c).team) then
                    pl(c).rds = _abtp(pl(c).x,pl(c).y, ball.x,ball.y)
                    pl(c).speed = pl(c).speed_default
                    ' if the ball is VERY near, 
                    'try to catch the ball jumping on it
                    if d_b_t_p(pl(c).x,pl(c).y, ball.x, ball.y) < 45 and _
                    ball.z < 25 and ball.speed > pl(c).speed_default then
                        pl(c).speed = d_b_t_p(pl(c).x,pl(c).y,_
                                    ball.x+cos(ball.rds)*45,ball.y _
                                    + -sin(ball.rds)*45)*5
                        pl(c).rds = _abtp(pl(c).x,pl(c).y,_
                                    ball.x + cos(ball.rds)*45,_
                                    ball.y + -sin(ball.rds)*45)
                        pl(c).action = gk_jumping
                        pl(c).delay = 15
                        exit select
                    end if
'                    ' if the ball is VERY near... kick away the ball
                    if d_b_t_p(pl(c).x,pl(c).y, ball.x, ball.y) < 1 and _
                    ball.z < 15 then
                        shoot_ball  (c, -1,_
                        PITCH_MIDDLE_W,_
                        PITCH_MIDDLE_H, rnd*PI_2-0.15,0)
                    end if
                'else return to the net
                else
                    'keep running to the net until the distance is more than 5
                    'else keep position
                    reset_gk_net_position (c,25)
                end if
		else
        'routine for other players (defenders, midfielders, attackers)#########
        'if the pl(c) is the nearest to the ball 
        'run to the ball and restore original speed of the player
        
        if get_nrst_pl_ball(pl(c).team) = c and match_event = ball_in_game then
            'Human control
            if Human_control and pl(c).team = 0 then
                'checks if the Human player is pressing some input way key
                get_user_input_action(c)
                if is_pl_input_rds() then
                    pl(c).speed = pl(c).speed_default
                    pl(c).rds = get_pl_input_rds()
                    'if the player doesn't own the ball and is running
                    'to get it - the PC helps him to get the ball
                    'correcting the angle of the player
                    if 	PL_ball_owner_id <> c and _
						abs(cos(pl(c).rds) - cos(_abtp(pl(c).x,pl(c).y,Ball.x, Ball.y))) < PL_FIELD_VIEW_HALF and _
						abs(sin(pl(c).rds) - sin(_abtp(pl(c).x,pl(c).y,Ball.x, Ball.y))) < PL_FIELD_VIEW_HALF then
						pl(c).rds = _abtp(pl(c).x, pl(c).y, Ball.x, Ball.y)
                    end if
                else    
                   pl(c).speed = 0
                end if
                if is_ball_controllable_by_human(c) then
                    reset_ball_z()
                    if PL_ball_owner_id = c then
                    	'ball control
						if is_in_pl_control(c, (pl(c).control * PI_2) / 100, pl(c).pwr_tackle ) then
							'the ball must be close to the player
							ball.x = pl(c).x + cos(ball.rds) * 1
							ball.y = pl(c).y + -sin(ball.rds) * 1
							'easing of the ball control
							ball.rds += get_diff_angle(pl(c).rds, _abtp(pl(c).x, pl(c).y, ball.x, ball.y)) / 2.5
							'updating ball position
							ball.x = pl(c).x + cos(ball.rds) * 5
							ball.y = pl(c).y + -sin(ball.rds) * 5
							ball.speed = pl(c).speed
						end if
                    end if
                    PL_ball_owner_id = c
                    PL_team_owner_id = pl(c).team
                end if
                exit select
            end if
            pl(c).speed = pl(c).speed_default
            pl(c).rds =  _abtp(pl(c).x,pl(c).y, ball.x,ball.y)
            ' try to catch the ball with SLIDING###############################
            if CBool(decision > 95) and is_ball_slidable(c) and CBool(PL_team_owner_id <> pl(c).team) then
                pl(c).speed *= SPEED_RATIO_SLIDING
                pl(c).delay =  20
                pl(c).action = sliding
                continue for
            end if
            'try to hit the ball with HEADKICK################################
            if CBool(decision > 90) and is_ball_headkickable(c) then
                pl(c).speed *= SPEED_RATIO_HEADING
                pl(c).delay = 10
                pl(c).action = jumping
                continue for
            end if
            'if the ball is very near and at the same z level of the pl the
            'pl became owner of the ball
            '#PLAYER OWNER OF THE BALL#
            if d_b_t_p(pl(c).x,pl(c).y, ball.x,ball.y) < 8 and ball.z < 8 _
            and (not pl(c).delay) then
                pl(c).speed = pl(c).speed_default
                PL_team_owner_id = pl(c).team
                PL_ball_owner_id = c
                PL_target_id = -1
                get_pl_behavior(c)
                continue for
            end if
    else
        ' if the pl owns the id that is receiving the ball, him runs to the
        'ball 
        if c = PL_target_id then
            pl(c).rds = _abtp(pl(c).x,pl(c).y, ball.x, ball.y)
        else
            'else runs the tactic
            run_tactic(c)
        end if
    end if
end if

case jumping
    pl(c).speed *= 0.998 'friction of the pl body with the air
    pl(c).delay -= 1
    'if the delay time has passed 
    if pl(c).delay < 1 then
        pl(c).action = running
        pl(c).speed = pl(c).speed_default
        'maybe the pl after the headkick will fall
        if (int(rnd*10)> 5) then
            pl(c).action = falled
            pl(c).active = 0
            'pl(c).delay = PL_DELAY_FALLED
        end if
        pl(c).delay = PL_DELAY_FALLED
    end if
    'Oh yeah, I can headkicking, the ball is so near!
    if (d_b_t_p(pl(c).x,pl(c).y, ball.x,ball.y) < 20 and ball.z < 20 and ball.z > 6) then
        ball.rds = pl(c).rds + (PI/2 - PI/4)
        ball.speed = (pl(c).speed/2) + rnd * 25 + 25
        if (int(rnd*10)> 5) then
            ball.z_speed_init = 12 * M_pixel : ball.z_speed=ball.z_speed_init
        end if
        PL_ball_owner_id = c
        pl(c).speed = pl(c).speed_default
        PL_team_owner_id = pl(c).team
    end if
case sliding
    pl(c).speed *= 0.995 'friction of the pl body with the grass
    pl(c).delay -= 1
    
    for d = 0 to (PL_N_TOT*2-1)
        if d = c or pl(d).active = 0 then continue for 'doesn't check himself obviously :)
        if d_b_t_p (pl(c).x, pl(c).y,pl(d).x, pl(d).y) < PL_MIN_SLIDE_DIST then
            pl(d).active = 0
            pl(d).action = falling
            pl(d).delay = PL_DELAY_FALLING
            pl(c).action = running
            'maybe the REFEREE WHISTLES A FOUL
            
            if 	int(get_diff_angle(pl(c).rds,pl(d).rds)*100) > RND_SLIDE_FOUL and _
				pl(c).team <> pl(d).team then
            
                if pl(c).team = 0 then
                    'if is into penalty area the referee whistles a penalty kick
                   if is_pl_into_opponent_penalty_area (d) then
                        match_event = penalty_t1
                    else
                        match_event = foul_t1    
                   end if
                else
                    if is_pl_into_opponent_penalty_area (d) then
                        match_event = penalty_t0
                   else
                        match_event = foul_t0
                   end if
                end if
                Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
                PL_team_owner_id = -1
                PL_ball_owner_id = -1
                PL_target_id = -1
                'The ball is placed where there was a foul
                Match_event_old_ball_x = pl(d).x
                Match_event_old_ball_y = pl(d).y
                exit sub
            end if
        end if
    next
    
    'if the pl has catched the ball
    if (d_b_t_p(pl(c).x,pl(c).y, ball.x,ball.y) < 10 and ball.z < 4) then
        pl(c).action = running
        pl(c).delay = 0
        pl(c).speed = pl(c).speed_default
        PL_ball_owner_id = c
    end if
    
    if pl(c).delay < 1 then
        pl(c).speed = pl(c).speed_default
        pl(c).delay = 0
        pl(c).action = running
    end if
    
case falling 'falling ... delays and goto falled
    pl(c).speed *=0.9
    pl(c).delay -= 1
    if pl(c).delay < 1 then
        pl(c).action = falled 
        pl(c).delay = PL_DELAY_FALLED
    end if
case falled
    pl(c).delay -= 1
    pl(c).speed = 0
    if pl(c).delay < 1 then
        pl(c).active = 1
        pl(c).action = running
        pl(c).delay = PL_DELAY_FALLED
        pl(c).speed = pl(c).speed_default
    end if
case gk_jumping 'Only for GoalKeeper - Jumping to catch the ball
    pl(c).speed *= 0.98 'friction of the pl body with the air
    pl(c).delay -= 1
    
    'the Gk can touch the ball only if it is near him and into the penalty area
    if Cbool(d_b_t_p(pl(c).x,pl(c).y, ball.x, ball.y) < 15) and Cbool(ball.z < 20) and _
    Cbool(pl(c).active = 1) and is_ball_into_penalty_area (Team(pl(c).team).att_dir) then
        select case decision
        case 0 to pl(c).pwr_gk ' I have a good GoalKeeper! Him catch the ball
            ball.speed = 0
            PL_target_id = -1 ' The GK is not passing to anyone
            PL_ball_owner_id = c ' The pl become the ball owner
            PL_team_owner_id = pl(c).team 'his team is the ball owner
            reset_ball_z()
            ball.x = pl(c).x : ball.y = pl(c).y
            pl(c).action = gk_falled_w_ball
            reset_ball_z()
            Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
            if pl(c).team = 0 then
                match_event = gk_t0_owner
            else
                match_event = gk_t1_owner
            end if
        case pl(c).pwr_gk + 1 to 100 'o yeah! the Gk get away the ball also if him doesnt' catch it
            ball.speed *= 0.85
            ball.z_speed *= 0.8
            ball.z_speed_init = ball.z_speed
            ball.rds = - ball.rds
            PL_target_id = -1 ' The GK is not passing to anyone 
            PL_ball_owner_id = -1 ' The owner of the ball is nobody
            PL_team_owner_id = pl(c).team 'his team is the ball owner
            pl(c).active = 0
            pl(c).delay = 20
        end select
    end if
    if pl(c).delay < 1 then
        pl(c).action = falled
        pl(c).delay = 5
        pl(c).speed = pl(c).speed_default
    end if
case throw_in
    if Human_control and pl(c).team = 0 then
    'checks if the Human player is pressing some input way key
        if is_pl_input_rds() then
            pl(c).rds = get_pl_input_rds()
        end if
        ball.rds = pl(c).rds
        get_user_input_action(c)
        exit select
    else
        shoot_ball  (c, get_nrst_pl_pass(c),_
                    pl(get_nrst_pl_pass(c)).x,_
                    pl(get_nrst_pl_pass(c)).y, 0.75,0)
        pl(c).action = running
        pl(c).speed = pl(c).speed_default
        pl(c).active = 0
        'IMPORTANT!
        match_event = ball_in_game
    end if
case free_kicker
    if Human_control and pl(c).team = 0 then
    'checks if the Human player is pressing some input way key
        if is_pl_input_rds() then
            pl(c).rds = get_pl_input_rds()
        end if
        ball.rds = pl(c).rds
        get_user_input_action(c)
        exit select
    else
        select case Match_event
			   
            case foul_t0, foul_t1
                'if is near to the net then shoon on goal
                if d_b_t_p(pl(c).x, pl(c).y,_
                PITCH_MIDDLE_W, PITCH_Y + PITCH_H * (1 - Team(pl(c).team).att_dir))_
                < PITCH_PENALTY_AREA * 1.5 then
                    ball.rds = find_shoot_angle(c)
                    ball.speed = (35+15*rnd) * M_PIXEL
                    ball.z_speed_init = (10+2*rnd) * M_PIXEL
                    ball.z_speed=ball.z_speed_init
                else
                shoot_ball  (c, get_nrst_pl_pass(c),_
                    pl(get_nrst_pl_pass(c)).x,_
                    pl(get_nrst_pl_pass(c)).y, rnd*1.1,0)
                end if
            case gk_t0_owner, gk_t1_owner
                shoot_ball  (c, -1,_
                    PITCH_MIDDLE_W + (rnd * PITCH_W\2 - rnd * PITCH_W\2),_
                    PITCH_MIDDLE_H + (rnd * PITCH_H\2 - rnd * PITCH_H\2), rnd*1.1,0)
            case penalty_t0, penalty_t1
                ball.rds = find_shoot_angle(c)
                ball.speed = 50 * M_PIXEL
                ball.z_speed_init = 12 * M_PIXEL
                ball.z_speed=ball.z_speed_init
         case corner_tl_side_t0, corner_tl_side_t1, _
            corner_tr_side_t0, corner_tr_side_t1, _
            corner_bl_side_t0, corner_bl_side_t1, _
            corner_br_side_t0, corner_br_side_t1
            shoot_ball  (c, get_nrst_pl_pass(c),_
                    pl(get_nrst_pl_pass(c)).x,_
                    pl(get_nrst_pl_pass(c)).y, 1,0)
            
        end select
        PL_ball_owner_id = c
        PL_team_owner_id = pl(c).team
        pl(c).action = running
        pl(c).speed = pl(c).speed_default
        pl(c).active = 0
        'IMPORTANT!
        match_event = ball_in_game
    end if
case gk_falled_w_ball
    pl(c).speed = 0
    ball.x = pl(c).x : ball.y = pl(c).y
case else
end select
'pl limit check, don't go outside the PITCH
if pl(c).x > PITCH_W + PITCH_X then pl(c).rds = _abtp(pl(c).x, pl(c).y,PITCH_MIDDLE_W,PITCH_MIDDLE_H)
if pl(c).x < PITCH_X then pl(c).rds = _abtp(pl(c).x, pl(c).y,PITCH_MIDDLE_W,PITCH_MIDDLE_H)
if pl(c).y > PITCH_H + PITCH_Y then pl(c).rds = _abtp(pl(c).x, pl(c).y,PITCH_MIDDLE_W,PITCH_MIDDLE_H)
if pl(c).y < PITCH_Y then pl(c).rds = _abtp(pl(c).x, pl(c).y,PITCH_MIDDLE_W,PITCH_MIDDLE_H)

'###IMPORTANT!#####
'update pl position moving him
move_player(c)
next c
END SUB

sub update_single_player(id as integer)
select case pl(id).action
	case free_kicker
		if Human_control and pl(id).team = 0 then
		'checks if the Human player is pressing some input way key
			if is_pl_input_rds() then
				pl(id).rds = get_pl_input_rds()
			end if
			ball.rds = pl(id).rds
			get_user_input_action(id)
			exit select
		else
			select case Match_event
			'when the game restarts from the center of the pitch pass to nearest
				case ball_on_centre_t0, ball_on_centre_t1
					shoot_ball  (id, get_nrst_pl_pass(id),_
					pl(get_nrst_pl_pass(id)).x,_
					pl(get_nrst_pl_pass(id)).y, rnd*1.1,0) 
			end select
			PL_ball_owner_id = id
			PL_team_owner_id = pl(id).team
			pl(id).action = running
			pl(id).speed = pl(id).speed_default
			pl(id).active = 0
			'IMPORTANT!
			match_event = ball_in_game
		end if
end select
end sub

sub tct_ed_draw_ball_grid(px as integer, py as integer, pw as integer, ph as integer)
    dim as integer x, y, x2,y2, col, row, count
    count = 0
    for row = 0 to 5 step 1
        for col = 0 to 5 step 1
            'draw the grid
            x = col * pw \ 6 + px
            y = row * ph \ 6 + py
            x2 = x + pw \ 6
            y2 = y + ph \ 6
            if count = tct_ed_Ball_Current_Tile then
                line (x,y)-(x2,y2),rgb(200,200,200),b
                PUT (x + pw\ 12 - 4,y + ph \ 12 - 4), ball_sprite(12), trans
            end if
            'check if the ball is into a box of the grid and fill it using paint function
            count +=1
        next col
    next row
end sub

sub tct_ed_draw_pitch(px as integer, py as integer, pw as integer, ph as integer)
    dim as Integer pitch_rows, pitch_cols, a, b
    pitch_rows = ph \ 32 
    pitch_cols = pw \ 32 
    'drawing the grass
    for a = 0 to pitch_rows -1
        for b = 0 to pitch_cols -1
           PUT (px + (b*32), py  + (a*32)),pitch_sprite(0),Pset
        next b
    next a
END SUB

sub tct_ed_draw_pl_grid(px as integer, py as integer, pw as integer, ph as integer)
    dim as integer x, y, x2,y2, col, row, count, c, tl
    count = 0
    for row = 0 to 15 step 1
        for col = 0 to 15 step 1
            'draw the grid
            x = col * pw \ 16 + px 
            y = row * ph \ 16 + px
            x2 = x + pw \ 16
            y2 = y + ph \ 16
            line (x,y)-(x2,y2),rgb(125,125,125),b, &b0001000100010001
            if  tct_ed_mouse.x > x and tct_ed_mouse.x <= x2 _
                and tct_ed_mouse.y > y and tct_ed_mouse.y <= y2 then
                line (x,y)-(x2,y2),&hFFFFFF,b
                draw string (x,y), hex(count)
                tct_ed_Pl_Current_Tile = count
            end if
            count +=1
        next col
    next row
end sub

sub tct_ed_load_default_tact()
    'the "tct_tile" array indicates in wich tile the player must be with corresponding
    'ball position. For example: ball in tile 0 -> read from tct_tile(0) = player in tile 1
    Dim ff As UByte
    dim as integer slot, c, tl
    dim path as string*32
    ff = FreeFile
    
    for slot = 0 to 9
        path = "_data/" + tct_ed_tct_tile_label(slot) +".tac"
        Open path For input As #ff
        for c = 0 to 9
            for tl = 0 to 35
                Input #ff, tct_ed_tct_tile(slot,c,tl)
            next tl
        next c
        Close #ff
    next slot
END SUB

sub tct_ed_draw_players()
    dim c as integer
    For c = 0 To 9
        if c = tct_ed_Pl_Selected and Timer*7 mod 2 = 0 then
            Circle (tct_ed_pl(c).x, tct_ed_pl(c).y),12, &h3F9E4F,,,,F
        end if
            Circle (tct_ed_pl(c).x, tct_ed_pl(c).y),8, &h073C10,,,,F
        PUT (tct_ed_pl(c).x-13,tct_ed_pl(c).y-40),Pl_tact_sprite, trans
        PrintFont tct_ed_pl(c).x-5,tct_ed_pl(c).y-20, str(c + 2), SmallFont, 1, 1
    Next c
END SUB


sub tct_ed_key_input_listener()

    'ball tile position update by user
    if MULTIKEY(SC_RIGHT) and tct_ed_Ball_Current_Tile + 1 < 36 and (tct_ed_Ball_Current_Tile + 1)mod 6 <>0 then
        tct_ed_Ball_Current_Tile +=1
    end if
    if MULTIKEY(SC_LEFT) and tct_ed_Ball_Current_Tile - 1 >= 0 and tct_ed_Ball_Current_Tile mod 6 <>0  then
		tct_ed_Ball_Current_Tile -=1
    end if
    if MULTIKEY(SC_UP) and tct_ed_Ball_Current_Tile - 6 >= 0 then
        tct_ed_Ball_Current_Tile -=6
    end if
    if MULTIKEY(SC_DOWN) and tct_ed_Ball_Current_Tile + 6 < 36 then
        tct_ed_Ball_Current_Tile +=6
    end if
    'pl selected updated by user
    tct_ed_mouse.res = GetMouse( tct_ed_mouse.x, tct_ed_mouse.y, tct_ed_mouse.wheel, tct_ed_mouse.buttons, tct_ed_mouse.clip)
    tct_ed_mouse.diff_wheel = tct_ed_mouse.old_wheel - tct_ed_mouse.wheel
    tct_ed_mouse.old_wheel = tct_ed_mouse.wheel
    tct_ed_Pl_Selected = tct_ed_Pl_Selected + tct_ed_mouse.diff_wheel
    if tct_ed_Pl_Selected < 0 then tct_ed_Pl_Selected = 0
    if tct_ed_Pl_Selected > 9 then tct_ed_Pl_Selected = 9
    'on clik refresh the field
    if tct_ed_mouse.buttons = 1 then tct_ed_tct_tile(tct_ed_Tactic_slot, tct_ed_Pl_selected, tct_ed_Ball_Current_Tile) = tct_ed_Pl_Current_Tile
    'tactic slot selected updated by user
    if MULTIKEY(SC_0) then tct_ed_Tactic_slot = 0
    if MULTIKEY(SC_1) then tct_ed_Tactic_slot = 1
    if MULTIKEY(SC_2) then tct_ed_Tactic_slot = 2
    if MULTIKEY(SC_3) then tct_ed_Tactic_slot = 3
    if MULTIKEY(SC_4) then tct_ed_Tactic_slot = 4
    if MULTIKEY(SC_5) then tct_ed_Tactic_slot = 5
    if MULTIKEY(SC_6) then tct_ed_Tactic_slot = 6
    if MULTIKEY(SC_7) then tct_ed_Tactic_slot = 7
    if MULTIKEY(SC_8) then tct_ed_Tactic_slot = 8
    if MULTIKEY(SC_9) then tct_ed_Tactic_slot = 9
    
    'copy and paste pl postion along the ball tiles
    if MULTIKEY(SC_C) and MULTIKEY(SC_CONTROL) then tct_ed_pos_copy():tct_ed_Has_copyed = 1
    if MULTIKEY(SC_V) and MULTIKEY(SC_CONTROL) then tct_ed_pos_paste()
    
END SUB

sub tct_ed_save_data(slot_to_save as integer)
    Dim path as String
    Dim ff As UByte
    dim as integer slot, c, tl
    ff = FreeFile
    'save all tactics
    if slot_to_save = -1 then
        for slot = 0 to 9
            path = "_data/" + tct_ed_tct_tile_label(slot) + ".tac"
            Open path For Output As #ff
            for c = 0 to 9
                for tl = 0 to 35
                    Write #ff, tct_ed_tct_tile(slot,c, tl)
                next tl
            next c
            Close #ff
        next slot
    'save only the selected tactics
    else
        path = "_data/" + tct_ed_tct_tile_label(tct_ed_tactic_slot) + ".tac"
        Open path For Output As #ff
        for c = 0 to 9
            for tl = 0 to 35
                Write #ff, tct_ed_tct_tile(tct_ed_tactic_slot,c, tl)
            next tl
        next c
        Close #ff
   end if
END SUB

sub tct_ed_update_pl_on_tact_tile()
    dim as single x_trg, y_trg
    dim as integer id, tile_row, tile_col, tile, c

    'routine for all players
    
    for c = 0 to 9
        'get the right tile to reach
        tile = tct_ed_tct_tile(tct_ed_Tactic_slot, c,tct_ed_Ball_Current_Tile)
        'get the row and the column
        tile_row = tile MOD 16
        tile_col = 16-int(tile\16)
        'convert in xy coords
        x_trg = (tile_row * Pitch_data(0).w\16) + Pitch_data(0).x + Pitch_data(0).w\32
        y_trg = Pitch_data(0).h - (tile_col * Pitch_data(0).h\16) + Pitch_data(0).h\16 
        'returns te right rds to the tile
        tct_ed_pl(c).rds = _abtp (tct_ed_pl(c).x,tct_ed_pl(c).y,x_trg,y_trg)
        'if the distance is less than 5 then the pl has reached the position
        if d_b_t_p(pl(c).x,pl(c).y,x_trg,y_trg) < 5 then
            tct_ed_pl(c).speed = 0
            tct_ed_pl(c).x = x_trg
            tct_ed_pl(c).y = y_trg
        else
            tct_ed_pl(c).speed = d_b_t_p(tct_ed_pl(c).x,tct_ed_pl(c).y,x_trg,y_trg) / 4
            'update the pl position moving him
            tct_ed_pl(c).x +=  cos(tct_ed_pl(c).rds) * tct_ed_pl(c).speed 
            tct_ed_pl(c).y +=  -sin(tct_ed_pl(c).rds) * tct_ed_pl(c).speed
        end if
    next c
END SUB

sub tct_ed_init_pl_proprietes()
    dim c as integer
    for c = 0 to 9
        tct_ed_pl(c).x = Pitch_data(0).x + Pitch_data(0).w\2
        tct_ed_pl(c).y = Pitch_data(0).y + Pitch_data(0).h\2
        tct_ed_pl(c).speed = 15
        tct_ed_pl(c).rds = 0
    next c
END SUB

sub tct_ed_pos_copy()
    dim c as integer
    for c = 0 to 9
        tct_ed_copypaste(c) = tct_ed_tct_tile(tct_ed_Tactic_slot, c,tct_ed_Ball_Current_Tile)
    next c
END SUB

sub tct_ed_pos_paste()
    dim c as integer
    if tct_ed_Has_copyed then
        for c = 0 to 9
            tct_ed_tct_tile(tct_ed_Tactic_slot, c,tct_ed_Ball_Current_Tile) = tct_ed_copypaste(c) 
        next c
    end if
END SUB

sub tct_ed_print_tact_data()

	dim as integer c, w, h, offset_txt_x
    w = 300
    h = 22
	offset_txt_x = Pitch_data(0).x + Pitch_data(0).w + 16
	
	draw_button 	(0, SCREEN_H - 60, SCREEN_W, 30, _
					"TACTIC EDITOR", C_WHITE, C_DARK_BLUE,0,0)

	draw_button 	(0, SCREEN_H - 30, SCREEN_W, 30, _
					"PRESS S to SAVE DATA",_
					C_WHITE, C_DARK_RED,0,0)
	
    
    dim instructions(9) as string = { 	"CURSOR KEYS - Move the ball", _
										"MOUSE WHEEL - Select previous/next player", _
										"MOUSE CLICK - Set new tile for the player", _
										"KEYS [0-9]  - Select a Tactic Slot", _
										"CTRL + C    - Copy Pl pos. on Clipboard", _
										"CTRL + V    - Paste Pl pos. from Clipboard", _
										"S           - Save current Tactic Slot", _
										"A           - Save all Tactic Slots", _
										"ESC         - Back to Main Menu", _
										"Attack direction is top-down"}
									   
    draw_button (offset_txt_x, 50, w, h, "Tactic Name     " + str(tct_tile_label(tct_ed_Tactic_slot)), C_WHITE, C_GRAY, 0, C_YELLOW)
    draw_button (offset_txt_x, 80, w, h, "Tactic Slot     " + str(tct_ed_Tactic_slot), C_WHITE, C_GRAY, 0, C_YELLOW)
    draw_button (offset_txt_x, 110, w, h, "Player Tile      " + hex(tct_ed_Pl_Current_Tile), C_WHITE, C_GRAY, 0, C_YELLOW)
    draw_button (offset_txt_x, 140, w, h, "Ball Tile       " + str(tct_ed_Ball_Current_Tile), C_WHITE, C_GRAY, 0, C_YELLOW)
    draw_button (offset_txt_x, 170, w, h, "Player Sel. (id)" + str(tct_ed_Pl_Selected), C_WHITE, C_GRAY, 0, C_YELLOW)

    ' draw instructions
    for c = 0 to Ubound(instructions) - 1
		draw string (Pitch_data(0).x, Pitch_data(0).y + Pitch_data(0).h + 10 + c * 10), instructions(c), C_GRAY
    next c
    'draw current selected tactic
    for c = 0 to 9
		draw_button (	SCREEN_W - 140, 20 + c*h, 120, h, str(c) + " : " + str(tct_tile_label(c)),_
						C_GRAY, C_BLUE, is_equal(c, tct_ed_Tactic_slot), C_YELLOW)
    next c
    'display confirm if the tacitc has been correctly saved
    if tct_ed_Has_Saved then
		draw_button (	SCREEN_W - 400, SCREEN_H - 30, 380, 20, "DATA SUCCESSFULLY SAVED",_
						C_GRAY, C_RED, 0, C_YELLOW)
        if timer - tct_ed_Has_saved_display_time > 3 then tct_ed_Has_Saved = 0
    end if
    
        'context-help
    if (Display_Help) then
		draw_whole_screen_shadowed()
		print_whole_array(UM_txt_tactic_editor(),20,20)
	end if
    
END SUB




