' a must
#include "fbgfx.bi"
#define APP_NAME "Tactic Editor for JASC SOCCER by PITTO"
#define APP_VERSION "0.1"
'this is the language I use
Using FB
const SCREEN_W as integer = 800
const SCREEN_H as integer = 600
const PI as single = 3.14159265f
const PITCH_W as integer = 388
const PITCH_H as integer = 448
const PITCH_X as integer = 20
const PITCH_Y as integer = 20
const PITCH_PENALTY_AREA as Single = PITCH_W*0.30 'see update players sub for details
'net dimensions
const PITCH_NET_W as Integer = 100
const PITCH_NET_H as Integer = 25
const PITCH_MIDDLE_W as Integer = PITCH_W\2 + PITCH_X
const PITCH_MIDDLE_H as Integer = PITCH_H\2 + PITCH_Y
'net positions
const PITCH_NET_TOP_Y as Integer = PITCH_W\2+PITCH_Y
const PITCH_NET_BOTTOM_Y as Integer = PITCH_W\2+PITCH_Y+PITCH_H
const TILES as integer = 36
const PL_TILES as integer = 216
dim shared TILE_W as integer = PITCH_W\6
dim shared TILE_H as integer = PITCH_H\6
DIM SHARED Workpage AS INTEGER = 0 ' graphic buffer

dim shared ball_x as integer = PITCH_W + 20
dim shared ball_y as integer = PITCH_Y + 20
dim shared Ball_Current_Tile as integer = 0

dim shared Tactic_slot as integer = 0
dim shared Pl_Current_Tile as integer = 0
dim shared Pl_Selected as integer = 0

'[0-9]Tactic slot
'[0-9]Player slot
'[0-35]Tile slot
dim shared tct_tile(0 to 9, 0 to 9, 0 to 35) as Integer 'tactic array
dim shared tct_tile_label(10) as String*3 = {"442","433","352","532","424","451","541","swp","att","def"} 

'label of the tactic slot selected
dim shared copypaste(10) as Integer 'store the pl position for copy & paste

dim shared Has_copyed as Ubyte = 0
dim shared Has_saved as Ubyte = 0
dim shared Has_saved_display_time as Double
#define PL_SPRITES_TOT_N 136

DIM SHARED Pl_sprite_0(PL_SPRITES_TOT_N) AS ANY PTR ' A pointer that points to a memory buffer (for plrs sprites)
DIM SHARED Pl_sprite_1(PL_SPRITES_TOT_N) AS ANY PTR ' A pointer that points to a memory buffer (for plrs sprites)
DIM SHARED Gk_sprite(PL_SPRITES_TOT_N) AS ANY PTR ' A pointer that points to a memory buffer (for plrs sprites)
DIM SHARED Ball_sprite(15) AS ANY PTR '  A pointer that points to a memory buffer (for ball sprites)
DIM SHARED Net_sprite(2) AS ANY PTR '  A pointer that points to a memory buffer (for net sprites)
DIM SHARED Pitch_sprite(2) AS ANY PTR '  A pointer that points to a memory buffer (for pitch sprites)
DIM SHARED Banner_sprite AS ANY PTR 'idem for banner
DIM SHARED Shadowed_sprite AS ANY PTR 'idem for shadowed sprite

declare sub key_input_listener() 'checks if some input key are pressed
declare sub pos_copy()'copy on clipboard the pl positions 
declare sub pos_paste() 'paste the pl positions
declare sub draw_players()
declare sub init_pl_proprietes()
declare sub draw_pitch_lines()
declare sub update_pl_on_tact_tile()
declare sub draw_ball_grid()
declare SUB load_bitmap()
declare SUB draw_pitch()
declare sub draw_pl_grid()
declare SUB load_default_tact()
declare function get_ball_tile() as integer
declare SUB print_tact_data()
declare SUB delete_bitmap()
declare SUB save_data(slot_to_save as integer)
declare function a_b_t_p (x1 as single, y1 as single, x2 as single, y2 as single) as single
declare function d_b_t_p (x1 as single, y1 as single, x2 as single, y2 as single) as single

Type mouse
    As Integer res
    As Integer x, y, wheel, clip, old_wheel, diff_wheel
    Union
        buttons As Integer
        Type
            Left:1 As Integer
            Right:1 As Integer
            middle:1 As Integer
        End Type
    End Union
End Type

TYPE Proto_player
    As single x, y, rds
    as single speed
END TYPE

Dim shared m as mouse
Dim shared pl(10) as Proto_player

ScreenRes SCREEN_W,SCREEN_H,24,2,0 ' Sets the graphic mode
SCREENSET 1, 0
cls
SetMouse (-1,-1,0)
load_bitmap()
load_default_tact()
init_pl_proprietes()

DO
    key_input_listener()
    screenlock ' Lock the screen
    screenset workpage, workpage xor 1 ' Swap work pages.
    cls
    
    draw_pitch()
    draw_pitch_lines()
    draw_pl_grid()
    draw_ball_grid()
    update_pl_on_tact_tile()
    draw_players()
    
    
    line (m.x-5, m.y)-(m.x+5, m.y)
    line (m.x, m.y-5)-(m.x, m.y+5)
    
    print_tact_data()

    workpage xor = 1 ' Swap work pages.
    'locate 10,10 : print str(get_ball_tile())
    screenunlock
    sleep 50,1
    
LOOP UNTIL MULTIKEY(SC_ESCAPE)

delete_bitmap()

end

function get_ball_tile() as integer
    dim as integer x2, y2, x, y, col, row, tile 
    tile = 0
    for row = 0 to 5 step 1
        for col = 0 to 5 step 1
            'draw the grid
            x = col * PITCH_W \ 6 + PITCH_X 
            y = row * PITCH_H \ 6 + PITCH_Y
            x2 = x + PITCH_W \ 6
            y2 = y + PITCH_H \ 6
            'check if the ball is into a box of the grid
            if (ball_x > x) and (ball_x < x2)_
            and (ball_y>y) and (ball_y < y2) then
            exit for, for
            end if
            tile +=1
        next col
    next row
    return tile
end function

sub draw_ball_grid()
    dim as integer x, y, x2,y2, col, row, count
    count = 0
    for row = 0 to 5 step 1
        for col = 0 to 5 step 1
            'draw the grid
            x = col * PITCH_W \ 6 + PITCH_X 
            y = row * PITCH_H \ 6+ PITCH_Y
            x2 = x + PITCH_W \ 6
            y2 = y + PITCH_H \ 6
            'line (x,y)-(x2,y2),rgb(50,50,50),b, &b001100110011
            if count = Ball_Current_Tile then
                line (x,y)-(x2,y2),rgb(200,200,200),b
                PUT (x + PITCH_W \ 12 - 4,y + PITCH_W \ 12 - 4), ball_sprite(12), trans
            end if
            
            'check if the ball is into a box of the grid and fill it using paint function
            count +=1
        next col
    next row
end sub

sub draw_pl_grid()
    dim as integer x, y, x2,y2, col, row, count,c,tl
    count = 0
    for row = 0 to 15 step 1
        for col = 0 to 15 step 1
            'draw the grid
            x = col * PITCH_W \ 16 + PITCH_X 
            y = row * PITCH_H \ 16+ PITCH_Y
            x2 = x + PITCH_W \ 16
            y2 = y + PITCH_H \ 16
            line (x,y)-(x2,y2),rgb(125,125,125),b, &b0001000100010001
            if  m.x > x and m.x <= x2 and m.y > y and m.y <= y2 then
                line (x,y)-(x2,y2),&hFFFFFF,b
                draw string (x,y), hex(count)
                Pl_Current_Tile = count
            end if
            count +=1
        next col
    next row
    

    

    
end sub

SUB draw_pitch_lines()
    'drawing the pitch's border lines

    Line (PITCH_X , PITCH_Y )-(PITCH_W+PITCH_X, PITCH_H+PITCH_Y),&hFFFFFF,b
    
    'middle line and circle
    Line (PITCH_X , PITCH_MIDDLE_H )-(PITCH_X + PITCH_W , PITCH_MIDDLE_H ),RGB (255,255,255)
    Circle (PITCH_MIDDLE_W , PITCH_Y + PITCH_H\2), 84,RGB (255,255,255),,,0.8
    Circle (PITCH_MIDDLE_W , PITCH_Y + PITCH_H\2), 2,RGB (255,255,255),,,,F
    
    'Top penalty area
    Line    (PITCH_MIDDLE_W - PITCH_PENALTY_AREA ,_
    PITCH_Y )-_
    (PITCH_MIDDLE_W + PITCH_PENALTY_AREA ,_
    PITCH_Y + PITCH_PENALTY_AREA/1.5 ), RGB (255,255,255),B
    'Top Gk area
    Line    (PITCH_MIDDLE_W - PITCH_PENALTY_AREA/2 ,_
    PITCH_Y )-_
    (PITCH_MIDDLE_W + PITCH_PENALTY_AREA/2 ,_
    PITCH_Y + PITCH_PENALTY_AREA/4 ), RGB (255,255,255),B
    'top penalty dish
    Circle (PITCH_MIDDLE_W , PITCH_Y + PITCH_PENALTY_AREA/1.5 - 48 ), 2,RGB (255,255,255),,,,F
    'top penalty circle
    Circle (PITCH_MIDDLE_W , PITCH_Y + PITCH_PENALTY_AREA/1.5 - 48 ),_
    84,RGB (255,255,255),3.75,5.65
    
    'bottom penalty area
    Line    (PITCH_MIDDLE_W - PITCH_PENALTY_AREA ,_
    PITCH_Y + PITCH_H )-_
    (PITCH_MIDDLE_W + PITCH_PENALTY_AREA ,_
    PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/1.5 ), RGB (255,255,255),B
    'bottom Gk area
    Line    (PITCH_MIDDLE_W - PITCH_PENALTY_AREA/2 ,_
    PITCH_Y + PITCH_H )-_
    (PITCH_MIDDLE_W + PITCH_PENALTY_AREA/2 ,_
    PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/4 ), RGB (255,255,255),B
    'bottom penalty dish
    Circle (PITCH_MIDDLE_W , PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/1.5 + 48 ), 2,RGB (255,255,255),,,,F
    'bottom penalty circle        
    Circle (PITCH_MIDDLE_W , PITCH_Y + PITCH_H - PITCH_PENALTY_AREA/1.5 + 48 ),_
    84,RGB (255,255,255),0.61,2.52
    
    Circle (PITCH_X , PITCH_Y ), 9, RGB(255,255,255),pi*1.5,0
    Circle (PITCH_X , PITCH_Y + PITCH_H ), 9, RGB(255,255,255),0,pi/2
    Circle (PITCH_X+PITCH_W , PITCH_Y ), 9, RGB(255,255,255),pi,pi*1.5
    Circle (PITCH_X+PITCH_W , PITCH_Y + PITCH_H ), 9, RGB(255,255,255),pi/2,pi
    
END SUB

SUB load_bitmap()
    dim img_x as integer
    dim img_w as integer
    dim img_y as integer
    dim img_h as integer
    dim count as Integer
    dim action as Integer
    dim offset as integer
    
    'loading players sprites------------------------------------------------------------
    img_w = 21
    img_h = 25
    img_x = 0
    img_y = 0
    'load and stores the sprites into two array
    'one array for each team… then with paint_kits sub
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
    pitch_sprite(0) = IMAGECREATE(32,32)
    GET (0,0)-(31,31), pitch_sprite(0)
    pitch_sprite(1) = IMAGECREATE(32,32)
    GET (32,0)-(63,31), pitch_sprite(1)
    
    'loading advertising banner
    BLOAD "img\banner.bmp",0
    banner_sprite = IMAGECREATE(256,24)
    GET (0,0)-(255,23), banner_sprite
    
    'loading the shadowet texture
    BLOAD "img\shadowed.bmp",0
    shadowed_sprite = IMAGECREATE(32,32)
    GET (0,0)-(31,31), shadowed_sprite
    
END SUB



SUB draw_pitch()
    dim as Integer pitch_rows, pitch_cols
    dim as Integer a, b
    pitch_rows = PITCH_H \ 32 
    pitch_cols = PITCH_W \ 32 
    'drawing the grass
    for a = 0 to pitch_rows -1
        for b = 0 to pitch_cols -1
           PUT (PITCH_X + (b*32), PITCH_Y +(a*32)),pitch_sprite(0),Pset
        next b
    next a
END SUB

SUB load_default_tact()
    'the "tct_tile" array indicates in wich tile the player must be with corresponding
    'ball position. For example: ball in tile 0 -> read from tct_tile(0) = player in tile 1
    Dim ff As UByte
    dim as integer slot, c, tl
    dim path as string*32
    ff = FreeFile
    
    for slot = 0 to 9
        path = "_data/" + tct_tile_label(slot) +".tac"
        Open path For input As #ff
        for c = 0 to 9
            for tl = 0 to 35
                Input #ff, tct_tile(slot,c,tl)
            next tl
        next c
        Close #ff
    next slot
    
END SUB

SUB print_tact_data()
    'the "tct_tile" array indicates in wich tile the player must be with corresponding
    'ball position. For example: ball in tile 0 -> read from tct_tile(0) = player in tile 1
    dim tl as Integer = 0
    dim c as Integer = 0
    
    For c = 0 To 9
        for tl = 0 to 35
            if (Pl_selected = c) then
                draw string (PITCH_X + (tl*21), PITCH_Y + PITCH_H + 20 + c * 8), hex(tct_tile(Tactic_slot,c,tl)), RGB(100,100,100)
                if (tl = Ball_Current_Tile) then
                    draw string (PITCH_X + (tl*21), PITCH_Y + PITCH_H + 20 + c * 8), hex(tct_tile(Tactic_slot,c,tl)), RGB(255,255,255)
                end if
            else
                draw string (PITCH_X + (tl*21), PITCH_Y + PITCH_H + 20 + c * 8), hex(tct_tile(Tactic_slot,c,tl)), RGB(25,25,25)
            end if
        next tl
    Next c
    
    draw string (SCREEN_W - len(str(APP_NAME + " ver " + APP_VERSION))*8 - 8, SCREEN_H - 12),_
    APP_NAME + " ver. " +APP_VERSION, RGB(127,127,127)
    
    draw string (PITCH_W + PITCH_X + 32, 20), "Tactic Name " + str(tct_tile_label(Tactic_slot))
    draw string (PITCH_W + PITCH_X + 32, 40), "Tactic Slot " + str(Tactic_slot)
    draw string (PITCH_W + PITCH_X + 32, 60), "PL Tile     " + hex(Pl_Current_Tile)
    draw string (PITCH_W + PITCH_X + 32, 80), "Ball Tile   " + str(Ball_Current_Tile)
    draw string (PITCH_W + PITCH_X + 32, 100), "Pl Selected " + str(Pl_Selected)

    'instructions
    draw string (PITCH_W + PITCH_X + 32, 200), "CURSOR KEYS - Move the ball", RGB(63,63,63)
    draw string (PITCH_W + PITCH_X + 32, 220), "MOUSE WHEEL - Select previous player", RGB(63,63,63)
    draw string (PITCH_W + PITCH_X + 32, 240), "MOUSE CLICK - Set new tile for the player", RGB(63,63,63)
    draw string (PITCH_W + PITCH_X + 32, 260), "KEYS [0-9]  - Select a Tactic Slot", RGB(63,63,63)
    draw string (PITCH_W + PITCH_X + 32, 280), "CTRL + C    - Copy Pl pos. on Clipboard", RGB(63,63,63)
    draw string (PITCH_W + PITCH_X + 32, 300), "CTRL + V    - Paste Pl pos. from Clipboard",RGB(63,63,63)
    draw string (PITCH_W + PITCH_X + 32, 320), "S           - Save current Tactic Slot",RGB(63,63,63)
    draw string (PITCH_W + PITCH_X + 32, 340), "A           - Save all Tactic Slots",RGB(63,63,63)
    draw string (PITCH_W + PITCH_X + 32, 360), "Attack way is top-down",RGB(63,63,63)
    
    for c = 0 to 9
        if c = Tactic_slot then
            line (SCREEN_W - 72, 16 + c*20)-(SCREEN_W - 16, 30 + c*20), RGB(0,0,127), BF
            draw string (SCREEN_W - 64, 20 + (c*20)), str(c) + " " + str(tct_tile_label(c)), RGB(255,255,255)
        else
            draw string (SCREEN_W - 64, 20 + (c*20)), str(c) + " " + str(tct_tile_label(c)), RGB(63,63,63)
        end if
    next c
    
    if Has_Saved then
        line (PITCH_W + PITCH_X + 32, PITCH_Y + PITCH_H - 32)-_
             (SCREEN_W - 32, PITCH_Y + PITCH_H), RGB(127,0,0), BF
        line (PITCH_W + PITCH_X + 32, PITCH_Y + PITCH_H - 32)-_
             (SCREEN_W - 32, PITCH_Y + PITCH_H), RGB(255,0,0), B
        draw string (SCREEN_W - PITCH_W + PITCH_X + (len("DATA SUCCESSFULLY SAVED")*8)/2,_
                    PITCH_H + PITCH_Y - 20), "DATA SUCCESSFULLY SAVED", RGB(255,255,255)
        if timer - Has_saved_display_time > 3 then Has_Saved = 0
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
    If shadowed_sprite Then ImageDestroy shadowed_sprite
END SUB

SUB save_data(slot_to_save as integer)
    Dim path as String
    Dim ff As UByte
    dim as integer slot, c, tl
    ff = FreeFile
    'save all tactics
    if slot_to_save = -1 then
        for slot = 0 to 9
            path = "_data/" + tct_tile_label(slot) + ".tac"
            Open path For Output As #ff
            for c = 0 to 9
                for tl = 0 to 35
                    Write #ff, tct_tile(slot,c, tl)
                next tl
            next c
            Close #ff
        next slot
    'save only the selected tactics
    else
        path = "_data/" + tct_tile_label(tactic_slot) + ".tac"
        Open path For Output As #ff
        for c = 0 to 9
            for tl = 0 to 35
                Write #ff, tct_tile(tactic_slot,c, tl)
            next tl
        next c
        Close #ff
   end if
END SUB

SUB update_pl_on_tact_tile()
    dim as single x_trg, y_trg
    dim as integer id, tile_row, tile_col, tile, c

    'routine for all players
    
    for c = 0 to 9
        'get the right tile to reach
        tile = tct_tile(Tactic_slot, c,Ball_Current_Tile)
        'get the row and the column
        tile_row = tile MOD 16
        tile_col = 16-int(tile\16)
        'convert in xy coords
        x_trg = (tile_row * PITCH_W\16) + PITCH_X + PITCH_W\32
        y_trg = PITCH_H - (tile_col * PITCH_H\16) + PITCH_H\16 
        'returns te right rds to the tile
        pl(c).rds = a_b_t_p (pl(c).x,pl(c).y,x_trg,y_trg)
        'if the distance is less than 5 then the pl has reached the position
        if d_b_t_p(pl(c).x,pl(c).y,x_trg,y_trg) < 5 then
            pl(c).speed = 0
            pl(c).x = x_trg
            pl(c).y = y_trg
        else
            pl(c).speed = d_b_t_p(pl(c).x,pl(c).y,x_trg,y_trg) / 4
            'update the pl position moving him
            pl(c).x +=  cos(pl(c).rds) * pl(c).speed 
            pl(c).y +=  -sin(pl(c).rds) * pl(c).speed
        end if
    next c
END SUB

SUB draw_players()
    dim c as integer
    For c = 0 To 9
        if c = Pl_Selected and Timer*7 mod 2 = 0 then
            Circle (pl(c).x, pl(c).y),12, &h3F9E4F,,,,F
        end if
            Circle (pl(c).x, pl(c).y),8, &h073C10,,,,F
        
        PUT (pl(c).x-10,pl(c).y-20),pl_sprite_1(102), trans
        draw string (pl(c).x-5,pl(c).y-30), str(c + 2)
        
    Next c
END SUB

function a_b_t_p (x1 as single, y1 as single, x2 as single, y2 as single) as single
    if (x1>x2) then
        if (y1>y2) then
            return asin ((x1-x2)/Sqr(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))) + PI/2
        else
            return (2 * PI/4)*3 - asin ((x1-x2)/Sqr(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2))))  
        end if
    else
        if (y1>y2) then
            return PI/2 - asin ((x2-x1)/Sqr(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2))))
        else
            return (2 * PI/4)*3  - asin ((x1-x2)/Sqr(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2))))
        end if
    end if
end function

function d_b_t_p (x1 as single, y1 as single, x2 as single, y2 as single) as single
    return Sqr(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))
end function

SUB init_pl_proprietes()
    dim c as integer
    for c = 0 to 9
        pl(c).x = PITCH_X + PITCH_W\2
        pl(c).y = PITCH_Y + PITCH_H\2
        pl(c).speed = 15
        pl(c).rds = 0
    next c
END SUB

SUB pos_copy()
    dim c as integer
    for c = 0 to 9
        copypaste(c) = tct_tile(Tactic_slot, c,Ball_Current_Tile)
    next c
END SUB

SUB pos_paste()
    dim c as integer
    if Has_copyed then
        for c = 0 to 9
            tct_tile(Tactic_slot, c,Ball_Current_Tile) = copypaste(c) 
        next c
    end if
END SUB

SUB key_input_listener()

    dim e As EVENT
    If (ScreenEvent(@e)) Then
        Select Case e.type
        Case EVENT_KEY_RELEASE
            If (e.scancode = SC_S) Then
                Save_data(tactic_slot)
                Has_Saved = 1
                Has_saved_display_time = Timer
            End If
            If (e.scancode = SC_A) Then
                Save_data(-1)
                Has_Saved = 1
                Has_saved_display_time = Timer
            End If
        End Select
    End If
    'ball tile position update by user
    if MULTIKEY(SC_RIGHT) and Ball_Current_Tile + 1 < 36 and (Ball_Current_Tile + 1 )mod 6 <>0 then
        Ball_Current_Tile +=1
    end if
    if MULTIKEY(SC_LEFT) and Ball_Current_Tile - 1 >= 0 and Ball_Current_Tile mod 6 <>0  then
        Ball_Current_Tile -=1
    end if
    if MULTIKEY(SC_UP) and Ball_Current_Tile - 6 >= 0 then
        Ball_Current_Tile -=6
    end if
    if MULTIKEY(SC_DOWN) and Ball_Current_Tile + 6 < 36 then
        Ball_Current_Tile +=6
    end if
    'pl selected updated by user
    m.res = GetMouse( m.x, m.y, m.wheel, m.buttons, m.clip)
    m.diff_wheel = m.old_wheel - m.wheel
    m.old_wheel = m.wheel
    Pl_Selected = Pl_Selected + m.diff_wheel
    if Pl_Selected < 0 then Pl_Selected = 0
    if Pl_Selected > 9 then Pl_Selected = 9
    'on clik refresh the field
    if m.buttons = 1 then tct_tile(Tactic_slot, Pl_selected, Ball_Current_Tile) = Pl_Current_Tile
    'tactic slot selected updated by user
    if MULTIKEY(SC_0) then Tactic_slot = 0
    if MULTIKEY(SC_1) then Tactic_slot = 1
    if MULTIKEY(SC_2) then Tactic_slot = 2
    if MULTIKEY(SC_3) then Tactic_slot = 3
    if MULTIKEY(SC_4) then Tactic_slot = 4
    if MULTIKEY(SC_5) then Tactic_slot = 5
    if MULTIKEY(SC_6) then Tactic_slot = 6
    if MULTIKEY(SC_7) then Tactic_slot = 7
    if MULTIKEY(SC_8) then Tactic_slot = 8
    if MULTIKEY(SC_9) then Tactic_slot = 9
    
    'copy and paste pl postion along the ball tiles
    if MULTIKEY(SC_C) and MULTIKEY(SC_CONTROL) then pos_copy():Has_copyed = 1
    if MULTIKEY(SC_V) and MULTIKEY(SC_CONTROL) then pos_paste()
    
END SUB
