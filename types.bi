TYPE camera_proto
    x 	as single
    y 	as single
    w 	as single
    h 	as single
    speed as single
    rds as single
END TYPE

TYPE pitch_proto
    label 			as string
    friction_ratio 	as single
    bounce_ratio 	as single
    x 	as integer		'x of the pitch
    y 	as integer    	'y of the pitch
    w 	as integer    	'width of the pitch
    h 	as integer    	'heigth of the pitch
    xm 	as integer   	'horizontal middle line of the pitch
    ym 	as integer   	'vertical middle line of the pitch
    paw as integer  	'half of penalty area width 
    pah as integer  	'penalty area height
    pac as integer  	'penalty area circle diameter
    padw 	as integer 	'penalty dish diameter
    padd	as integer	'penalty dish distance from net
    gkw	as integer  	'half goalkeeper area
    gkh as integer  	'goalkeeper area height
    cdw as integer		'corner dish diameter
end type

TYPE player_proto
    id 		as Integer  'unique id of the player in range 0-PL_N_TOT*2
    tct_id 	as integer
    team 	as Integer  ' 0  for home team - 1 for away team
    number 	as Integer  'number of the player
    label 	as string * 32'name of the player
    old_x 	as single 	'old x position
    old_y 	as single 	'old y position
    x 		as single   'x position
    y 		as single   'y position
    rds 	as single   'angle of the player
    speed 	as single   'speed of the player
    frame 	as Integer  'useful to get the correct sprite frame
    frame_offset as Integer 'useful to get the correct sprite frame
    dist 	as single  	'distance covered by the pl
    w 		as Integer  'width
    active 	as Integer 	'check if the player is ready to make an action
    action 	as proto_pl_action
    delay 	as Integer 	'how many cycles delays the player to perform  an action
    skin 	as Integer 	'skin color: 0: white with black hair;
                        '1:white with yellow air;   
                        '2: brown with black hair;
                            
    role as string*1	'G'oalkeeper;'D'efender;'M'idfielder;'A'ttacker
    speed_default 	as single     'speed default of the player
    control 		as single
	pwr_kick		as single
    pwr_head		as single
    pwr_tackle 		as single
	pwr_gk 			as single
	precision 		as single
	is_in_place 	as boolean 'has get his place before free kicks?
END TYPE

TYPE ball_proto
    x 				as single	'x position
    y 				as single	'y position
    z 				as single	'z position
    old_x 			as single	'store previous x pos
    old_y 			as single	'store previous y pos
    x_spin 			as single	'ball spin
    y_spin 			as single	'ball spin
    z_speed 		as single	'z accel ratio
    z_speed_init 	as single	'z accel ratio
    speed 			as single	'speed 
    spin 			as single	'ball spin
    w 				as Integer	'width
    rds 			as single	'rotation
    effect 			as single	'effect
    frame 			as Integer	'which sprite frame?
END TYPE

Type Team_proto
    id 		As String*3		'unique id of the team
    label 	As String		'name of the team
    c_1 	As Uinteger		'color of the shirt
    c_2 	As Uinteger		'color of the pants
    c_3 	As Uinteger		'color of the socks
    c_4 	As Uinteger		'overlay kit color
    kit 	as integer		'kind of kit
    tact_module As Integer 	'tactic module slot of the team (0-9)
    att_dir 	as integer 	'direction of the attack (0:up - 1:down)
    goal 		as integer	'goals scored
    kick_off 	as boolean	'has the right to kickoff?
End Type

Type Match_options_proto
    item_selected 	As Integer 
    items_total 	As Integer 
    team_0_sel 		As Integer 
    team_1_sel 		As Integer 
    mins_sel 		as integer 
    pitch_sel 		As Integer 
    mode_sel 		As Integer = 0
End Type

Type Match_timing_proto
	fps 			as integer
	actual_fps 		as integer
	time_start 		as double
	time_last 		as single
	time_current 	as single
	time_diff 		as single
	seconds_elapsed as single
	secs_to_play 	as single
	injury_time 	as single
	play 			as Boolean
End Type

Type proto_Joystick
    id 		as integer
    buttons as integer
    x 		as single
    y 		as single
End Type

Type mouse
    As Integer res, x, y, wheel, clip, old_wheel, diff_wheel
    Union
        buttons 		As Integer
        Type
            Left:1 		As Integer
            Right:1 	As Integer
            middle:1 	As Integer
        End Type
    End Union
End Type

Type Replay_proto
	co (0 to 1)					as integer 'x & y offset of the camera					
	pl(0 to PL_N_TOT*2 -1, 0 to 2) 		as integer 'id: x, y, frame
	ball (0 to 3)				as integer 'x, y, z, frame
End Type
