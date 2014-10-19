'SUBS DECLARATIONS-----------------------------------------------------------------------
'load into an aray the teams data for the main menu
Declare Sub Load_teams_list()
'gets user input along the main menu
Declare Sub Update_main_menu()
'draw on screen the main menu
Declare Sub Draw_main_menu()
'draw and update the main menu
DECLARE SUB display_menu()
'load fonts
DECLARE SUB load_fonts()
'load the pitchs variables
DECLARE SUB load_pitch_data()
'load tactics
DECLARE SUB load_tact()
'load behavior of the player owner of the ball
DECLARE SUB load_behavior()
'get user input to control the direction of the player 
'DECLARE SUB get_user_input_ways(c as integer)
'load sprites
DECLARE SUB load_bitmap()
'paints the kits of the teams with a custom color - and also the color of the skin of
'the players
DECLARE SUB paint_kits(C_shirt_0 as Integer, C_pants_0 as Integer, C_socks_0 as Integer, _
C_shirt_1 as Integer, C_pants_1 as Integer, C_socks_1 as Integer)
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
'draws the players
DECLARE SUB draw_players()
'resets the position of the players (0's ids on the left side, 1's ids on the right side)
DECLARE SUB reset_players_positions()
'puts the ball into the centre of the pitch
DECLARE SUB put_ball_on_centre()
' update the beahovior of the players
DECLARE SUB update_players()
' checks if the ball gest the limits of the pitch
' or if the ball goes into any net
DECLARE SUB check_ball_border_pitch_limit()
'updates the position of the camera following the ball with easing effect
DECLARE SUB update_camera_position()
'initialize the players proprietes
DECLARE SUB init_players_proprietes()
'sets to 0 axis z of the ball and z_Speed of the ball
DECLARE SUB reset_ball_z()
'display the match on the screen *** IMPORTANT!
DECLARE SUB display_match()
'draws the ball
DECLARE SUB draw_ball()
'draws the lines of the pitch
DECLARE SUB draw_pitch_lines()
'giving the id of the player who owns the ball, calculate in wich tile is,
'it manages the player behavior (for example: running to the net, passing, shooting, etc...)
DECLARE SUB get_pl_behavior(pl_id as Integer)
'checks if two or more players collide
DECLARE SUB check_pl_collisions()
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


sub draw_arrow(x as single, y as single, rds as single, a_l as single, cl as Uinteger)
    line (x, y)-(x + a_l * cos(rds), y + a_l *  -sin(rds)),cl
    line (x + a_l * cos(rds), y + a_l *  -sin(rds))-(x + a_l/2 * cos(rds-0.5), y + a_l/2 *  -sin(rds-0.5)),cl
    line (x + a_l * cos(rds), y + a_l *  -sin(rds))-(x + a_l/2 * cos(rds+0.5), y + a_l/2 *  -sin(rds+0.5)),cl
end sub

SUB check_ball_limits()
    'border pitch limit check
    dim as integer is_ball_out = 0
    
    if (ball.x > PITCH_X+PITCH_W+CAMERA_PADDING) THEN
        ball.x = PITCH_X+PITCH_W+CAMERA_PADDING-5
        ball.rds = PI - ball.rds
        ball.speed *= 0.3:ball.z_speed *= 0.5
    END IF
    if (ball.x < PITCH_X - CAMERA_PADDING) THEN
        ball.x = PITCH_X - CAMERA_PADDING + 5
        ball.rds = PI - ball.rds
        ball.speed *= 0.3:ball.z_speed *= 0.5
    END IF
    if (ball.y > PITCH_Y + PITCH_H + CAMERA_PADDING) THEN
        ball.y = PITCH_Y + PITCH_H + CAMERA_PADDING - 5
        ball.rds = PI_DOUBLE - ball.rds
        ball.speed *= 0.3:ball.z_speed *= 0.5
    END IF
    if (ball.y <  PITCH_Y - CAMERA_PADDING ) THEN
        ball.y = PITCH_Y - CAMERA_PADDING + 5
        ball.rds = PI_DOUBLE - ball.rds
        ball.speed *= 0.3
        ball.z_speed *= 0.5
    END IF
    
END SUB

SUB check_ball_goals()
    'first of all, checks if the ball goes into any net
    if is_goal(0) or is_goal(1) then
        if is_goal(0) + Team(0).att_dir > 1 then
            Team(0).goal += 1
            match_event = happy_t0
        else
            Team(1).goal += 1
            match_event = happy_t1
        end if
        match_event_delay = MATCH_EVENT_DEFAULT_DELAY*2
        camera.speed = 0
        PL_ball_owner_id = -1
    else
        'check if the ball goes outside the pitch
        check_throw_in_corner_kick() 
    end if
END SUB

SUB update_ball_on_goal()
    dim as integer is_hitting_net = 0
    if (ball.x < PITCH_NET_L_WOOD) or (ball.x > PITCH_NET_R_WOOD) then
        is_hitting_net = 1
        ball.rds = PI - ball.rds
    end if
    if  (ball.y < PITCH_NET_TOP_Y - PITCH_NET_DEPTH) or _
        (ball.y > PITCH_NET_BOTTOM_Y + PITCH_NET_DEPTH) then
        is_hitting_net = 1
        ball.rds = PI_DOUBLE - ball.rds   
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
		'ball.rds = _abtp (ball.x, ball.y, ball.x + -cos(ball.x)*PITCH_NET_WOOD_RADIUS, ball.y)
        ball.x += 1 + PITCH_NET_WOOD_RADIUS * cos(ball.rds) 
		ball.y += 1 + PITCH_NET_WOOD_RADIUS * -sin(ball.rds)
        ball.spin = 0
	end if
END SUB

SUB check_bitmap()
    dim as Integer img_x = 0
    dim as Integer img_y = 0
    dim as Integer count = 0 
    
    screenlock ' Lock the screen
    screenset workpage, workpage xor 1 ' Swap work pages.
    img_x = 0
    img_y = 0
    cls
    for count = 0 to PL_SPRITES_TOT_N - 1
        if (count > 0) and (count MOD 21 = 0) then
            img_x = 0
            img_y += 20
        end if
        PUT (img_x,img_y), pl_sprite_0(count),trans
        PUT (img_x,img_y), pl_sprite_1(count),trans
        draw string (img_x,img_y), str(count)
        img_x += 56
    next count
    workpage xor = 1 ' Swap work pages.
    flip
    screenunlock ' Unlock the page to display what has been drawn on the screen
    sleep 2000
'    
'    for count = 0 to PL_SPRITES_TOT_N - 1
'        if (count > 0) and (count MOD 21 = 0) then
'            img_x = 0
'            img_y += 20
'        end if
'        PUT (img_x,img_y), gk_sprite(count),trans
'        draw string (img_x,img_y), str(count)
'        img_x += 28
'    next count
'    workpage xor = 1 ' Swap work pages.
'    flip
'    screenunlock ' Unlock the page to display what has been drawn on the screen
'    sleep 1000
    
    
END SUB

SUB check_pl_collisions()
    Dim as Integer c, d
    'check each pl
    for c = 0 to (PL_N_TOT*2-1)
        'check collision only if the interested pllayers are int the crop view
        if is_in_camera_crop (pl(c).x, pl(c).y, 64) then
            for d  = 0 to (PL_N_TOT*2-1)
                if d = c or pl(c).active = 0 then continue for 'doesn't check himself obviously :)
                if d_b_t_p (pl(c).x, pl(c).y,pl(d).x, pl(d).y) < PL_MIN_DIST then
                    'some fighting betweeen two players
                    pl(d).x = pl(d).old_x + PL_MIN_DIST/2 - (rnd*PL_MIN_DIST)
                    pl(d).y = pl(d).old_y + PL_MIN_DIST/2 - (rnd*PL_MIN_DIST)
                    
                    'also with running fighting one of the pl may fall
                    if int(rnd*100) < RND_CONTACT_FALL then
                        pl(c).active = 0
                        pl(c).action = falling
                        pl(c).delay = PL_DELAY_FALLING
                        continue for, for
                    end if
                    continue for, for
                end if
            next d
        end if
    next c
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
        select case PL_team_owner_id
        case 0
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = throw_in_tl_side_t1
            else
                Match_event = throw_in_tr_side_t1
            end if
        case 1
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = corner_tl_side_t0
            else
                Match_event = corner_tr_side_t0
            end if
        end select
        Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        PL_team_owner_id = -1
        PL_ball_owner_id = -1
    end if
    'throw in bside check
    if Ball.y > PITCH_Y + PITCH_H + 1 then
        select case PL_team_owner_id
        case 0
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = corner_bl_side_t1
            else
                Match_event = corner_br_side_t1
            end if
        case 1
            if Ball.x < PITCH_MIDDLE_W then
                Match_event = throw_in_bl_side_t0
            else
                Match_event = throw_in_br_side_t0
            end if
        end select
        Match_event_delay = MATCH_EVENT_DEFAULT_DELAY
        PL_team_owner_id = -1
        PL_ball_owner_id = -1
    end if
END SUB

SUB delete_bitmap()
    dim count as Integer
    For count = 0 To PL_SPRITES_TOT_N - 1
        If pl_sprite_0(count) Then ImageDestroy pl_sprite_0(count)
        If pl_sprite_1(count) Then ImageDestroy pl_sprite_1(count)
    Next
    For count = 0 To 14
        If ball_sprite(count) Then ImageDestroy ball_sprite(count)
    Next
    If net_sprite(0)   Then ImageDestroy net_sprite(0)
    If net_sprite(1)   Then ImageDestroy net_sprite(1)
    If pitch_sprite(0) Then ImageDestroy pitch_sprite(0)
    If pitch_sprite(1) Then ImageDestroy pitch_sprite(1)
    If banner_sprite   Then ImageDestroy banner_sprite
    If Wallpaper(0) Then ImageDestroy Wallpaper(0)
    If Wallpaper(1) Then ImageDestroy Wallpaper(1)
    If Wallpaper(2) Then ImageDestroy Wallpaper(2)
END SUB

SUB display_menu()
	DO
		update_main_menu()
		Screensync
		Screenlock ' Lock the screen
		Screenset workpage, workpage xor 1 ' Swap work pages.
		Cls
		draw_main_menu()
		workpage xor = 1 ' Swap work pages.
		'locate 10,10 : print str(get_ball_tile())
		Screenunlock
		SLEEP SLEEP_TIME, 1
	LOOP UNTIL Exit_flag = 1
	Exit_flag = 0
END SUB

SUB display_match()
	DO
		If InKey = Chr(255,107) Then Exit Do 'if the user clicks the X button on the window then ... bye bye JASC
		update_match_event()
		check_ball_woods()
		check_ball_limits()
		update_ball()
		get_user_input()
		update_camera_position()
		
		Timing.time_current = Timer
		Dt = Timing.time_current - Timing.time_last
		'' Fix frame-skipping by limiting the value of our dt
		'' to the maximum of FIXED_TIME_STEP
		if( Dt > FIXED_TIME_STEP ) then
			Dt = FIXED_TIME_STEP
			screensync
		else
			screensync 'wait for vsync
			'graphic output
			screenlock ' Lock the screen
			screenset workpage, workpage xor 1 ' Swap work pages.
			draw_pitch()
			draw_pitch_lines()
			draw_debug()
			draw_top_net()
			draw_players()
			draw_bottom_net()
			draw_bottom_info()
			workpage xor = 1 ' Swap work pages.
			screenunlock ' Unlock the page to display what has been drawn on the screen
		end if
		if Timer - Timing.time_start > 1 then
			Timing.actual_fps = Timing.fps
			Timing.fps = 0
			Timing.time_start = Timer
			Timing.seconds_elapsed +=1
		else
			Timing.fps +=1
		end if
		if int(90/Timing.secs_to_play*Timing.seconds_elapsed)>90 + Timing.injury_time then Exit_flag = 1
		Timing.time_last = Timing.time_current
	LOOP UNTIL MULTIKEY(SC_ESCAPE) or Exit_flag = 1
END SUB

SUB draw_aknowledgements()
	#define AKN_MAX_LINES 50
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
	LOOP UNTIL MULTIKEY(SC_J)
END SUB

SUB draw_ball()
    dim offset_frame as Integer
    dim x as Integer
    
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

SUB draw_bottom_info()
    dim d as Integer
    
    for d = 0 to int (SCREEN_W / 32) +1 
        PUT (32*d, SCREEN_H-32), shadowed_sprite, trans
    next
    
    
    if Match_event_delay then
        for d = 8 to int (SCREEN_W / 32) +1 
            PUT (32*d, SCREEN_H\2 - 6), shadowed_sprite, trans
        next
        PrintFont SCREEN_W \ 2, SCREEN_H \ 2, str(Team(0).label) + " " + str(Team(0).goal) + _
        " : " + str(Team(1).goal) + " " + str(Team(1).label), UniFont, 1, 1
        PrintFont SCREEN_W \ 2, SCREEN_H \ 2 + 36, "Match_Event " + print_match_event(Match_event), SmallFont, 1, 1
    end if
    draw string (SCREEN_W - 50,SCREEN_H - 20), str(Timing.actual_fps) + " Fps", C_WHITE
    
    PrintFont SCREEN_W - 70, 20, "Mins " + str(int(90/Timing.secs_to_play*Timing.seconds_elapsed)), UniFont, 1, 1
    
    
END SUB

SUB draw_bottom_net()
    
    PUT (PITCH_MIDDLE_W - 53 - c_x_o, PITCH_Y + PITCH_H - 28 - c_y_o ), net_sprite(1), trans
    
end sub

SUB draw_debug()
    dim as integer c
    static frame as integer
    'if clausole IMPORTANT!
    if PL_ball_owner_id > -1 then
        'Draw String 
        PrintFont 20, 20, pl(PL_ball_owner_id).label, UniFont, 1, 1
        PrintFont 20, 38, SHELL_Message, SmallFont, 1, 1
   end if

    
    if (DEBUG) then
        draw_grid()
        
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
        
        
        if get_pl_to_pass(Pl_ball_owner_id) then
            line (pl(get_nrst_pl_ball(0)).x-c_x_o, pl(get_nrst_pl_ball(0)).y-c_y_o)-_
            (pl(get_pl_to_pass(Pl_ball_owner_id)).x-c_x_o,pl(get_pl_to_pass(Pl_ball_owner_id)).y-c_y_o), RGB(255,255,0)
        end if
        
        circle (Match_event_old_ball_x - C_x_o, Match_event_old_ball_y - C_y_o), 20, C_WHITE

        for c = 0 to PL_N_TOT * 2 - 1
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
    
        for c = 0 to Ubound(pl)-1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o, "NUM: " +str(pl(c).number), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+6, "LBL: " +str(pl(c).label), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+12, "ID: " + str(pl(c).id), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+18, "ROL: " + str(pl(c).role), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+24, "ACT: " + str(print_pl_action(pl(c).action)), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+30, "DLY: " + str(pl(c).delay), SmallFont, 1, 1
            PrintFont pl(c).x-c_x_o+DBG_TXT_OFFSET, pl(c).y-c_y_o+36, "TID: " + str(pl(c).tct_id), SmallFont, 1, 1
        next c
        
        PrintFont DBG_TXT_OFFSET, 6,  "Team(0).label: " + str(Team(0).label) + _
                                    " - Team(1).label: " + str(Team(1).label), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 12, "PL_Team_owner_id: " + str(PL_team_owner_id), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 18, "Ball Spin: " + str(Ball.spin), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 24, "Team(0).att_dir: " + str(Team(0).att_dir), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 30, "Team(1).att_dir: " + str(Team(1).att_dir), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 36, "Match_event_delay: " + str(Match_event_delay), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 42, "Match Event: " + str(print_match_event(Match_Event)), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 48, "Match_event_last_tile: " + str(Match_event_last_tile), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 54, "Dt: " + str(Dt), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 60, "PL_ball_owner_delay: " + str(PL_ball_owner_delay), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 66, "PL_target_id: " + str(PL_target_id), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 72, "PL_ball_owner_id: " + str(PL_ball_owner_id), SmallFont, 1, 1
        PrintFont DBG_TXT_OFFSET, 78, "PL_team_owner_id: " + str(PL_team_owner_id), SmallFont, 1, 1
        'display ball traectory
        frame +=1
        for frame = 0 to BALL_FRAMES_RECORD - 1
            pset (Ball_record(frame).x -c_x_o, Ball_record(frame).y - c_y_o)
        next frame
        if frame > BALL_FRAMES_RECORD - 1 then frame = 0
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
        '-----------------------------------------------------
         
    end if
end SUB

SUB draw_grid()
    dim as integer x, y, x2,y2, col, row, count
    count = 0
    for row = 0 to ROW_TOT_N -1 step 1
        for col = 0 to COL_TOT_N -1 step 1
            'draw the grid
            x = col * PITCH_W \ COL_TOT_N + PITCH_X 
            y = row * PITCH_H \ ROW_TOT_N + PITCH_Y
            x2 = x + PITCH_W \ COL_TOT_N
            y2 = y + PITCH_H \ ROW_TOT_N
            line (x-c_x_o,y-c_y_o)-(x2-c_x_o,y2-c_y_o),C_GRAY,b 
            draw string (x+ 30-c_x_o,y+5-c_y_o), str(TILES_BALL_N - count) + ":" + str(count), C_GRAY
            'check if the ball is into a box of the grid and fill it using paint function
            if (ball.x > x) and (ball.x < x2) and (ball.y>y) and (ball.y < y2) then
                paint (ball.x-c_x_o, ball.y-c_y_o),C_DARK_GREEN,C_GRAY
                draw string (x+ 30-c_x_o,y+5-c_y_o), str(get_ball_tile(team(0).att_dir)) + ":" + _
                                                  str(get_ball_tile(team(1).att_dir)), C_WHITE
            end if
            count +=1
        next col
    next row
    if is_ball_into_penalty_area (0) then
        circle (ball.x - c_x_o, ball.y - c_y_o), 16, C_RED,,,,F
    end if
    if is_ball_into_penalty_area (1) then
        circle (ball.x - c_x_o, ball.y - c_y_o), 16, C_BLUE,,,,F
    end if
END SUB

SUB draw_intro()
    
END SUB

Sub Draw_main_menu()
    
    Dim a As Integer
    Dim top_margin as integer = 80
    'graphic statements
    'wallpaper
    PUT (0, 0), Wallpaper(1),pset
    for a = 0 to int (SCREEN_W \ 32) +1 
        PUT (32*a, 0), shadowed_sprite, trans
        PUT (32*a, SCREEN_H - 32), shadowed_sprite, trans
    next
    
    PrintFont SCREEN_W\2 - len(str(GAME_NAME + " " + GAME_VERSION + " by " + GAME_AUTHOR))*5, 16,_
    str(GAME_NAME + " " + GAME_VERSION + " by " + GAME_AUTHOR), Unifont, 1, 1 
    
    For a = 0 To 6
        Line (SCREEN_W\2 - 100,a*30 + 75)-(SCREEN_W\2 + 100,a*30 + 100),Rgb(63,0,0),BF
        If a = Main_menu_Item_selected Then
            Line (SCREEN_W\2 - 100,a*30 + 75)-(SCREEN_W\2 + 100,a*30 + 100),Rgb(127,0,0),BF
            Line (SCREEN_W\2 - 100,a*30 + 75)-(SCREEN_W\2 + 100,a*30 + 100),Rgb(255,0,0),B
        End If
        Select Case a
        Case 0
            PrintFont SCREEN_W\2 - len(Main_Menu_List_Teams(Main_menu_Team_0_selected).label)*4,_
            a*30 + top_margin,_
            str(Main_Menu_List_Teams(Main_menu_Team_0_selected).label), UniFont, 1,1
            'left & right menu arrows
            If a = Main_menu_Item_selected Then
                if Main_menu_Team_0_selected > lbound(Main_Menu_List_Teams) then
                        Draw String (SCREEN_W\2 - 100, a*30 + top_margin), "<"
                end if
                if Main_menu_Team_0_selected < ubound(Main_Menu_List_Teams)-1 then
                        Draw String (SCREEN_W\2 + 92, a*30 + top_margin), ">"
                end if
            end if
        Case 1
            Draw String (SCREEN_W\2 - len(Main_Menu_List_Teams(Main_menu_Team_1_selected).label)*4,_
            a*30 + top_margin),_
            str(Main_Menu_List_Teams(Main_menu_Team_1_selected).label) 
            If a = Main_menu_Item_selected Then
                if Main_menu_Team_1_selected > lbound(Main_Menu_List_Teams) then
                        Draw String (SCREEN_W\2 - 100, a*30 + top_margin), "<"
                end if
                if Main_menu_Team_1_selected < ubound(Main_Menu_List_Teams)-1 then
                        Draw String (SCREEN_W\2 + 92, a*30 + top_margin), ">"
                end if
            end if
        Case 2
            Draw String (SCREEN_W\2 - len(Pitch_data(Main_menu_pitch_type_selected).label)*4,_
            a*30 + top_margin),_
            Str(Pitch_data(Main_menu_pitch_type_selected).label)
            If a = Main_menu_Item_selected Then
                if Main_menu_pitch_type_selected > lbound(Pitch_data) then
                        Draw String (SCREEN_W\2 - 100, a*30 + top_margin), "<"
                end if
                if Main_menu_pitch_type_selected < ubound(Pitch_data)-1 then
                        Draw String (SCREEN_W\2 + 92, a*30 + top_margin), ">"
                end if
            end if
        Case 3
            Draw String (SCREEN_W\2 - len(Str(Main_Menu_List_mins(Main_menu_mins_selected)))*4,_
            a*30 + top_margin),_
            Str(Main_Menu_List_mins(Main_menu_mins_selected))
            If a = Main_menu_Item_selected Then
                if Main_menu_mins_selected > lbound(Main_Menu_List_mins) then
                        Draw String (SCREEN_W\2 - 100, a*30 + top_margin), "<"
                end if
                if Main_menu_mins_selected < ubound(Main_Menu_List_mins)-1 then
                        Draw String (SCREEN_W\2 + 92, a*30 + top_margin), ">"
                end if
            end if
            
        Case 4
            Draw String (SCREEN_W\2 - len(Str(Main_Menu_Mode(Main_Menu_mode_selected)))*4,_
            a*30 + top_margin),_
            Str(Main_Menu_Mode(Main_Menu_mode_selected))
            If a = Main_menu_Item_selected Then
                if Main_Menu_mode_selected > lbound(Main_Menu_Mode) then
                        Draw String (SCREEN_W\2 - 100, a*30 + top_margin), "<"
                end if
                if Main_Menu_mode_selected < ubound(Main_Menu_Mode)-1 then
                        Draw String (SCREEN_W\2 + 92, a*30 + top_margin), ">"
                end if
            end if
        Case 5
            Draw String (SCREEN_W\2 - len(Str(Main_Menu_control(Main_Menu_control_selected)))*4,_
            a*30 + top_margin),_
            Str(Main_Menu_control(Main_Menu_control_selected))
            If a = Main_menu_Item_selected Then
                if Main_menu_control_selected > lbound(Main_Menu_control) then
                        Draw String (SCREEN_W\2 - 100, a*30 + top_margin), "<"
                end if
                if Main_Menu_control_selected < ubound(Main_Menu_control)-1 then
                        Draw String (SCREEN_W\2 + 92, a*30 + top_margin), ">"
                end if
            end if
        Case 6
            Line (SCREEN_W\2 - 96,a*30 + 79)-(SCREEN_W\2 + 96,a*30 + 96),Rgb(63,63,0),BF
            If Main_Menu_mode_selected Then
                Draw String (SCREEN_W\2 - len("PLAY")*4,a*30 + 80), "PLAY"
            Else
                Draw String (SCREEN_W\2 - len("WATCH THE MATCH")*4,a*30 + 80), "WATCH THE MATCH"
            End If
        End Select
    Next a
End Sub

SUB draw_pitch()
    dim as Integer pitch_rows, pitch_cols
    dim as Integer a, b
    dim banner_message as string*32
    pitch_rows = PITCH_H \ 32 + 4
    pitch_cols = PITCH_W \ 32 + 4
    
    'drawing the grass
    for a = 0 to pitch_rows -1
        for b = 0 to pitch_cols -1
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
    draw string (PITCH_X + 15 - c_x_o,  PITCH_Y - 20 - c_y_o), banner_message, RGB(50,50,50)
    
    PUT (PITCH_X + PITCH_W - 266 - c_x_o, PITCH_Y - 27 - c_y_o), banner_sprite, trans
    banner_message = GAME_AUTHOR_SITE
    draw string (PITCH_X + PITCH_W - 256 - c_x_o,  PITCH_Y - 20 - c_y_o), banner_message, RGB(50,50,50)
    
END SUB

SUB draw_pitch_lines()
    'drawing the pitch's border lines
    Line (PITCH_X - c_x_o, PITCH_Y - c_y_o)-(PITCH_W+PITCH_X- c_x_o, PITCH_H+PITCH_Y- c_y_o),RGB (255,255,255),b
    
    'middle line and circle
    Line (PITCH_X - c_x_o, PITCH_MIDDLE_H - c_y_o)-(PITCH_X + PITCH_W - c_x_o, PITCH_MIDDLE_H - c_y_o),RGB (255,255,255)
    Circle (PITCH_MIDDLE_W - c_x_o, PITCH_Y + PITCH_H\2- c_y_o), 84,RGB (255,255,255),,,0.8
    Circle (PITCH_MIDDLE_W - c_x_o, PITCH_Y + PITCH_H\2- c_y_o), 2,RGB (255,255,255),,,,F
    
    'Top penalty area
    Line    (PITCH_MIDDLE_W - PITCH_PENALTY_AREA - c_x_o,_
    PITCH_Y - c_y_o)-_
    (PITCH_MIDDLE_W + PITCH_PENALTY_AREA - c_x_o,_
    PITCH_Y + PITCH_PENALTY_AREA/1.5 - c_y_o), RGB (255,255,255),B
    'Top Gk area
    Line    (PITCH_MIDDLE_W - PITCH_PENALTY_AREA/2 - c_x_o,_
    PITCH_Y - c_y_o)-_
    (PITCH_MIDDLE_W + PITCH_PENALTY_AREA/2 - c_x_o,_
    PITCH_Y + PITCH_PENALTY_AREA/4 - c_y_o), RGB (255,255,255),B
    'top penalty dish
    Circle (PITCH_MIDDLE_W - c_x_o, PITCH_Y + PITCH_PENALTY_AREA/1.5 - 48 - c_y_o), 2,RGB (255,255,255),,,,F
    'top penalty circle
    Circle (PITCH_MIDDLE_W - c_x_o, PITCH_Y + PITCH_PENALTY_AREA/1.5 - 48 - c_y_o),_
    84,RGB (255,255,255),3.75,5.65
    
    'bottom penalty area
    Line    (PITCH_MIDDLE_W - PITCH_PENALTY_AREA - c_x_o,_
    PITCH_Y + PITCH_H - c_y_o)-_
    (PITCH_MIDDLE_W + PITCH_PENALTY_AREA - c_x_o,_
    PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/1.5 - c_y_o), RGB (255,255,255),B
    'bottom Gk area
    Line    (PITCH_MIDDLE_W - PITCH_PENALTY_AREA/2 - c_x_o,_
    PITCH_Y + PITCH_H - c_y_o)-_
    (PITCH_MIDDLE_W + PITCH_PENALTY_AREA/2 - c_x_o,_
    PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/4 - c_y_o), RGB (255,255,255),B
    'bottom penalty dish
    Circle (PITCH_MIDDLE_W - c_x_o, PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/1.5 + 48 - c_y_o), 2,RGB (255,255,255),,,,F
    'bottom penalty circle        
    Circle (PITCH_MIDDLE_W - c_x_o, PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/1.5 + 48 - c_y_o),_
    84,RGB (255,255,255),0.61,2.52
    
    Circle (PITCH_X - c_x_o, PITCH_Y - c_y_o), 9, RGB(255,255,255),pi*1.5,0
    Circle (PITCH_X - c_x_o, PITCH_Y + PITCH_H - c_y_o), 9, RGB(255,255,255),0,pi/2
    Circle (PITCH_X+PITCH_W - c_x_o, PITCH_Y - c_y_o), 9, RGB(255,255,255),pi,pi*1.5
    Circle (PITCH_X+PITCH_W - c_x_o, PITCH_Y + PITCH_H - c_y_o), 9, RGB(255,255,255),pi/2,pi
    
END SUB

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
                        circle (pl(a(c,0)).x - c_x_o, pl(a(c,0)).y - c_y_o + 10),11, RGB (255,255,255),,,,F
                    end if
                    circle (pl(a(c,0)).x - c_x_o, pl(a(c,0)).y - c_y_o + 10),9, RGB (200,0,100),,,,F
                    circle (pl(a(c,0)).x - c_x_o, pl(a(c,0)).y - c_y_o + 10),6, RGB (0,50,0),,,,F
                end if
            end if
        end if
        
                'DRAW the BALL Z-Sorted - -  doesn't works fine :(
        
        select case c
            case 1 to PL_N_TOT * 2 - 2
                if pl(a(c,0)).y > ball.y and pl(a(c+1,0)).y < ball.y then
                    draw_ball()
                end if
            case PL_N_TOT * 2 - 1
                if pl(a(c,0)).y > ball.y then
                    draw_ball()
                end if
            case 0
                if pl(a(c,0)).y < ball.y then
                    draw_ball()
                end if
        end select
        
        'puts the right set of sprites depending on the pl.action
        if is_in_camera_crop (pl(a(c,0)).x, pl(a(c,0)).y, 128) then
            select case pl(a(c,0)).action
            case 0 '*** at this moment undefined***
            case running
                
                pl(a(c,0)).frame_offset = 0
                pl(a(c,0)).dist += pl(a(c,0)).speed / 150
                if pl(a(c,0)).dist > 1 then
                    pl(a(c,0)).frame+=1
                    pl(a(c,0)).dist = 0
                end if
                if pl(a(c,0)).frame > 5 then pl(a(c,0)).frame=1
                if pl(a(c,0)).speed = 0 then pl((a(c,0))).frame = 0
                
                if pl(a(c,0)).team = 0 then
                    if pl(a(c,0)).role = "G" then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_0(start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame), trans
                    end if
                else
                    if pl(a(c,0)).role = "G" then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_1(start_frame(pl(a(c,0)).rds)+pl(a(c,0)).frame), trans
                    end if
                end if
            case jumping, sliding, falling, falled, throw_in, gk_falled_w_ball, free_kicker
                select case pl(a(c,0)).action
                    case jumping
                        frame_offset = 8
                    case sliding
                        frame_offset = 7
                    case falling, falled, gk_falled_w_ball
                        frame_offset = 6
                    case throw_in
                        frame_offset = 16
                    case free_kicker
                        frame_offset = 0
                end select
                
                if pl(a(c,0)).team = 0 then
                    if pl(a(c,0)).id < 2 then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(start_frame(pl(a(c,0)).rds)+frame_offset), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_0(start_frame(pl(a(c,0)).rds)+frame_offset), trans
                    end if
                else
                    if pl(a(c,0)).id < 2 then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(start_frame(pl(a(c,0)).rds)+frame_offset), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_1(start_frame(pl(a(c,0)).rds)+frame_offset), trans
                    end if
                end if
            
            case gk_jumping
                pl(a(c,0)).frame_offset +=1
                if pl(a(c,0)).frame_offset > 12 then pl(a(c,0)).frame_offset = 0
                if pl(a(c,0)).team = 0 then
                    if pl(a(c,0)).role = "G" then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(start_frame(pl(a(c,0)).rds)+int(pl(a(c,0)).frame_offset/2)+9), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_0(start_frame(pl(a(c,0)).rds)+int(pl(a(c,0)).frame_offset/2)+9), trans
                    end if
                else
                    if pl(a(c,0)).role = "G" then
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        gk_sprite(start_frame(pl(a(c,0)).rds)+int(pl(a(c,0)).frame_offset/2)+9), trans
                    else
                        PUT (pl(a(c,0)).x - pl(a(c,0)).w - c_x_o, pl(a(c,0)).y - pl(a(c,0)).w - c_y_o),_
                        pl_sprite_1(start_frame(pl(a(c,0)).rds)+int(pl(a(c,0)).frame_offset/2)+9), trans
                    end if
                end if

            case else
            end select
        end if
    next c
END SUB

SUB draw_top_net()
    PUT (PITCH_MIDDLE_W - 53 - c_x_o, PITCH_Y - 38 - c_y_o ), net_sprite(0), trans
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
    tile = get_ball_tile(pl(pl_id).team)
    '--------------------------------------------------------------------
    'if there is enough room AND THE NET IS FAR - run to the opponent net
    if d_b_t_p(pl(pl_id).x,pl(pl_id).y, PITCH_MIDDLE_W, _
        PITCH_Y + PITCH_H * (1 - Team(pl(pl_id).team).att_dir)) > PITCH_PENALTY_AREA and _
        d_b_t_p (pl(pl_id).x,pl(pl_id).y,_
        pl(get_nrst_pl_ball(pl(pl_id).team xor 1)).x,_
        pl(get_nrst_pl_ball(pl(pl_id).team xor 1)).y) > PL_RUN_SPACE then
            ball.rds = _abtp (pl(pl_id).x, pl(pl_id).y,_
            PITCH_MIDDLE_W, PITCH_Y + (PITCH_H * (1 - Team(pl(pl_id).team).att_dir))) + rnd * .5 -.25
            ball.speed += ((rnd*5 + 5) * M_Pixel)
            SHELL_message = "run to opponent"
    'else get standard behaviour table
    else
        select case decision
        case 0 to bhv_tile(tile, 0) '0: PASS TO NEAREST
            SHELL_message =  str(decision) + " TILE " + str(tile) + " PASS to nearest"
            shoot_ball  (pl_id, get_nrst_pl_pass(pl_id),_
                        pl(get_nrst_pl_pass(pl_id)).x,_
                        pl(get_nrst_pl_pass(pl_id)).y, 0.1, rnd * 1.0-0.5)
            exit sub
        case bhv_tile(tile, 0)+1 to bhv_tile(tile, 1)	'1: pass_to_2nd_nearest
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " PASS 2nd nearest"
            pl_to_pass = rnd*2 + 1
            shoot_ball  (pl_id, get_nrst2_pl_pass(pl_id, pl_to_pass),_
                        pl(get_nrst2_pl_pass(pl_id, pl_to_pass)).x,_
                        pl(get_nrst2_pl_pass(pl_id, pl_to_pass)).y, 0.1, rnd * 1.0-0.5)
            exit sub
        case bhv_tile(tile, 1)+1 to bhv_tile(tile, 2)	'2: pass_short_side
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " PASS Short Side"
            shoot_ball  (pl_id, get_nrst_pl_pass(pl_id),_
                        pl(get_nrst_pl_pass(pl_id)).x,_
                        pl(get_nrst_pl_pass(pl_id)).y, 0.2, rnd * 1.0-0.5)
            exit sub
        case bhv_tile(tile, 2)+1 to bhv_tile(tile, 3)	'3: pass_long_side
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " PASS Long Side"
            shoot_ball  (pl_id, get_longside_pl_to_pass(pl_id),_
                        pl(get_longside_pl_to_pass(pl_id)).x,_
                        pl(get_longside_pl_to_pass(pl_id)).y, 0.3,rnd * 1.0-0.5)
            exit sub
        case bhv_tile(tile, 3)+1 to bhv_tile(tile, 4)	'4: pass_endline
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " PASS Endline"
            shoot_ball  (pl_id, get_nrst_pl_pass(pl_id),_
                        pl(get_nrst_pl_pass(pl_id)).x,_
                        pl(get_nrst_pl_pass(pl_id)).y, 0.5,rnd * 1.0-0.5)
            exit sub
        case bhv_tile(tile, 4)+1 to bhv_tile(tile, 5)'5: pass_center 
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " PASS center"
            shoot_ball  (pl_id, get_centerest_pl_to_pass(pl_id),_
                        pl(get_centerest_pl_to_pass(pl_id)).x,_
                        pl(get_centerest_pl_to_pass(pl_id)).y, 0.2, rnd * 1.0-0.5)
            exit sub
        case bhv_tile(tile, 5)+1 to bhv_tile(tile, 6)	'6: run_to_centre
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " R U N centre"
            ball.speed += ((rnd*5 + 5) * M_Pixel)
            ball.rds = _abtp (pl(pl_id).x, pl(pl_id).y, pl(pl_id).x, PITCH_MIDDLE_H) + rnd * .5 -.25
            PL_target_id = -1 ' The pl is not passing to anyone
            
            exit sub
        case bhv_tile(tile, 6)+1 to bhv_tile(tile, 7)	'7: run_to_net
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " R U N to net"
            
            reset_ball_z()

            ball.rds = _abtp (pl(pl_id).x, pl(pl_id).y,_
            PITCH_MIDDLE_W , (PITCH_Y + PITCH_H * (1 - Team(pl(pl_id).team).att_dir))) + rnd * .5 -.25
            ball.speed += ((rnd*5 + 5) * M_Pixel)
            PL_target_id = -1 ' The pl is not passing to anyone
            
            PL_team_owner_id = pl(pl_id).team
            exit sub
        case bhv_tile(tile, 7)+1 to bhv_tile(tile, 8)	'8: run_to_endline
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " R U N to endline"
            
            ball.rds = _abtp (pl(pl_id).x, pl(pl_id).y,_
            PITCH_X + (PITCH_W * (1 - Team(pl(pl_id).team).att_dir)), pl(pl_id).y+1) + rnd * .5 -.25
            ball.speed += ((rnd*5 + 5) * M_Pixel)
            PL_target_id = -1 ' The pl is not passing to anyone
            
            PL_team_owner_id = pl(pl_id).team
            
            exit sub
        case bhv_tile(tile, 8)+1 to 100             '9: shoot_in_target
            SHELL_message =  str(decision) + " - TILE " + str(tile) + " SHOOT in TARGET"
            
            ball.rds = find_shoot_angle(pl_id)
            ball.spin = 1.0 * rnd - 0.5
            
            if decision mod 2 = 0 then 
                reset_ball_z()
                ball.speed = (50 * rnd + 50) * M_PIXEL
                ball.z_speed_init = 14 * M_PIXEL : ball.z_speed=ball.z_speed_init
            else
                reset_ball_z()
                ball.speed = (50 * rnd + 50) * M_PIXEL
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
    dim e As EVENT
    If (ScreenEvent(@e)) Then
        Select Case e.type
        Case EVENT_KEY_RELEASE
            If (e.scancode = SC_D) Then
                DEBUG = DEBUG xor 1
            End If
            If (e.scancode = SC_P) Then
                'pause
                SLEEP
            End If
        End Select
    End If
    'in Watch match and Debug mode the user may move the ball
    'or use some custom keys to check the correct behaviour of
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
	if 	Timer - Key_released_time_start > 0.2 and _
		Timer - Key_released_time_start < 0.4 and is_PL_input_rds() then
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
    if (Key_released) and is_ball_controllable_by_human(c) then
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
            ball.speed = pl(c).speed + 70 * Key_pressed_gap * M_Pixel
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
        if pl(c).action = throw_in then pl(c).action = running
        if pl(c).action = free_kicker then pl(c).action = running
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
	'MAIN------------------------------------------------------------------------------------
	'hides the mouse
    SetMouse 320, 240, 0
    load_fonts()


END SUB

SUB init_team_data()
    'attack directions initializations
    Team(0).att_dir = 1
    Team(1).att_dir = 0
    'goal initializations
    Team(0).goal = 0
    Team(1).goal = 0
    'fill the kits with the team default colors
    paint_kits(Team(0).c_1,Team(0).c_2,Team(0).c_3,Team(1).c_1,Team(1).c_2,Team(1).c_3)
END SUB

SUB init_players_proprietes()
    dim t as integer
    dim id as integer = 0
    dim c as integer 
    Dim ff As Ubyte
    ff = Freefile
    'read data from text file and store into array
    for t = 0 to 1
    Open "_data/" + Team(t).id + ".team.csv" For input As #ff
        for c = (PL_N_TOT)*t to PL_N_TOT+((PL_N_TOT)*t)-1 
            'assign values from file
            Input #ff,  pl(c).number,pl(c).role,pl(c).label,pl(c).skin,_
                       pl(c).speed_default,pl(c).stamina,pl(c).pwr_kick,_
                       pl(c).pwr_head,pl(c).pwr_tackle,pl(c).pwr_gk,_
                       pl(c).precision
            pl(c).tct_id = pl(c).number - 2
            pl(c).speed_default = (pl(c).speed_default/100)*PL_DEFAULT_SPEED
'            pl(c).precision = PI/precision 
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
            pl(c).x = c * ((PITCH_W-10)\PL_N_TOT*2) + 10 + PITCH_X
            
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
    dim img_x as integer
    dim img_w as integer
    dim img_y as integer
    dim img_h as integer
    dim count as Integer
    dim action as Integer
    dim offset as integer
    dim c as integer
    
    'loading players sprites------------------------------------------------------------
    img_w = 21
    img_h = 25
    img_x = 0
    img_y = 0
    'load and stores the sprites into two array
    'one array for each team� then with paint_kits sub
    'the color of the kits of the sprites will be changed
    BLOAD "img\pl_sprites.bmp", 0
    'it loads three time the same sprite because so after it will be painted
    'with custom skin colors (see player_proto type for details)
    'decomment check_bitmap SUB if you want to check the result
    for count = 0 to PL_SPRITES_TOT_N -1
        if (count > 0) and (count MOD 17 = 0) then
            img_x = 0
            img_y += img_h
        end if
        pl_sprite_0(count) = IMAGECREATE (img_w, img_h)
        pl_sprite_1(count) = IMAGECREATE (img_w, img_h)
        gk_sprite(count) = IMAGECREATE (img_w, img_h)
        GET (img_x, img_y)-(img_x + 20, img_y + 24), pl_sprite_0(count)
        GET (img_x, img_y)-(img_x + 20, img_y + 24), pl_sprite_1(count)
        GET (img_x, img_y)-(img_x + 20, img_y + 24), gk_sprite(count)
        img_x += img_w
    next count
    
    '-----------------------------------------------------------------------------------
    
    'loading ball sprites
    BLOAD "img\ball_sprites.bmp", 0
    img_x = 0
    img_y = 0
    for count = 0 to 14
        ball_sprite(count) = IMAGECREATE (img_w, img_h)
        GET (img_x, img_y)-(img_x + 15, img_y + 15), ball_sprite(count)
        img_x += 16
    next count
    
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
    
    BLOAD "img\wallp_0.bmp",0
    Wallpaper(0)= IMAGECREATE(640,480)
    GET (0,0)-(639,479), Wallpaper(0)
    
    BLOAD "img\wallp_1.bmp",0
    Wallpaper(1)= IMAGECREATE(640,480)
    GET (0,0)-(639,479), Wallpaper(1)
    
    BLOAD "img\wallp_2.bmp",0
    Wallpaper(2)= IMAGECREATE(640,480)
    GET (0,0)-(639,479), Wallpaper(2)
    
    
    
END SUB

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
    LoadFont "Fonts\SmallFont.bmp", SmallFont, 1
    LoadFont "Fonts\UniFont.bmp", UniFont, 1
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

Sub Load_teams_list()
    'File handle statements-------------
    Dim ff As Ubyte
    ff = Freefile
    Dim flc As Integer = 0
    Open "_data/List_Teams.team" For Input As #ff
    Do Until Eof(ff) 
        Input #ff, Main_Menu_List_Teams(flc).id, Main_Menu_List_Teams(flc).label,_
        Main_Menu_List_Teams(flc).c_1,Main_Menu_List_Teams(flc).c_2,Main_Menu_List_Teams(flc).c_3,_
        Main_Menu_List_Teams(flc).tact_module
        flc +=1
    Loop
    Close #ff
End Sub

SUB move_player(c as integer)
    '###IMPORTANT!#####
    'update pl position moving him
    pl(c).x +=  cos(pl(c).rds)*pl(c).speed * Dt
    pl(c).y +=  -sin(pl(c).rds)*pl(c).speed * Dt
END SUB

SUB move_all_players()
    dim c as integer = 0
    for c = 0 to PL_N_TOT * 2 - 1
        'if pl(c).role="G" then continue for
        'if a player is sliding or jumping, ends this action and begin to run
            if pl(c).delay then
                pl(c).delay -=1
            else
                move_player(c)
            end if
            if pl(c).delay = 0 then pl(c).action = running
    next c
END SUB

SUB paint_kits(C_shirt_0 as Integer, C_pants_0 as Integer, C_socks_0 as Integer, _
    C_shirt_1 as Integer, C_pants_1 as Integer, C_socks_1 as Integer)
    
    Dim pitch As Integer
    Dim pixels As Any Ptr
    Dim count as Integer
    dim as Integer img_w = 0
    dim as Integer img_h = 0
    
    if C_shirt_0 = C_shirt_1 then
		C_shirt_1 = C_shirt_1 xor &hFFFFFF
		C_pants_1 = C_pants_1 xor &hFFFFFF
		C_socks_1 = C_socks_1 xor &hFFFFFF
	end if
     
    for count = 0 to PL_SPRITES_TOT_N - 1
        If 0 <> ImageInfo( pl_sprite_0(count),img_w ,img_h,, pitch, pixels ) Then
            Print "unable to retrieve image information."
            Sleep
            End
        End If
        'Paint the sprite white the selected color image by directly manipulating pixel memory.
        For y As Integer = 0 To img_h
            Dim row As Integer Ptr = pixels + y * pitch
            
            For x As Integer = 0 To img_w
                if row[x] = C_KIT_SHIRT then
                    row[x] = C_SHIRT_0
                end if
                if row[x] = C_KIT_PANTS then
                    row[x] = C_PANTS_0
                end if
                if row[x]= C_KIT_LINE then
                    row[x] = C_PANTS_0
                end if
                if row[x] = C_KIT_SOCKS then
                    row[x] = C_SOCKS_0
                end if
            Next x
            
        Next y
        If 0 <> ImageInfo( pl_sprite_1(count),img_w ,img_h,, pitch, pixels ) Then
            Print "unable to retrieve image information."
            Sleep
            End
        End If
        'Paint the sprite white the selected color image by directly manipulating pixel memory.
        For y As Integer = 0 To img_h
            Dim row As Integer Ptr = pixels + y * pitch
            
            For x As Integer = 0 To img_w
                if row[x] = C_KIT_SHIRT then
                    row[x] = C_SHIRT_1
                end if
                if row[x] = C_KIT_PANTS then
                    row[x] = C_PANTS_1
                end if
                if row[x]= C_KIT_LINE then
                    row[x] = C_PANTS_1
                end if
                if row[x] = C_KIT_SOCKS then
                    row[x] = C_SOCKS_1
                end if
            Next x
        Next y
    next count
    
END SUB

SUB put_ball_on_centre()
    ball.rds = 0
    ball.x = 1+ PITCH_MIDDLE_W
    ball.y = 1+ PITCH_MIDDLE_H
    ball.z = 0
    ball.z_speed = 0
    ball.speed = 0
    ball.spin = 0
    ball.w = 4
    ball.frame=0
    ball.x_spin = 0
	ball.y_spin = 0
END SUB

SUB reset_ball_z()
    ball.z = 0
    ball.z_speed = 0
    ball.z_speed_init = 0
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
        pl(c).y = PITCH_Y + PITCH_H * (pl(c).team xor 1)_
                + distance_from_net - distance_from_net * 2 * (Team(pl(c).team).att_dir)
        'when stay in the net always watch the ball
        pl(c).rds = _abtp(pl(c).x,pl(c).y, ball.x, ball.y)
    end if
END SUB

SUB reset_players_positions()
    dim t as integer
    dim c as Integer
    for t = 0 to 1
        for c = (PL_N_TOT)*t to PL_N_TOT+((PL_N_TOT)*t)-1 
                pl(c).speed = pl(c).speed_default
                pl(c).delay = 0
                pl(c).active = 1 ' by default the pl is ready to perform any action
                pl(c).action = running 'by default the pl can run
                pl(c).delay = 0
                pl(c).y = PITCH_Y + (PITCH_H\4) + ((PITCH_H\2)*(Team(pl(c).team).att_dir))
                pl(c).x = c * ((PITCH_W-10)\PL_N_TOT*2) + 10 + PITCH_X
        next c
    next t
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
        
        'if get_ball_tile(pl(c).team) >= 0 and get_ball_tile(pl(c).team) <= TILES_BALL_N then
		'tile = tct_tile(Team(pl(c).team).tact_module, pl(c).tct_id, get_ball_tile(pl(c).team))
			
			
		if (pl(c).team = 0) then
			tile = TILES_PL_N - tile
		end if
		
		'get the row and the column
		tile_row = tile MOD 16
		tile_col = 16-int(tile\16)
		'convert in xy coords
		x_trg = (tile_row * PITCH_W\16) + PITCH_X + PITCH_W\32
		y_trg = PITCH_H - (tile_col * PITCH_H\16) + PITCH_H\16
		
		'returns te right rds to the tile
		pl(c).rds = _abtp (pl(c).x,pl(c).y,x_trg,y_trg)
		'if the distance is less than 5 then the pl has reached the position
		if d_b_t_p(pl(c).x,pl(c).y,x_trg,y_trg) < 5 then
			pl(c).speed = 0
		else
			pl(c).speed = pl(c).speed_default
			'update the pl position moving him
		end if
	end if
END SUB

SUB run_tactic_all_players(c as integer)
    dim d as Integer = 0
    for d = 0 to PL_N_TOT * 2 - 1
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
    if (camera.x < PITCH_X + camera.w/2 - CAMERA_PADDING) then
        camera.x = PITCH_X + camera.w/2 - CAMERA_PADDING
    end if
    if (camera.x > PITCH_X + PITCH_W - camera.w/2 + CAMERA_PADDING) then
        camera.x = PITCH_X + PITCH_W - camera.w/2 + CAMERA_PADDING
    end if
    if (camera.y > PITCH_Y + PITCH_H - camera.h/2 + CAMERA_PADDING) then
        camera.y = PITCH_Y + PITCH_H - camera.h/2 + CAMERA_PADDING
    end if
    if (camera.y < PITCH_Y + camera.h/2 - CAMERA_PADDING) then
        camera.y = PITCH_Y + camera.h/2 - CAMERA_PADDING
    end if
    'update global variables
    c_x_o = camera.x - camera.w/2
    c_y_o = camera.y - camera.h/2
END SUB

Sub Update_main_menu()
	dim e As EVENT
	dim scroll as integer
	scroll = 0
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
            End If
            If (e.scancode = SC_LEFT) Then
                scroll = -1
            End If
        End Select
    End If

    If Main_menu_Item_selected > 6 Then Main_menu_Item_selected = 6
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
            Team(0).att_dir = 1
            Team(1).att_dir = 0
            Team(0).goal = 0
            Team(1).goal = 0
            '----------------
            if Main_Menu_mode_selected then
                Human_control = 1
            else
                Human_control = 0
            end if
            Training_mode = 0
            Exit_flag = 1
            Debug = 0
        End If
    End Select
    'important! resets to 0 the horizontal scroll of the selected item
    scroll = 0
End Sub
 
sub update_match_event()
    'p is the id of the player selected to perform actions... and the other just watch!
    static p as Integer
    static match_flag as integer ' useful to not perform twice a match_Event
    dim rnd_pl as Integer
    
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
        case ball_in_game
            store_ball_position() 'store the ball position for free kicks
            check_ball_goals() 'only if the ball is in game, there may be goals
            check_pl_collisions() 'only with ball in game pl may collide each other
            update_players() ' IMPORTANT
            '--------------------------------------------------------------------------
        case penalty_t0, penalty_t1
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
                        ball.y = PITCH_Y + PITCH_PENALTY_AREA/1.5 - 48
                    else
                        ball.x = PITCH_MIDDLE_W + 2
                        ball.y = PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/1.5 + 48
                    end if
                pl(p).rds = _abtp(pl(p).x, pl(p).y,Ball.x,Ball.y)
                reset_ball_z()
                restore_players_speed()
                'all the players still continue to move themselves
                run_tactic_all_players(p)
                move_all_players()
                end if
            end if
        'SIDE THROW IN -----------------------------------------------------------------
        case throw_in_lside_t0, throw_in_rside_t0, throw_in_lside_t1, throw_in_rside_t1
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
    
        'THROW IN BOTTOM AND UPPER SIDE ------------------------------------------------
    case throw_in_tl_side_t0, throw_in_tl_side_t1, _
        throw_in_tr_side_t0, throw_in_tr_side_t1, _
        throw_in_bl_side_t0, throw_in_bl_side_t1, _
        throw_in_br_side_t0, throw_in_br_side_t1
        
        if Match_event = throw_in_tl_side_t0 _
        or Match_event = throw_in_tr_side_t0 _
        or Match_event = throw_in_bl_side_t0 _
        or Match_event = throw_in_br_side_t0 then
            p = 0 'id of gk team 0
        else
            p = 11 'id of gk team 1
        end if
        if Match_event_delay then
            run_tactic_all_players(-1) 'all the players run the tactic
            move_all_players()
            reset_gk_net_position (0,25)
            reset_gk_net_position (11,25)
        else
            'pl(p).speed = 1
            'return the right position for the ball
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
            
            run_tactic_all_players(-1) 'all the players run the tactic
            move_all_players()
            reset_ball_z()
            restore_players_speed()
            
            'the gk goes to get the ball
            pl(p).rds = _abtp(pl(p).x, pl(p).y,Ball.x,Ball.y)
            'if the gk gets the position then the game may restart
            if d_b_t_p(pl(p).x, pl(p).y, Ball.x,Ball.y) < 5 then
                pl(p).x = Ball.x
                pl(p).y = Ball.y
                'the gk launches the ball
                shoot_ball  (p, -1,_
                            PITCH_MIDDLE_W ,_
                            PITCH_MIDDLE_H, 0.75,0)
                'IMPORTANT!
                match_event = ball_in_game
            end if
            
            
        end if
    case corner_tl_side_t0, corner_tl_side_t1, _
        corner_tr_side_t0, corner_tr_side_t1, _
        corner_bl_side_t0, corner_bl_side_t1, _
        corner_br_side_t0, corner_br_side_t1

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
        
case ball_on_centre_t0 
case ball_on_centre_t1
case foul_t0, foul_t1
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
case happy_t0
    if Match_event_delay then
        update_ball_on_goal()
    else    
        put_ball_on_centre()
        reset_players_positions()
        Match_event = ball_in_game
    end if
case happy_t1
    if Match_event_delay then
        update_ball_on_goal()
    else    
        put_ball_on_centre()
        reset_players_positions()
        Match_event = ball_in_game
    end if
end select
end sub

SUB update_players()
    dim c as Integer
    Dim d as Integer
    dim decision as Integer = 0
    dim pl_to_pass as Integer = 0
    dim trg_x as single
    dim trg_y as single
    
    'the following is a very bad try to give a decent AI to the players
    for c = 0 to Ubound(pl)
        'this is useful for the pl behaviour
        decision = rnd*100
        'this is useful for the sprites
        pl(c).old_x = pl(c).x
        pl(c).old_y = pl(c).y
        
    select case pl(c).action
        case 0
        'RUNNING########################################################
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
                if is_ball_into_penalty_area (1 - Team(pl(c).team).att_dir) and _
                pl(c).delay = 0 and PL_team_owner_id <> pl(c).team then
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
                else
                    pl(c).speed = 0
                end if
                if is_ball_controllable_by_human(c) then
                    reset_ball_z()
                    if PL_ball_owner_id = c then
                        ball.x = pl(c).x
                        ball.y = pl(c).y
                        ball.x +=  5 *cos(pl(c).rds)'*pl(c).speed*Dt
                        ball.y +=  5 *-sin(pl(c).rds)'*pl(c).speed*Dt
                    end if
                    PL_ball_owner_id = c
                    PL_team_owner_id = pl(c).team
                end if
                exit select
            end if
            pl(c).speed = pl(c).speed_default
            pl(c).rds =  _abtp(pl(c).x,pl(c).y, ball.x,ball.y)
            ' try to catch the ball with SLIDING###############################
            if (decision > 95 and is_ball_slidable(c)) then
                pl(c).speed *= SPEED_RATIO_SLIDING
                pl(c).delay =  20
                pl(c).action = sliding
                continue for
            end if
            'try to hit the ball with HEADKICK################################
            if (decision > 90 and is_ball_headkickable(c)) then
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
            if int(rnd*100) < RND_SLIDE_FOUL and pl(c).team <> pl(d).team then
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
    if d_b_t_p(pl(c).x,pl(c).y, ball.x, ball.y) < 15 and ball.z < 20 and _
    pl(c).active = 1 and is_ball_into_penalty_area (Team(pl(c).team).att_dir) then
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