'__#DEFINE______________________________________________________________
#define GAME_NAME 			"JASC SOCCER"
#define GAME_VERSION 		"0.25.4"
#define GAME_AUTHOR 		"Pitto"
#define GAME_AUTHOR_SITE 	"github.com/Pitto/Jasc-Soccer"
#define GAME_N_TOT_TEAMS 	17
#define GAME_SPLASHSCREEN_TEXT 	GAME_NAME " by " GAME_AUTHOR " ver " _
								GAME_VERSION

'__USEFUL CONSTS________________________________________________________
const FIXED_TIME_STEP 	as double 	= 1/60.0	'useful for Delta Timing
const M_PIXEL 			as single 	= 9.5 		'9.5 pixel = 1m
const PITCH_X 			as Integer 	= 50 		'no change it PLEASE
const PITCH_Y 			as Integer 	= 50 		'no change it PLEASE

'__PITCH DIMENSIONS_____________________________________________________
 'use a 32 multiple pitch texture may fit better!
const PITCH_W 			as Integer 	= 832
const PITCH_H 			as Integer	= 992
const PITCH_MIDDLE_W as Integer = PITCH_W\2 + PITCH_X
const PITCH_MIDDLE_H as Integer = PITCH_H\2 + PITCH_Y
'see update players sub for details
const PITCH_PENALTY_AREA as Single = PITCH_W*0.30
'net dimensions
const PITCH_NET_W 		as Integer = 100
const PITCH_NET_H 		as Integer = 25
'net positions
const PITCH_NET_TOP_Y 		as Integer = PITCH_Y
const PITCH_NET_BOTTOM_Y 	as Integer = PITCH_Y+PITCH_H
const PITCH_NET_L_WOOD 		as integer = PITCH_W\2-PITCH_NET_W\2+PITCH_X
const PITCH_NET_R_WOOD 		as integer = PITCH_W\2+PITCH_NET_W\2+PITCH_X
const PITCH_NET_WOOD_RADIUS as integer = 5
const PITCH_NET_DEPTH 		as integer = 15
const PITCH_NET_BOUNCE_RATIO as single = 0.05
'ball limits outside pitch
const BALL_X_BOUND 			as integer = 100
const BALL_Y_BOUND 			as integer = 20

'__TACTIC STUFF_________________________________________________________
'tiles on the pitch *NO CHANGE THIS VALUE PLEASE!*** JASC MAY CRASH :(
const TILES_BALL_N 	as Integer 	= 35
const TILES_PL_N 	as Integer 	= 255 '16x16 -1
const TILE_PL_W 	as single 	= PITCH_W / 16 
const TILE_PL_H 	as single 	= PITCH_H / 16
const COL_TOT_N 	as Integer 	= 6
const ROW_TOT_N 	as Integer 	= 6
const COL_W 		as single 	= PITCH_W / COL_TOT_N
const ROW_H 		as single 	= PITCH_H / ROW_TOT_N

'__PHYSICS CONSTS_______________________________________________________
'gravity acceleration
const GRAVITY_ACCEL as single 	= 9.80665f
const GRAVITY 		as single 	= 0.980665f
'friction of the air
const AIR_FRICTION 	as single = 0.995
'maximum speed the ball can reach so it doesn't become a ball flame
const BALL_MAX_SPEED as Integer = 55 * M_PIXEL
'minimum speed of the ball
const BALL_MIN_SPEED as Single 	= 0.01 * M_PIXEL 
'spin
const BALL_SPIN_RATIO as Single = 30.0

'__TRIGONOMETRIC CONSTS_________________________________________________
const PI as single = 3.14159265f
const PI_DOUBLE as single = PI*2
const PI_2 as single = PI/2
const PI_1_4 as single = PI/4
const PI_3_4 as single = PI_2 + PI_1_4
'square of the number 2
const SQR_2 as single = 1.4142135f

'__DISPLAY CONSTS_______________________________________________________
'screen width and height
'IMPORTANT! -> Not less than 450 x 200 or the sprites may load badly
const SCREEN_W 			as Integer = 800 
const SCREEN_H 			as Integer = 600
'useful to don't allow the camera to move everywere, this sets a limit
const CAMERA_Y_PADDING 	as Integer = 200
const CAMERA_X_PADDING 	as Integer = 100
const CAMERA_Y_PADDING_HALF as Integer = CAMERA_Y_PADDING \ 2 
const CAMERA_X_PADDING_HALF as Integer = CAMERA_X_PADDING \ 2
'ratio of the xy movements of the camera having the ball as reference point
const CAMERA_EASING_RATIO as Single = 0.40f

'wallpapers
#define WALLPAPER_TOT_N 8

'colors
#define C_BLACK 	&h000000
#define C_WHITE 	&hFFFFFF
#define C_GRAY 		&h7F7F7F
#define C_RED 		&hFF0000
#define C_BLUE 		&h0000FF
#define C_GREEN 	&h00FF00
#define C_YELLOW 	&hFFFF00
#define C_CYAN 		&h00FFFF
#define C_LILIAC 	&h7F00FF
#define C_ORANGE 	&hFF7F00
#define C_PURPLE 	&h7F007F
#define C_DARK_RED 	&h7F0000
#define C_DARK_GREEN &h007F00
#define C_DARK_BLUE &h00007F

'total number of kits
#define KIT_TOT_N 6

'__MENU CONSTS__________________________________________________________
const MAIN_MENU_ITEMS_TOTAL As Integer = 9
const MAIN_MENU_DIMMER_EASING As single = 0.75

'__PLAYERS CONSTS_______________________________________________________

#define PL_N_TOT 11
const PL_DEFAULT_SPEED as single = 15.5 * M_Pixel
const GK_DEFAULT_SPEED as single = 18 * M_Pixel
'delay of the player before executing another action
#define PL_DELAY_TIME 150
#define PL_DELAY_FALLING 10
#define PL_DELAY_FALLED 20
'minimum distance between two players - see check_pl_collisions sub for details
#define PL_MIN_DIST 8
'minimum distance between two sliders - see check_pl_collisions sub for details
#define PL_MIN_SLIDE_DIST 16
'minimum distance from opponent pl to allow pl owner of the ball to run to the net
#define PL_RUN_SPACE 35
'field view of the player in radiants
#define PL_FIELD_VIEW 0.70
#define PL_FIELD_VIEW_HALF PL_FIELD_VIEW/2
'maximum distance to allow the human pl to pass to another player
#define MAX_DIST_PASS 400
'total number of the player sprites
#define PL_SPRITES_TOT_N 136
'possibility % a slide contact become a foul
#define RND_SLIDE_FOUL 15
'maximum money value of player
#define PL_MAX_MONEY_VALUE 15000000
'possibility % a contact become falling
#define RND_CONTACT_FALL 0
'moltiplicator of speed for some actions
#define SPEED_RATIO_SLIDING 2.5
#define SPEED_RATIO_HEADING 3.5

'lenght in ms of the sleep statement
#define SLEEP_TIME 20

'kit template colors
#define C_KIT_HAIR 		RGB(23,	23,	23)
#define C_KIT_SHIRT 	RGB(0,	0,	127)
#define C_KIT_PANTS 	RGB(127,127,255)
#define C_KIT_SHOES 	RGB(63,	63,	63)
#define C_KIT_LINE 		RGB(43,	154,209)
#define C_KIT_SKIN 		RGB(255,125,20)
#define C_KIT_SOCKS 	RGB(63,	0,	63)
#define C_KIT_OVERLAY 	&h00FF00

'__MATCH CONSTS_________________________________________________________
#define MATCH_EVENT_DEFAULT_DELAY 	100
#define DBG_TXT_OFFSET 				10
#define BALL_FRAMES_RECORD 			1000
#define FRAMES_RECORD 				120
#define TIME_PAUSE_EVENT 			5

'__TACTIC EDITOR CONSTS_________________________________________________
const tct_ed_PITCH_W 			as integer = 388
const tct_ed_PITCH_H 			as integer = 448
const tct_ed_PITCH_X 			as integer = 20
const tct_ed_PITCH_Y 			as integer = 20
const tct_ed_PITCH_PENALTY_AREA as integer = tct_ed_PITCH_W\3
const tct_ed_TILES 				as integer = 36
const tct_ed_PL_TILES 			as integer = 256

'__TEAM EDITOR CONSTS___________________________________________________
const TE_TOT_PLAYERS 	as integer = 16
const TE_COLS 			as integer = 11
const TE_ROWS 			as integer = TE_TOT_PLAYERS
