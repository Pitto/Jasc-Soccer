TYPE camera_proto
    x as single
    y as single
    w as single
    h as single
    speed as single
    rds as single
END TYPE

TYPE pitch_proto
    label as string
    friction_ratio as single
    bounce_ratio as single
    x as integer    'x of the pitch
    y as integer    'y of the pitch
    w as integer    'width of the pitch
    h as integer    'heigth of the pitch
    xm as integer   'horizontal middle line of the pitch
    ym as integer   'vertical middle line of the pitch
    paw as integer  'half of penalty area width 
    pah as integer  'penalty area height
    pac as integer  'penalty area circle diameter
    padw as integer  'penalty dish diameter
    padd as integer  'penalty dish distance from net
    gkw as integer  'half goalkeeper area
    gkh as integer  'goalkeeper area height
    cdw as integer  'corner dish diameter
end type

TYPE player_proto
    id as Integer       'unique id of the player 0-PL_N_TOT*2
    tct_id as integer
    team as Integer     ' 0  for home team - 1 for away team
    number as Integer   'number of the player
    label as string * 32 'name of the player    *out of order
    old_x as single 'old x position
    old_y as single 'old y position
    x as single         'x position
    y as single         'y position
    rds as single       'rotation of the player (in radiants (0-6.28))
    tact_offset_x as Integer 'offset x to the tactic
    tact_offset_y as Integer 'offset y to the tactic
    speed as single     'speed of the player
    frame as Integer    'useful to get the correct sprite frame
    frame_offset as Integer 'useful to get the correct sprite frame
    dist as single  'distance covered by the pl
    w as Integer        'width
    active as Integer ' check if the player is ready to make an action
    action as proto_pl_action
    delay as Integer ' how many cycles delays the player to perform  an action
    'to be loaded from txt file -----
    skin as Integer    'skin color: 0: white with black hair;
                         '   1: brown with black hair;
                            '2:white with yellow air;
    role as string*1
    speed_default as single     'speed default of the player
    stamina as single
	pwr_kick	as single
    pwr_head	as single
    pwr_tackle as single
	pwr_gk as single
	precision as single
END TYPE

TYPE ball_proto
    x as single         'x position
    y as single         'y position
    z as single         'z position
    old_x as single
    old_y as single
    x_spin as single
    y_spin as single
    z_speed as single       'z accel ratio
    z_speed_init as single   'z accel ratio
    speed as single     'speed 
    spin as single
    w as Integer  'width
    rds as single 'rotation
    effect as single 'effect
    frame as Integer 'which frame
END TYPE

Type Team_proto
    id As String*3   'unique id of the team
    label As String 'name of the team
    c_1 As Uinteger 'color of the kit
    c_2 As Uinteger
    c_3 As Uinteger
    tact_module As Integer 'tactic module of the team (0-9) see also tct_tile_label(10) 
    att_dir as integer 'direction of the attack 0 or 1 (up or down)
    goal as integer
End Type

Type Match_options_proto
    item_selected As Integer '= 0
    items_total As Integer '= 4
    team_0_sel As Integer '= 2
    team_1_sel As Integer '= 1
    mins_sel as integer '=0 -> 3 mins
    pitch_sel As Integer '= 0 -> MUDDY
    mode_sel As Integer = 0
'    Dim Shared Main_Menu_List_Teams(GAME_N_TOT_TEAMS) As Team_proto
'    Dim Shared Main_Menu_List_mins(4) As Integer = {3,5,7,10}
'    Dim Shared Main_Menu_List_pitch(4) As String*8 = {"MUDDY", "WET", "SOFT","HARD", "FROZEN"}
'    Dim Shared Main_Menu_Mode(2) As String*8= {"PC v PC","PL v PC"}
End Type

Type Match_timing_proto
	fps as integer
	actual_fps as integer
	time_start as double
	time_last as single
	time_current as single
	seconds_elapsed as single
	secs_to_play as single
	injury_time as single
	status as integer '0/1
End Type

Type proto_Joystick
    id as integer
    buttons as integer
    x as single
    y as single
End Type

Type mouse
    As Integer res, x, y, wheel, clip, old_wheel, diff_wheel
    Union
        buttons As Integer
        Type
            Left:1 As Integer
            Right:1 As Integer
            middle:1 As Integer
        End Type
    End Union
End Type
