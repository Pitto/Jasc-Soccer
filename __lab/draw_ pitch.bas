type pitch_proto
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

dim pitch as pitch_proto
pitch.x = 20
pitch.y = 20
pitch.w = 300
pitch.h = 400
pitch.xm = pitch.w \ 2 + pitch.x
pitch.ym = pitch.h \ 2 + pitch.y
pitch.paw = pitch.w \ 3 'half penalty area width
pitch.pah = pitch.h \ 6 'penalty area height
pitch.pac = pitch.w \ 6 'penalty area circle diameter
pitch.padw = 2 'penalty dish diameter
pitch.padd = pitch.pah \ 2'penalty dish distance from net
pitch.gkw = pitch.paw \ 2 'half goalkeeper area width
pitch.gkh = pitch.pah \ 3 'goalkeeper area height
pitch.cdw = 2 'corner dish diameter

screen 18
draw_pitch_lines ( pitch.x, pitch.y, pitch.w, pitch.h,_
                     pitch.xm, pitch.ym, pitch.paw, pitch.pah,_
                     pitch.pac, pitch.padw, pitch.padd, pitch.gkw, _
                     pitch.gkh, 10, 0, 0)

sleep

