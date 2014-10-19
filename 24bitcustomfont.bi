' *****************************************************************
' Custom Font Printing Routine ver.1 by Lachie Dazdarian; Aug.2007.
' For 8bit color depth mode. Refer to readme.txt for more details.
' Attach this module on your source code with #include "24bitcustomfont.bi"
' *****************************************************************

' The font data type
TYPE FontType
FontBuffer(97) AS ANY PTR ' Memory buffer for each character.
FontWidth(97) AS INTEGER         ' Will store width of each character.
FontHeight AS INTEGER            ' Will hold the font's unique height.
END TYPE

' The sub declarations.
DECLARE SUB PrintFont (xx AS INTEGER, yy AS INTEGER, CText AS STRING, BYREF PrintSFont AS FontType, spacing AS INTEGER, PMode AS INTEGER)
DECLARE SUB PrintAlphaFont (xx AS INTEGER, yy AS INTEGER, CText AS STRING, BYREF PrintTFont AS FontType, spacing AS INTEGER, pblender AS INTEGER)
DECLARE SUB LoadFont (fontimage AS STRING, BYREF ImportFont AS FontType, widthmode AS INTEGER)
DECLARE SUB LoadBFont (fontimage AS STRING, BYREF ImportBFont AS FontType, widthmode AS INTEGER)

' Declare your font arrays with 'DIM SHARED FontName AS FontType'
' Load fonts with 'LoadFont FontImage$, FontName, widthmode'
' widthmode = 1 => every character features its own width
' (majority of fonts should be loaded on this way).
' widthmode = 2 => all characters feature a unique width
' (only to be applied on fonts whose characters are placed
' in the font grid(inside a BMP image) on a specific 
' way or the result won't be satisfactory).

' Print text in a specific font with 
' 'PrintFont xpos, ypos, "Your Text", FontName, spacing, PMode'
' FontName - name of the font array(you can declare more of them)
' PMode = 1 => print with TRANS
' PMode = 2 => print with PSET
' spacing - spacing between characters
' Be sure to initiate a graphic mode before loading fonts!

SUB LoadFont (fontimage AS STRING, BYREF ImportFont AS FontType, widthmode AS INTEGER)

' This sub loads fonts saved in a grid consisted of 22*22 pixels
' large blocks.
' To use this sub you need to initiate a graphic mode first,
' with a minimum of 320 of width and 200 or height or you'll
' print garbage. Also, use 8bit color depth and load 8bit
' color depth BMP images!

' widthmode flags if all characters will feature a unique width
' (widthmode = 2) or each one will feature it's own(widthmode = 1).
IF widthmode<>1 AND widthmode<>2 THEN widthmode = 1

' Display page 0 while working on page 1.
SCREENSET 1, 0
CLS
' Load the font from fontimage$
BLOAD fontimage, 0

' Store the background color
'color0 = POINT(277,1)

' Default width of spacing(character 0; when you input 
' SPACE in your string; also, if you specify unique width
' it will be extracted from here - reference box in the
' BMP file).
ImportFont.FontWidth(0) = -1
' Deafult height of the font characters.
ImportFont.FontHeight = -1

' This checks the reference box for the inputted width of spacing
' (character 0).
FOR seekspace AS INTEGER = 2 TO 23
IF Point(seekspace+276, 1) <> POINT(277,1) AND ImportFont.FontWidth(0) = -1 THEN ImportFont.FontWidth(0) = seekspace - 1
NEXT seekspace

' This checks the reference box for the inputted height of the font
' characters.
FOR seekheight AS INTEGER = 2 TO 23
IF Point(298, seekheight) <> POINT(277,1) AND ImportFont.FontHeight = -1 THEN ImportFont.FontHeight = seekheight - 1
NEXT seekheight

DIM TempWidth AS UBYTE
' Loop through the entire font.
FOR frow AS INTEGER = 0 TO 7
FOR fcolumn AS INTEGER = 0 TO 11

' ********************************
' Extract the width of each character by seeking color other
' than color0 going from up to down and from right to left 
' in the current character's box. If the loop doesn't find
' other color than the background color in the current
' "seeking" line(going from the top of the character's box
' down to the value set by the font height) witdh is reduced 
' by 1 and we seek the next line to the left. Once a color
' other than color 0(blank space) is found last change
' of width is set as final.
' TempWidth is reduced until the loop finds the
' character(pixel made of color higher than color0.
TempWidth = 22
repeatloop:
FOR seekwidth AS INTEGER = 1 TO ImportFont.FontHeight
IF Point((fcolumn*23)+TempWidth, (frow*23)+seekwidth) <> POINT(277,1) THEN EXIT FOR 
IF seekwidth = ImportFont.FontHeight THEN   ' POINT reached the height of the character 
TempWidth = TempWidth - 1                   ' (reduce the width and seek in the
                                            ' next left vertical line).
IF TempWidth > 1 THEN GOTO repeatloop:
END IF
NEXT seekwidth
' ********************************

' If widthmode = 2 the all the characters have the same width 
' which equals the width of SPACE key(spacing in the inputted string).
IF widthmode = 2 THEN TempWidth = ImportFont.FontWidth(0)

' Get the current character from appropriate coordinates and
' store it on appropriate position(FontBuffer).
ImportFont.FontBuffer((fcolumn+1)+(frow*12)-1) = IMAGECREATE (23,23)
GET (1+(fcolumn*23),1+(frow*23))-((fcolumn*23)+TempWidth,(frow*23)+ImportFont.FontHeight), ImportFont.FontBuffer(((fcolumn+1)+(frow*12)-1))

' This recaptures the first character in the font(blank space).
IF fcolumn = 0 AND frow = 0 THEN GET (1,1)-(ImportFont.FontWidth(0), ImportFont.FontHeight), ImportFont.FontBuffer(0)
    
' Flag the current character's width if it's not character 0(spacing).
IF (fcolumn+1)+(frow*12)-1 > 0 THEN ImportFont.FontWidth((fcolumn+1)+(frow*12)-1) = TempWidth

NEXT fcolumn
NEXT frow

CLS

END SUB


SUB PrintFont (xx AS INTEGER, yy AS INTEGER, CText AS STRING, BYREF PrintSFont AS FontType, spacing AS INTEGER, PMode AS INTEGER)

' This sub prints CText$ with font saved in PrintSFont 
' array, on coordinates xx and yy, with inputted spacing and
' with TRANS(PMode=1) or PSET(PMode=2).

' If inexistent print mode is defined we flag 
' the default mode => TRANS
IF PMode<>1 AND PMode<>2 THEN PMode = 1

DIM MessLen AS INTEGER
DIM CharNo AS INTEGER
DIM CharWidth AS INTEGER

' Get the number of characters in the string.
MessLen = LEN(CText)

' Loop to display each character of CText$.
FOR nn AS INTEGER = 1 TO MessLen
    CharNo = ASC(MID$(CText, nn, 1)) - 32
    ' Get character's width
    CharWidth = PrintSFont.FontWidth(CharNo)
    
    IF CharNo < 98 THEN ' A precaution measure
    IF PMode=1 THEN PUT (xx, yy), PrintSFont.FontBuffer(CharNo), TRANS
    IF PMode=2 THEN PUT (xx, yy), PrintSFont.FontBuffer(CharNo), PSET
    END IF
    ' Add horizontal space according to inputted spacing
    ' and last character's width.
    xx = xx + CharWidth + spacing
        
NEXT nn

END SUB

SUB PrintAlphaFont (xx AS INTEGER, yy AS INTEGER, CText AS STRING, BYREF PrintTFont AS FontType, spacing AS INTEGER, pblender AS INTEGER)

' This sub prints CText with font saved in PrintSFont 
' array, on coordinates xx and yy, with ALPHA pblender.

' If blender is out of bounds set it to 255.
IF pblender > 255 OR pblender < 0 THEN pblender = 255

DIM MessLen AS INTEGER
DIM CharNo AS INTEGER
DIM CharWidth AS INTEGER

' Get the number of characters in the string.
MessLen = LEN(CText)

' Loop to display each character of CText$.
FOR nn AS INTEGER = 1 TO MessLen
    CharNo = ASC(MID$(CText, nn, 1)) - 32
    ' Get character's width
    CharWidth = PrintTFont.FontWidth(CharNo)
    
    IF CharNo < 98 THEN ' A precaution measure   
    PUT (xx, yy), PrintTFont.FontBuffer(CharNo), ALPHA, pblender
    END IF
    ' Add horizontal space according to inputted spacing
    ' and last character's width.
    xx = xx + CharWidth + spacing
        
NEXT nn

END SUB

SUB LoadBFont (fontimage AS STRING, BYREF ImportBFont AS FontType, widthmode AS INTEGER)

' This sub is identical to LoadFont but this one is to be used 
' when importing big fonts(saved in grids 48*48). Use this sub 
' only after initiating screen mode 18 and above, 11 or 12 or
' you'll print garbage. Also, use 8bit color depth and load 8bit
' color depth BMP images!

IF widthmode<>1 AND widthmode<>2 THEN widthmode = 1

SCREENSET 1, 0
CLS
BLOAD fontimage, 0

'color0 = POINT(589,1)

ImportBFont.FontWidth(0) = -1
ImportBFont.FontHeight = -1

FOR seekspace AS INTEGER = 2 TO 49
IF Point(seekspace+588, 1) <> POINT(589,1) AND ImportBFont.FontWidth(0) = -1 THEN
ImportBFont.FontWidth(0) = seekspace - 1
END IF
NEXT seekspace

FOR seekheight AS INTEGER = 2 TO 49
IF Point(636, seekheight) <> POINT(589,1) AND ImportBFont.FontHeight = -1 THEN
ImportBFont.FontHeight = seekheight - 1
END IF
NEXT seekheight

DIM TempWidth AS UBYTE
FOR frow AS INTEGER = 0 TO 7
FOR fcolumn AS INTEGER = 0 TO 11

TempWidth = 48
repeatloop:
FOR seekwidth AS INTEGER = 1 TO ImportBFont.FontHeight
IF Point((fcolumn*49)+TempWidth, (frow*49)+seekwidth) <> POINT(589,1) THEN EXIT FOR
IF seekwidth=ImportBFont.FontHeight THEN      
TempWidth = TempWidth - 1 
IF TempWidth > 1 THEN GOTO repeatloop:
END IF
NEXT seekwidth
' ********************************

IF widthmode = 2 THEN TempWidth = ImportBFont.FontWidth(0)

ImportBFont.FontBuffer(((fcolumn+1)+(frow*12)-1)) = IMAGECREATE (49,49)
GET (1+(fcolumn*49),1+(frow*49))-((fcolumn*49)+TempWidth,(frow*49)+ImportBFont.FontHeight), ImportBFont.FontBuffer(((fcolumn+1)+(frow*12)-1))

IF fcolumn = 0 AND frow = 0 THEN GET (1,1)-(ImportBFont.FontWidth(0), ImportBFont.FontHeight), ImportBFont.FontBuffer(0)
    
IF (fcolumn+1)+(frow*12)-1 > 0 THEN ImportBFont.FontWidth((fcolumn+1)+(frow*12)-1) = TempWidth

NEXT fcolumn
NEXT frow

CLS

END SUB


