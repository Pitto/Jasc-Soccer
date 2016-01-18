#include "fbgfx.bi"
'this is the language I use
Using FB
#define CIRCLE_RADIUS 10
#define LINE_LENGHT 30
#define PL_MOVE_STEP 10
#define PL_RDS_STEP 0.15
#define SCREEN_W 640
#define SCREEN_H 480
#define B_WIDTH 5
#define PI 3.14159
#define PI_2 PI/2
#define PI_4 PI/4

#macro _abtp (x1,y1,x2,y2)
    -Atan2(y2-y1,x2-x1)
#endmacro

#macro _dbtp (x1,y1,x2,y2)
    sqr((y2-y1)^2+(x2-x1)^2)
#endmacro

declare FUNCTION is_PL_input_rds() as integer
declare sub update_input()
declare sub update_ball()
declare sub draw_pl()
declare sub init_ball()
declare sub draw_ball()
declare sub draw_arrow(x as single, y as single, rds as single, a_l as single, cl as Uinteger)
declare function get_diff_angle(alfa as single, beta as single) as single
declare function is_in_pl_control(angle as single, dist as single)  as integer
declare FUNCTION get_PL_input_rds() as single
declare function d_b_t_p (x1 as single, y1 as single, x2 as single, y2 as single) as single

declare sub draw_custom_line(x as single, y as single, rds as single, a_l as single, cl as Uinteger)

function d_b_t_p (x1 as single, y1 as single, x2 as single, y2 as single) as single
    return Sqr(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))
end function

Type proto_Joystick
    id as integer
    buttons as integer
    x as single
    y as single
End Type

dim shared Joystick as proto_Joystick
Joystick.id = 1

sub draw_custom_line(x as single, y as single, rds as single, a_l as single, cl as Uinteger)
    line (x, y)-(x + a_l * cos(rds), y + a_l *  -sin(rds)),cl
end sub

sub draw_arrow(x as single, y as single, rds as single, a_l as single, cl as Uinteger)
    line (x, y)-(x + a_l * cos(rds), y + a_l *  -sin(rds)),cl
    line (x + a_l * cos(rds), y + a_l *  -sin(rds))-(x + a_l/2 * cos(rds-0.5), y + a_l/2 *  -sin(rds-0.5)),cl
    line (x + a_l * cos(rds), y + a_l *  -sin(rds))-(x + a_l/2 * cos(rds+0.5), y + a_l/2 *  -sin(rds+0.5)),cl
end sub

type pl_proto
	speed as single
	default_speed as single
	x as single
	y as single
	rds as single
	rds_old as single
	rds_spin as single
	spin as single
	control as integer
	pwr_tackle as integer
end type

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

dim shared ball as ball_proto
dim shared pl as pl_proto
dim shared ball_rec(100) as pl_proto
dim shared as integer workpage, c,a
dim shared as single get_time

pl.x = SCREEN_W \ 2
pl.y = SCREEN_H \ 2
pl.rds = PI
pl.rds_old = pl.rds
pl.rds_spin = pl.rds
pl.control = 100
pl.default_speed = 3
pl.pwr_tackle = 20

c = 0
a = 0
workpage = 0

ScreenRes SCREEN_W,SCREEN_H,24' Sets the graphic mode
SCREENSET 1, 0
CLS

init_ball()
do
	update_ball()
	update_input()
	
	'GRAPHIC STATEMENTS
	screenlock ' Lock the screen
	screenset workpage, workpage xor 1 ' Swap work pages.
	cls
	screensync
	draw_pl()
	draw_ball()
	
	workpage xor = 1

	screenunlock
	SLEEP 20, 1

LOOP UNTIL MULTIKEY(SC_ESCAPE)

END 0

sub update_input()
	if is_PL_input_rds() then
	pl.speed = pl.default_speed
		pl.rds = get_PL_input_rds()
		pl.x += cos (pl.rds) * pl.speed
		pl.y += -sin (pl.rds) * pl.speed
		
	else
		pl.speed =0
	end if
	
	if multikey(SC_A) then pl.control -= 5
	if multikey(SC_D) then pl.control += 5
	if multikey(SC_W) then pl.pwr_tackle += 1
	if multikey(SC_S) then pl.pwr_tackle -= 1
	if multikey(SC_X) then pl.default_speed += 1
	if multikey(SC_Z) then pl.default_speed -= 1
	if multikey(SC_F) then
		ball.speed += 20
		ball.x = pl.x + cos(ball.rds) * 50
		ball.y = pl.y + -sin(ball.rds) * 50
	end if
	

end sub

sub draw_pl()
	
	
	draw_custom_line(pl.x, pl.y, pl.rds + (pl.control * PI_2) / 100, pl.pwr_tackle, rgb(0,255,255))
	draw_custom_line(pl.x, pl.y, pl.rds - (pl.control * PI_2) / 100, pl.pwr_tackle, rgb(0,255,255))
	'draw_custom_line(pl.x, pl.y, pl.rds - _
	'get_diff_angle(pl.rds, _abtp(pl.x, pl.y, ball.x, ball.y)) / 2.5, 100,rgb(127,127,127))
	'circle (pl.x, pl.y), pl.pwr_tackle, rgb(0,255,255), _
			'pl.rds + (pl.control * PI_4) / 100, _
			'pl.rds - (pl.control * PI_4) / 100
			
	if is_in_pl_control((pl.control * PI) / 100, pl.pwr_tackle) then
	circle (pl.x, pl.y), pl.pwr_tackle, rgb(127,127,127)
	
	end if
	
	draw_custom_line(pl.x, pl.y, pl.rds, 25, rgb(65,65,65))

	locate 8,10: print 	"PL CONTROL  :" + str(pl.control)
	locate 9,10: print 	"PL MAX SPEED:" + str(pl.default_speed)
	locate 10,10: print "PL SPEED:    " + str(pl.speed)
	locate 11,10: print "PL RDS:      " + str(pl.rds)
	locate 12,10: print "BALL SPEED:  " + str(ball.speed)
	locate 13,10: print "BALL RDS:    " + str(ball.rds)
	locate 14,10: print "DIFF RDS:    " + str(get_diff_angle(_abtp(pl.x, pl.y, ball.x, ball.y), pl.rds))
	locate 15,10: print "DIFF PL/RDS: " + str(get_diff_angle(pl.rds, get_PL_input_rds()) / 2.5)
	
	
end sub

sub init_ball()
	c = 0
	ball.x = SCREEN_W \ 2
	ball.y = SCREEN_W \ 2
	ball.speed = 0
	ball.rds = 0
	get_time = timer
end sub

sub draw_ball()
	Circle (ball.x,ball.y), B_WIDTH, , , , , F
    c+=1
	draw_arrow(ball.x, ball.y, ball.rds, B_WIDTH*8, rgb(127,127,127))
end sub

SUB update_ball()
    'limit check
    if 	ball.x < 0 then 		ball.x = 5 : ball.rds -= PI_2
    if 	ball.x > SCREEN_W then 	ball.x = SCREEN_W-5 : ball.rds += PI_2
    if 	ball.y < 0 then 		ball.y = 5 : ball.rds += PI
    if 	ball.y > SCREEN_H then ball.y = SCREEN_H -5 : ball.rds -= PI

	'ball control
	if is_in_pl_control((pl.control * PI_2) / 100, pl.pwr_tackle) then
	ball.x = pl.x + cos(ball.rds) * 1
	ball.y = pl.y  -sin(ball.rds) * 1
	
		ball.rds += get_diff_angle(pl.rds, _abtp(pl.x, pl.y, ball.x, ball.y)) / 2.5
		ball.x = pl.x + cos(ball.rds) * 5
		ball.y = pl.y + -sin(ball.rds) * 5
		ball.speed = pl.speed
	end if
	
    'move ball
	ball.x += cos(ball.rds)*ball.speed
	ball.y += -sin(ball.rds)*ball.speed
	ball.speed *= 0.98
	if ball.speed < 0.01 then ball.speed=0
END SUB


function is_in_pl_control (angle as single, dist as single) as Integer
    if  get_diff_angle(_abtp(pl.x, pl.y, ball.x, ball.y), pl.rds) < angle _
    and _dbtp (pl.x, pl.y, ball.x,ball.y) < dist then
        return 1
    else
        return 0
    end if
end function

function get_diff_angle(alfa as single, beta as single) as single
    
    if alfa <> beta  then
        'if alfa <> beta  then
        return _abtp(0,0,cos(alfa-beta),-sin(alfa-beta))
	else
		return 0
	end if
    'else
     '   return 0
    'end if
		'sin()
        'return -sin(alfa-beta)*cos(alfa-beta)
        '\cos(\alpha - \beta) = \cos(\alpha)\cos(\beta) + \sin(\alpha)\sin(\beta)
        'return -(cos(alfa)*cos(-beta)+sin(alfa)*sin(-beta))
    'else
     '   return 0
    'end if
end function

FUNCTION is_PL_input_rds() as integer
    'if the input is via joystick
    'if (Main_Menu_control_selected) then
        'GetJoystick(Joystick.id,Joystick.buttons,Joystick.x,Joystick.y)
        'if d_b_t_p(0,0,Joystick.x, Joystick.y) > 0.1 then
        '    return 1
        'else
        '    return 0
        'end if
   ' else
        If MultiKey(SC_DOWN) or MultiKey(SC_RIGHT)_
        or MultiKey(SC_UP) or MultiKey(SC_LEFT) then
            return 1
        else
            return 0
        end if
    'end if
end function


FUNCTION get_PL_input_rds() as single
    dim x as single
	dim y as single
	'if the input is via joystick
    'if (Main_Menu_control_selected) then
        'GetJoystick(Joystick.id,Joystick.buttons,Joystick.x,Joystick.y)
        'if _abtp(0,0,Joystick.x, Joystick.y) then return _abtp(0,0,Joystick.x, Joystick.y)
    'else
    'if is via keyboard
        if MultiKey(SC_UP) then y = -1
        if MultiKey(SC_DOWN) then y = 1
        if MultiKey(SC_RIGHT) then x = 1
        if MultiKey(SC_LEFT) then x = -1
        return _abtp(0,0,x,y)
    'end if
    
END FUNCTION

