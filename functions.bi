' FUNCTIONS DECLARATIONS---------------------------------------------------------------------

'return 1 if two numers are equal
declare function is_equal(a as integer, b as integer) as integer
'converts radiants to degree
declare function r_t_d (degree as integer) as integer
' converts degree to radiants
declare function d_t_r (degree as integer) as single
' calculates the distance between two points
declare function d_b_t_p (x1 as single, y1 as single, x2 as single, y2 as single) as single
'gives values in the range -1...1
declare function get_diff_angle(alfa as single, beta as single) as single
' calculates the starting frame for the player sprite from the angle in radiants
declare function start_frame (radiants as single) as integer
'sam as above but for static sprites
declare function start_frame_static (radiants as single) as integer
' return the right angle where to shoot the ball to score a goal
declare function find_shoot_angle (pl_id as Integer) as single
' returns in wich ball tile is the ball
declare function get_ball_tile(att_dir as Integer) as Integer
'returns the in which tile is currently the slected pl
declare function get_pl_tile(pl_id as Integer) as Integer
' calculate the distance between player and the tile where he must go
declare function get_dist_from_tile(tile as Integer, pl_x as single, pl_y as single) as single
' return the nearest player to the ball
declare function get_nrst_pl_ball(n_team as Integer) as Integer
' giving the id of the team returns the nearest player to pass the ball
declare function get_nrst_pl_pass(pl_id as Integer) as Integer
' giving the id of the team returns the 2nd nearest player to pass the ball
declare function get_nrst2_pl_pass(pl_id as Integer, order as Integer) as Integer
' giving the unique id of the player calculate wich is his team
' and return the farrest player to pass the ball
declare function get_farrest_pl_to_pass(pl_id as Integer) as Integer    '*out of order
' giving the unique id of the player calculate wich is his team and
'return the player nearest to the corner line
declare function get_endline_pl_to_pass(pl_id as integer) as Integer
' giving the unique id of the player calculate wich is his team and
'return the player nearest to middlefield
declare function get_centerest_pl_to_pass(pl_id as Integer) as Integer
' giving the unique id of the player owner of the ball
' calculate wich is his team and returns the right player to pass by longside 
declare function get_longside_pl_to_pass (pl_id as Integer) as Integer
' giving the unique id of the player owner of the ball
' calculate wich is his team and returns the right player to pass by shortside
declare function get_shortside_pl_to_pass (pl_id as Integer) as Integer
'giving the distance between pl an pl to pass and kind of
'passing (0 for raise passing, 1 for flyby passing) returns the correct speed of the ball
declare function get_passing_ball_speed (dist as Single, kind_of_pass as Integer) as Single
'transforms the direction key pressed by human pl 1 in radiants
declare function get_PL_input_rds() as single
'checks if the human pl1 is doing a direction input
declare function is_PL_input_rds() as Boolean
'this function returns 1 if the object is into the camera crop - useful to use less CPU timing for
'drawing functions
declare function is_in_camera_crop (x as single, y as single, diam as integer) as Boolean
'cheks if the pl can perform a slide
declare function is_ball_slidable (c as integer) as Boolean
'cheks if the pl can perform an headkick
declare function is_ball_headkickable (c as integer) as Boolean
'checks if the ball is controllable by human player
declare function is_ball_controllable_by_human (c as integer) as Boolean
'checks if the ball is into penalty area
declare function is_ball_into_penalty_area (c as integer) as Boolean
'checks if the ball goes into a goal
declare function is_goal (c as integer) as Boolean
'return if the pl_to_pass is in the field of view of the player - based upon the player rds
declare function is_in_pl_fieldview (c as Integer, pl_to_pass as integer) as Boolean
'return 1 if the pl is into his opponent penalty area
declare function is_pl_into_opponent_penalty_area (c as integer) as Boolean
'return the nearest pl to the line of pass - only for Human controlled player
declare function get_pl_to_pass(c as integer) as Integer
'return the current match_event - useful for debug
declare function print_match_event(event as Integer) as String
'return the rigth player that may kick a freekick
declare function get_nrst_pl_ball_free_kick(n_team as Integer) as Integer
'returns the action the player is performing
declare function print_pl_action(action as integer) as string
'returns the value of player
declare function player_money_value(average as integer) as string
'TACTIC EDITOR FUNCTIONS
declare function tct_ed_get_ball_tile() as integer
'bhv editor functions
declare function be_checksum(tile as integer) as integer
'checks if the ball is controllable by a player
declare function is_in_pl_control (c as integer, angle as single, dist as single) as Boolean

function d_t_r (degree as integer) as single
    return int (degree * PI/180)
end function

function r_t_d (radiants as integer) as integer
    return int ((radiants * 360) / (PI*2))
end function

function d_b_t_p (x1 as single, y1 as single, x2 as single, y2 as single) as single
    return Sqr(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))
end function

function be_checksum(tile as integer) as integer
	dim as integer sum, c
	sum = 0
	for c = 0 to 9
		sum += Bhv_tile_edit_copy(tile, c)
	next c
	if sum < 100 then return -1
	if sum = 100 then return 1
	if sum > 100 then return 0
	
end function

function start_frame (radiants as single) as integer
    
    dim degree as Short
    'convert radiants to 360° degree
    degree = (180-int(radiants*180/PI))
    select case degree
		case 0 to 22
			return 68
		case 23 to 67
			return 51'tr
		case 68 to 112
			return 34
		case 113 to 157
			return 17
		case 158 to 202
			return 0
		case 203 to 247
			return 119'bL
		case 248 to 292
			return 102
		case 292 to 337
			return 85
		case 337 to 360
			return 68
		case else
			return 0
    end select
end function

function start_frame_static (radiants as single) as integer
    dim degree as Short
    'convert radiants to 360° degree
    degree = (180-int(radiants*180/PI))
    select case degree
		case 0 to 22
			return 4
		case 23 to 67
			return 3'tr
		case 68 to 112
			return 2
		case 113 to 157
			return 1
		case 158 to 202
			return 0
		case 203 to 247
			return 7'bL
		case 248 to 292
			return 6
		case 292 to 337
			return 5
		case 337 to 360
			return 4
		case else
			return 0
    end select
end function


function find_shoot_angle (pl_id as Integer) as single
    dim as single alfa_1, alfa_2, dist_1, dist_2, dist_to_gk, shoot_angle
    dim as Integer gk_id, att_dir
    
    att_dir = 1 - Team(pl(pl_id).team).att_dir
        
    if pl(pl_id).team = 0 then
        gk_id = 0
    else
        gk_id = 11
    end if
  
    dist_to_gk = d_b_t_p(pl(pl_id).x, pl(pl_id).y,pl(gk_id).x, pl(gk_id).y)
    
    alfa_2 = abs (_abtp (pl(pl_id).x, pl(pl_id).y, _
                PITCH_NET_L_WOOD, PITCH_Y + PITCH_H * att_dir)_
                - _abtp (pl(pl_id).x, pl(pl_id).y,pl(gk_id).x, pl(gk_id).y))
    alfa_1 = abs (_abtp (pl(pl_id).x, pl(pl_id).y, _
                PITCH_NET_R_WOOD, PITCH_Y + PITCH_H * att_dir)_
                - _abtp (pl(pl_id).x, pl(pl_id).y,pl(gk_id).x, pl(gk_id).y))
    
    dist_1 = dist_to_gk * sin(alfa_1)
    dist_2 = dist_to_gk * sin(alfa_2)
    
    if dist_1 < dist_2 then
       shoot_angle = _abtp (pl(pl_id).x, pl(pl_id).y,_
                            PITCH_NET_L_WOOD +_
                            abs (PITCH_NET_L_WOOD - pl(gk_id).x)/3,_
                            PITCH_Y + PITCH_H * att_dir)
    else
         shoot_angle = _abtp (pl(pl_id).x, pl(pl_id).y,_
                            PITCH_NET_R_WOOD -_
                            abs (PITCH_NET_R_WOOD - pl(gk_id).x)/3,_
                            PITCH_Y + PITCH_H * att_dir)
    end if
    
    return shoot_angle

end function

function get_diff_angle(alfa as single, beta as single) as single
    if alfa <> beta  then
        return _abtp(0,0,cos(alfa-beta),-sin(alfa-beta))
	else
		return 0
	end if
end function

function get_dist_from_tile(tile as Integer, pl_x as single, pl_y as single) as single
    dim as integer tile_row, tile_col, x_trg, y_trg
    
    tile_col = tile MOD COL_TOT_N
    tile_row = int(tile\COL_TOT_N)
    
    x_trg = (tile_col * PITCH_W\COL_TOT_N) + PITCH_X + (PITCH_W\COL_TOT_N)\2
    y_trg = PITCH_H - (tile_row * PITCH_H\ROW_TOT_N) + PITCH_Y - (PITCH_H\ROW_TOT_N)\2
    
    return d_b_t_p (pl_x,pl_y,x_trg,y_trg)
    
end function

function get_nrst_pl_ball(n_team as Integer) as Integer
    dim max_dist as integer = 10000
    dim as Integer c, id
    
    for c = 0 to PL_N_TOT * 2-1
        if pl(c).role = "G" then continue for 'doesn't consider the gk
        if d_b_t_p(pl(c).x,pl(c).y,ball.x,ball.y) < max_dist and pl(c).active = 1 _
        and pl(c).team = n_team then
            max_dist = d_b_t_p(pl(c).x,pl(c).y,ball.x,ball.y)
            id = c
        end if
    next c
        return id
end function

function get_nrst_pl_ball_free_kick(n_team as Integer) as Integer
    dim max_dist as integer = 10000
    dim as Integer c, id
        
    for c = Lbound(pl) to Ubound(pl)
        if pl(c).role = "G" then continue for 'doesn't consider the gk
        if d_b_t_p(pl(c).x,pl(c).y,Match_event_old_ball_x,Match_event_old_ball_y) < max_dist and pl(c).team = n_team then
            max_dist = d_b_t_p(pl(c).x,pl(c).y,Match_event_old_ball_x,Match_event_old_ball_y)
            id = c
        end if
    next c
        return id
end function

function get_nrst_pl_pass(pl_id as Integer) as Integer
    dim max_dist as integer = 10000
    dim as Integer c, id
    'don't pass to goalkeeper
    for c = Lbound(pl) to Ubound(pl)
        'don't pass himself, the gk or to a player of the other team
        if c = pl_id or pl(c).team <> pl(pl_id).team or pl(c).role = "G" then continue for
        if d_b_t_p(pl(c).x,pl(c).y,pl(pl_id).x,pl(pl_id).y) < max_dist then
            max_dist = d_b_t_p(pl(c).x,pl(c).y,pl(pl_id).x,pl(pl_id).y)
            id = c
        end if
    next c
    return id
end function

function get_longside_pl_to_pass (pl_id as Integer) as Integer
    
    dim a(PL_N_TOT,2) as integer
    dim as Integer tile, c, id
    dim max_dist as integer = 10000
    'gets the ball's tile and search the nearest pl to pass who is in the horizontal next tile 
    tile = get_ball_tile(pl(pl_id).team)
    if tile <=29 then
        tile += COL_TOT_N
    end if
    
    if pl(pl_id).team <> 0 then tile = TILES_BALL_N - tile
    
    for c = Lbound(pl) to Ubound(pl)
        if c = pl_id or pl(c).team <> pl(pl_id).team then continue for 'don't pass himself or to a player of the other team
        if get_dist_from_tile(tile, pl(c).x, pl(c).y) < max_dist then
            max_dist = get_dist_from_tile(tile, pl(c).x, pl(c).y)
            id = c
        end if
    next c
    
    return id
    
end function

function get_shortside_pl_to_pass (pl_id as Integer) as Integer
    
    dim a(PL_N_TOT,2) as integer
    dim as Integer tile, c, id
    dim max_dist as integer = 10000
    '    'gets the ball's y and search the nearest pl to pass who is in the vert next tile 
    '
    for c = Lbound(pl) to Ubound(pl)
        'don't pass himself or to a player of the other team
        if c = pl_id or pl(c).team <> pl(pl_id).team then continue for 
        if d_b_t_p(pl(c).x,pl(c).y,pl(pl_id).x+1,PITCH_MIDDLE_W) < max_dist then
            max_dist = d_b_t_p(pl(c).x,pl(c).y,pl(pl_id).x+1,PITCH_MIDDLE_W)
            id = c
        end if
    next c
    
    return id
    
end function

function get_nrst2_pl_pass(pl_id as Integer, order as Integer) as Integer
    
    dim a(PL_N_TOT,2) as integer
    dim as Integer b, c, lowest, start, change
    dim as integer ref
    b = 0
    'list all the pl's distances from the pl_id pl
    for c = Lbound(pl) to Ubound(pl)
        if c = pl_id or pl(c).team <> pl(pl_id).team then continue for 'don't pass himself
        a(b,0)=c
        a(b,1)= d_b_t_p (pl(c).x,pl(c).y,pl(pl_id).x,pl(pl_id).y)
        
        b += 1
    next c
    'sort'em using selection sorting algorithm
    for start = 0 to 9
        ref = a(start,1)
        change = 0 
        for b = start+1 to 9
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
    
    return a(order, 0)
    
end function

function get_farrest_pl_to_pass(pl_id as Integer) as Integer
    dim min_dist as integer = 1
    dim as Integer c, id, n_team
    n_team = pl(pl_id).team
    for c = Lbound(pl) to Ubound(pl)
        if c = pl_id or pl(c).team <> n_team then continue for 'don't pass himself
        if d_b_t_p(pl(c).x,pl(c).y,pl(pl_id).x,pl(pl_id).y) > min_dist then
            min_dist = d_b_t_p(pl(c).x,pl(c).y,pl(pl_id).x,pl(pl_id).y)
            id = c
        end if
    next c
    
    return id
end function

function get_centerest_pl_to_pass(pl_id as Integer) as Integer
    dim max_dist as integer = 10000
    dim as Integer c, id
    
    for c = Lbound(pl) to Ubound(pl)
        if c = pl_id or pl(c).team <> pl(pl_id).team then continue for 'don't pass himself
        if d_b_t_p(PITCH_MIDDLE_W,PITCH_MIDDLE_H,pl(c).x,pl(c).y) < max_dist then
            max_dist = d_b_t_p(PITCH_MIDDLE_W,PITCH_MIDDLE_H,pl(c).x,pl(c).y)
            id = c
        end if
    next c
    
    return id
end function

function get_endline_pl_to_pass(pl_id as integer) as Integer
    dim max_dist as integer = 10000
    dim as Integer c, id
    
    for c = Lbound(pl) to Ubound(pl)
        if c = pl_id or pl(c).role = "G" or pl(pl_id).team <> pl(c).team _
        then continue for 'don't pass to a player of other team
        if abs(PITCH_Y + PITCH_H * (1 - Team(pl(pl_id).team).att_dir) - pl(c).y) < max_dist then
            max_dist = abs(PITCH_Y + PITCH_H * (1 - Team(pl(pl_id).team).att_dir) - pl(c).y)
            id = c
        end if
    next c
    
    return id
end function

function get_ball_tile(att_dir as Integer) as Integer
    dim as Integer col, row, tile
    dim as single x, y, x2, y2
    tile = 0
    select case Match_event
		case ball_in_game
			'this routine find in which tile is the ball
			for row = 0 to ROW_TOT_N -1 step 1
				for col = 0 to COL_TOT_N -1 step 1
					x = col * COL_W + PITCH_X 
					y = row * ROW_H + PITCH_Y
					x2 = x + COL_W
					y2 = y + ROW_H
					'check if the ball is into a box of the grid
					if (ball.x >= x) and (ball.x < x2)_
					and (ball.y>=y) and (ball.y < y2) then
						exit for, for
					end if
					tile +=1
				next col
			next row
		case else
			tile = Match_event_last_tile
    end select

    if att_dir then
      return TILES_BALL_N - tile
    else
      return tile 
    end if
end function

function get_pl_tile (pl_id as integer) as integer
    dim as Integer col, row, tile
    dim as single x, y, x2, y2
    tile = 0
    for row = 0 to 15 step 1
        for col = 0 to 15 step 1
            x = col * TILE_PL_W + PITCH_X 
            y = row * TILE_PL_H + PITCH_Y
            x2 = x + TILE_PL_W
            y2 = y + TILE_PL_H
            'check if the player is into a box of the grid
            if (pl(pl_id).x >= x) and (pl(pl_id).x < x2)_
            and (pl(pl_id).y>=y) and (pl(pl_id).y < y2) then
                exit for, for
            end if
            tile +=1
        next col
    next row
    return tile
end function

FUNCTION is_PL_input_rds() as Boolean
    'if the input is via joystick
    if (Main_Menu_control_selected) then
        GetJoystick(Joystick.id,Joystick.buttons,Joystick.x,Joystick.y)
        if d_b_t_p(0,0,Joystick.x, Joystick.y) > 0.1 then
            return true
        else
            return false
        end if
    else
        If MultiKey(SC_DOWN) or MultiKey(SC_RIGHT)_
        or MultiKey(SC_UP) or MultiKey(SC_LEFT) then
            return true
        else
            return false
        end if
    end if
end function

FUNCTION get_PL_input_rds() as single
    dim x as single
	dim y as single
	'if the input is via joystick
    if (Main_Menu_control_selected) then
        GetJoystick(Joystick.id,Joystick.buttons,Joystick.x,Joystick.y)
        return _abtp(0,0,Joystick.x, Joystick.y)
    else
    'if is via keyboard
        if MultiKey(SC_UP) then y = -1
        if MultiKey(SC_DOWN) then y = 1
        if MultiKey(SC_RIGHT) then x = 1
        if MultiKey(SC_LEFT) then x = -1
        return _abtp(0,0,x,y)
    end if
    
END FUNCTION

function get_passing_ball_speed (dist as Single, kind_of_pass as Integer) as Single
    
    select case kind_of_pass
        case 0
        return (dist ^ 2) * (Pitch_data(Main_menu_pitch_type_selected).friction_ratio * SQR_2)
        case 1
        return (dist ^ 2) * (AIR_FRICTION * SQR_2)
    end select
end function

function is_in_camera_crop (x as single, y as single, diam as integer) as Boolean
    if (x > camera.x - camera.w/2 - diam and x < (camera.x + camera.w\2 + diam))_
    and (y > camera.y - camera.y/2 - diam and y < (camera.y + camera.h\2 + diam)) then
    return true
else
    return false
end if
end function

function is_ball_slidable (c as integer) as Boolean
    'if the pl slider is not receiving the ball and if
    'the ball distance is into a specified range (in this case >30 <50)
    '(...) and also important: the ball.z must be less than a fixed value
    if (PL_ball_owner_id <> c) and (PL_target_id <> c)_
    and (d_b_t_p(pl(c).x, pl(c).y,ball.x, ball.y)) > 10 _
    and (d_b_t_p(pl(c).x, pl(c).y,ball.x, ball.y)) < 60 _
    and ball.z < 5 _
    and pl(c).action = running and Match_Event = Ball_in_game then
    	return true
	else
		return false
	end if
end function

function is_ball_headkickable (c as integer) as Boolean
    'if the ball is near and its z value is greater than a fixed value
    'then the player tries to hit it with headkick
    if (PL_ball_owner_id <> c) and (d_b_t_p(pl(c).x, pl(c).y,ball.x, ball.y)) < 50 _
    and ball.z > 6 and ball.z < 30 _
    and Pl_ball_owner_id <> c _
    and pl(c).action = running and Match_Event = Ball_in_game then
		return true
	else
		return false
	end if
end function

function is_ball_into_penalty_area (c as integer) as Boolean
    'this function checks if the ball is into the opponent area when the referee whistles a foul?
    if  (Ball.x > PITCH_MIDDLE_W - PITCH_PENALTY_AREA) and _
        (Ball.x < PITCH_MIDDLE_W + PITCH_PENALTY_AREA) and _
        (Ball.y > PITCH_Y + ((PITCH_H - PITCH_PENALTY_AREA/1.5) * c)) and _
        (Ball.y < PITCH_Y + PITCH_PENALTY_AREA/1.5 + ((PITCH_H - PITCH_PENALTY_AREA/1.5) * c)) then
        return true
    else
        return false
    end if
end function

function is_ball_controllable_by_human (c as Integer) as Boolean
    if d_b_t_p(pl(c).x,pl(c).y, ball.x,ball.y) < 12 and ball.z < 6 then
        'in this way the pl can't touch twice the ball
        'because after his touch for passing or kicking the delay is set
        'see get_user_input_action SUB for details
        if pl(c).action = running and pl(c).delay > 1 then
            return false
        else
            return true
        end if
    else
        return false
    end if
end function


function is_in_pl_control (c as integer, angle as single, dist as single) as Boolean
    if  abs(cos(pl(c).rds) - cos(_abtp(pl(c).x,pl(c).y,ball.x, ball.y))) < angle and _
        abs(sin(pl(c).rds) - sin(_abtp(pl(c).x,pl(c).y,ball.x, ball.y))) < angle and _
        d_b_t_p (pl(c).x, pl(c).y, ball.x,ball.y) < dist then
        return true
    else
        return false
    end if
end function

function is_goal (c as integer) as Boolean
    select case c
        case 0
            if  (ball.x > PITCH_NET_L_WOOD + PITCH_NET_WOOD_RADIUS) and _
                (ball.x < PITCH_NET_R_WOOD - PITCH_NET_WOOD_RADIUS) and _
                (ball.y < PITCH_NET_TOP_Y) and _
                (ball.z < PITCH_NET_H - PITCH_NET_WOOD_RADIUS) then
                return true
            end if
        case 1
            if  (ball.x > PITCH_NET_L_WOOD + PITCH_NET_WOOD_RADIUS) and _
                (ball.x < PITCH_NET_R_WOOD - PITCH_NET_WOOD_RADIUS) and _
                (ball.y > PITCH_NET_BOTTOM_Y) and _
                (ball.z < PITCH_NET_H - PITCH_NET_WOOD_RADIUS) then
                return true
            end if
        case else
			return false
    end select
end function

function is_in_pl_fieldview (c as Integer, pl_to_pass as integer) as Boolean
    if  abs(cos(pl(c).rds) - cos(_abtp(pl(c).x,pl(c).y,pl(pl_to_pass).x,pl(pl_to_pass).y))) < PL_FIELD_VIEW_HALF and _
        abs(sin(pl(c).rds) - sin(_abtp(pl(c).x,pl(c).y,pl(pl_to_pass).x,pl(pl_to_pass).y))) < PL_FIELD_VIEW_HALF then
        return true
    else
        return false
    end if
end function

function is_pl_into_opponent_penalty_area (c as integer) as Boolean
    'this function checks if the ball is into the opponent area when the referee whistles a foul?
    if  (pl(c).x > PITCH_MIDDLE_W - PITCH_PENALTY_AREA) and _
        (pl(c).x < PITCH_MIDDLE_W + PITCH_PENALTY_AREA) and _
        (pl(c).y > PITCH_Y + ((PITCH_H - PITCH_PENALTY_AREA/1.5) * (1 - Team(pl(c).team).att_dir))) and _
        (pl(c).y < PITCH_Y + PITCH_PENALTY_AREA/1.5 + ((PITCH_H - PITCH_PENALTY_AREA/1.5) * (1 - Team(pl(c).team).att_dir))) then
        return true
    else
        return false
    end if
end function

function get_pl_to_pass(c as integer) as Integer
    dim a as integer 				'counter for the pl to check
    dim max_dist as single = 300 	'maximum distance from the passing line
    dim pl_to_pass as integer = 0 	'this is useful for the return value of the function
    dim dist as single 				'distance between pl(c) and pl(a)
    dim dist_to_passline as single 	'distance between passing line and pl(a)
    dim alfa as single 				'know angle (angle between pl(c) and pl(a))
    dim as single teta 				'unknow angle
    
    'doesn't try to pass to the goalkeeper
    for a = 0 to PL_N_TOT*2 - 1
        'doesn't chek himself or a player of the other team & doesnt' pass to gk
        if Pl_ball_owner_id = -1 then continue for 'IMPORTANT
        if a = c or pl(a).team <> pl(c).team or pl(a).role = "G" then
            continue for
        end if
        
        if is_in_pl_fieldview (c, a) then
            'here there is the formula to find the shortest perpendicular
            'segment from the given line
            alfa = abs(pl(c).rds)
            teta = PI - (PI_2 + alfa) 'here the unknow angle
            dist = d_b_t_p(pl(c).x, pl(c).y, pl(a).x, pl(a).y)
            dist_to_passline = abs (dist * (sin(teta)/sin(PI_2)))
            if dist_to_passline < max_dist and dist_to_passline < MAX_DIST_PASS then
                max_dist = dist_to_passline
                pl_to_pass = a
            end if
        end if
    next a
    
    return pl_to_pass 'it will return 0 (see above) if there isn't no one pl to pass
    'or the right id of the pl to pass
    
end function

function print_match_event(event as Integer) as String
    Select case match_event
    case 0
        return "NONE"
    case ball_in_game
        return "ball_in_game"
    case penalty_t0
        return "penalty_t0"
    case penalty_t1
        return "penalty_t1"
    case throw_in_lside_t0
        return "throw_in_lside_t0"
    case throw_in_lside_t1
        return "throw_in_lside_t1"
    case throw_in_rside_t0
        return "throw_in_rside_t0"
    case throw_in_rside_t1
        return "throw_in_rside_t1"
    case throw_in_tl_side_t0
        return "throw_in_tl_side_t0"
    case throw_in_tl_side_t1
        return "throw_in_tl_side_t1"
    case throw_in_tr_side_t0
        return "throw_in_tr_side_t0"
    case throw_in_tr_side_t1
        return "throw_in_tr_side_t1"
    case throw_in_bl_side_t0
        return "throw_in_bl_side_t0"
    case throw_in_bl_side_t1
        return "throw_in_bl_side_t1"
    case throw_in_br_side_t0
        return "throw_in_br_side_t0"
    case throw_in_br_side_t1
        return "throw_in_br_side_t1"
    case corner_tl_side_t0
        return "corner_tl_side_t0"
    case corner_tl_side_t1
        return "corner_tl_side_t1"
    case corner_tr_side_t0
        return "corner_tr_side_t0"
    case corner_tr_side_t1
        return "corner_tr_side_t1"
    case corner_bl_side_t0
        return "corner_bl_side_t0"
    case corner_bl_side_t1
        return "corner_bl_side_t1"
    case corner_br_side_t0
        return "corner_br_side_t0"
    case corner_br_side_t1
        return "corner_br_side_t1"
    case gk_t0_owner
        return "gk_t0_owner"
    case gk_t1_owner
        return "gk_t1_owner"
    case ball_on_centre_t0
        return "ball_on_centre_t0"
    case ball_on_centre_t1
        return "ball_on_centre_t1"
    case foul_t0
        return "foul_t0"
    case foul_t1
        return "foul_t1"
    case presentation
        return "presentation"
    case happy_t0
        return "happy_t0"
    case resetting_start_position
        return " resetting_start_position"
    case happy_t1
        return "happy_t1"
    case else
        return "<UNDEFINED!!!>"
    end select
end function

function print_pl_action(action as integer) as string
    select case action
        case 0
            return "none"
        case running
            return "running"
        case jumping
            return "jumping"
        case sliding
            return "sliding"
        case falling
            return "falling"
        case falled
            return "falled"
        case gk_falled
            return "gk_falled"
        case gk_falled_w_ball
            return "gk_falled_w_ball"
        case gk_w_ball
            return "gk_w_ball"
        case throw_in
            return "throw_in"
        case free_kicker
            return "free_kicker"
        case bench
            return "bench"
        case else
            return "INDEFINED"
    end select
end function

function tct_ed_get_ball_tile() as integer
    dim as integer x2, y2, x, y, col, row, tile 
    tile = 0
    for row = 0 to 5 step 1
        for col = 0 to 5 step 1
            'draw the grid
            x = col * tct_ed_PITCH_W \ 6 + tct_ed_PITCH_X 
            y = row * tct_ed_PITCH_H \ 6 + tct_ed_PITCH_Y
            x2 = x + tct_ed_PITCH_W \ 6
            y2 = y + tct_ed_PITCH_H \ 6
            'check if the ball is into a box of the grid
            if (tct_ed_ball_x > x) and (tct_ed_ball_x < x2)_
            and (tct_ed_ball_y>y) and (tct_ed_ball_y < y2) then
            exit for, for
            end if
            tile +=1
        next col
    next row
    return tile
end function

function is_equal(a as integer, b as integer) as Integer
	if a = b then 
		return 1
	else
		return 0
	end if

end function

function player_money_value(average as integer) as string
	dim value as single
	dim as integer million, fraction

	value = ((1-cos(-PI_2*(average/100))))*PL_MAX_MONEY_VALUE
	
	if value < 1000000 then
		value = int(value/1000)
		return str(value) + " K"
	else
		million = int (value/1000000)
		fraction = int ((value mod 1000000)/100000)
		return str(million) + "." + str(fraction) + " M"
	end if
end function

