#include "fbgfx.bi"
'this is the language I use
Using FB
'calculate angle between two points
#macro _abtp (x1,y1,x2,y2)
    -Atan2(y2-y1,x2-x1)
#endmacro



function d_b_t_p (x1 as single, y1 as single, x2 as single, y2 as single) as single
    return Sqr(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))
end function

sub draw_arrow(x as single, y as single, rds as single, a_l as single, cl as Uinteger)
    line (x, y)-(x + a_l * cos(rds), y + a_l *  -sin(rds)),cl
    line (x + a_l * cos(rds), y + a_l *  -sin(rds))-(x + 10 * cos(rds-0.5), y + 10 *  -sin(rds-0.5)),cl
    line (x + a_l * cos(rds), y + a_l *  -sin(rds))-(x + 10 * cos(rds+0.5), y + 10 *  -sin(rds+0.5)),cl
end sub

dim shared as integer workpage, c,a
workpage = 0

Screen 12
'
'Dim x As Single
'Dim y As Single
'Dim buttons As Integer
'Dim result As Integer
'Dim a As Integer
'
'Const JoystickID = 0

Type proto_Joystick
    id as integer
    buttons as integer
    x as single
    y as single
End Type

Type proto_obj
    x as single
    y as single
    rds as single
    speed_max as single
    speed as single
End Type

dim shared Joystick as proto_Joystick
dim shared hero as proto_obj

Joystick.id = 0

hero.x = 200
hero.y = 200
hero.rds = 0
hero.speed_max = 5

'This line checks to see if the joystick is ok.

If GetJoystick(Joystick.id,Joystick.buttons,Joystick.x,Joystick.y) Then 
    Print "Joystick doesn't exist or joystick error."
    Print
    Print "Press any key to continue."
    Sleep
    End
End If
'
Do
    If (Joystick.buttons And (1 Shl 0)) Then Print "Button pressed.    "
    hero.rds = _abtp(0,0,Joystick.x, Joystick.y)
    if d_b_t_p(0,0,Joystick.x, Joystick.y) > 0.1 then
    hero.speed = d_b_t_p(0,0,Joystick.x, Joystick.y)*hero.speed_max
else
    hero.speed = 0
    end if
    'hero.speed_max *= hero.speed
    hero.x += hero.speed * cos(hero.rds)
    hero.y += hero.speed * -sin(hero.rds)
    
    GetJoystick(Joystick.id,Joystick.buttons,Joystick.x,Joystick.y)
    screenlock ' Lock the screen
	screenset workpage, workpage xor 1 ' Swap work pages.
	cls
	screensync
	
    Locate 1,1
    Print " x:" ;Joystick.x;" y:";Joystick.y;" Buttons:";Joystick.buttons,"","",""
    circle (hero.x,hero.y),10
    draw_arrow(hero.x, hero.y, hero.rds, hero.speed*10,10)
   screenunlock
	SLEEP 20, 1

LOOP UNTIL MULTIKEY(SC_ESCAPE)

END 0
