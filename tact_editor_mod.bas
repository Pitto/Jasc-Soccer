load_default_tact()
init_pl_proprietes()

DO
    key_input_listener()
    screenlock ' Lock the screen
    screenset workpage, workpage xor 1 ' Swap work pages.
    cls
    
    draw_pitch()
    draw_pitch_lines()
    draw_pl_grid(tct_ed_PITCH_X, tct_ed_PITCH_Y, tct_ed_PITCH_W, tct_ed_PITCH_H)
    draw_ball_grid(tct_ed_PITCH_X, tct_ed_PITCH_Y, tct_ed_PITCH_W, tct_ed_PITCH_H)
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

end

static

declare sub draw_pitch_lines ( x as integer, _ 'x of the pitch
                            y as integer, _ 'y of the pitch
                            w as integer, _ ' whidth of the pitch
                            h as integer, _ 'height of the pitch
                            xm as integer, _ 'x middle of the pitch
                            ym as integer, _ 'y middle of the pitch
                            paw as integer, _ 'penalty area witdh
                            pah as integer, _ 'penalty area witdh
                            cxo as integer, _ 'x camera offset
                            cyo as integer) ' y camera offset

sub tct_ed_print_tact_data()
    'the "tct_tile" array indicates in wich tile the player must be with corresponding
    'ball position. For example: ball in tile 0 -> read from tct_tile(0) = player in tile 1
    dim tl as Integer = 0
    dim c as Integer = 0
    
    For c = 0 To 9
        for tl = 0 to 35
            if (Pl_selected = c) then
                draw string (x + (tl*21), y + h + 20 + c * 8), hex(tct_tile(Tactic_slot,c,tl)), RGB(100,100,100)
                if (tl = Ball_Current_Tile) then
                    draw string (x + (tl*21), y + h + 20 + c * 8), hex(tct_tile(Tactic_slot,c,tl)), C_WHITE
                end if
            else
                draw string (x + (tl*21), y + h + 20 + c * 8), hex(tct_tile(Tactic_slot,c,tl)), RGB(25,25,25)
            end if
        next tl
    Next c
    
    draw string (w + x + 32, 20), "Tactic Name " + str(tct_tile_label(Tactic_slot))
    draw string (w + x + 32, 40), "Tactic Slot " + str(Tactic_slot)
    draw string (w + x + 32, 60), "PL Tile     " + hex(Pl_Current_Tile)
    draw string (w + x + 32, 80), "Ball Tile   " + str(Ball_Current_Tile)
    draw string (w + x + 32, 100), "Pl Selected " + str(Pl_Selected)

    'instructions
    draw string (w + x + 32, 200), "CURSOR KEYS - Move the ball", RGB(63,63,63)
    draw string (w + x + 32, 220), "MOUSE WHEEL - Select previous player", RGB(63,63,63)
    draw string (w + x + 32, 240), "MOUSE CLICK - Set new tile for the player", RGB(63,63,63)
    draw string (w + x + 32, 260), "KEYS [0-9]  - Select a Tactic Slot", RGB(63,63,63)
    draw string (w + x + 32, 280), "CTRL + C    - Copy Pl pos. on Clipboard", RGB(63,63,63)
    draw string (w + x + 32, 300), "CTRL + V    - Paste Pl pos. from Clipboard",RGB(63,63,63)
    draw string (w + x + 32, 320), "S           - Save current Tactic Slot",RGB(63,63,63)
    draw string (w + x + 32, 340), "A           - Save all Tactic Slots",RGB(63,63,63)
    draw string (w + x + 32, 360), "Attack way is top-down",RGB(63,63,63)
    
    for c = 0 to 9
        if c = Tactic_slot then
            line (SCREEN_W - 72, 16 + c*20)-(SCREEN_W - 16, 30 + c*20), RGB(0,0,127), BF
            draw string (SCREEN_W - 64, 20 + (c*20)), str(c) + " " + str(tct_tile_label(c)), C_WHITE
        else
            draw string (SCREEN_W - 64, 20 + (c*20)), str(c) + " " + str(tct_tile_label(c)), RGB(63,63,63)
        end if
    next c
    
    if Has_Saved then
        line (w + x + 32, y + h - 32)-_
             (SCREEN_W - 32, y + h), RGB(127,0,0), BF
        line (w + x + 32, y + h - 32)-_
             (SCREEN_W - 32, y + h), RGB(255,0,0), B
        draw string (SCREEN_W - w + x + (len("DATA SUCCESSFULLY SAVED")*8)/2,_
                    h + y - 20), "DATA SUCCESSFULLY SAVED", C_WHITE
        if timer - Has_saved_display_time > 3 then Has_Saved = 0
    end if
END SUB


sub tct_ed_save_data(slot_to_save as integer)
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
        x_trg = (tile_row * w\16) + x + w\32
        y_trg = h - (tile_col * h\16) + h\16 
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

sub tct_ed_init_pl_proprietes()
    dim c as integer
    for c = 0 to 9
        pl(c).x = tct_ed_x + w\2
        pl(c).y = y + h\2
        pl(c).speed = 15
        pl(c).rds = 0
    next c
END SUB

sub tct_ed_pos_copy()
    dim c as integer
    for c = 0 to 9
        copypaste(c) = tct_tile(Tactic_slot, c,Ball_Current_Tile)
    next c
END SUB

sub tct_ed_pos_paste()
    dim c as integer
    if Has_copyed then
        for c = 0 to 9
            tct_tile(Tactic_slot, c,Ball_Current_Tile) = copypaste(c) 
        next c
    end if
END SUB

sub tct_ed_key_input_listener()

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
    if MULTIKEY(SC_RIGHT) and Ball_Current_Tile + 1 < 36 and (Ball_Current_Tile + 1)mod 6 <>0 then
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
