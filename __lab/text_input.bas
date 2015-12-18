    ''
    ''  FreeBASIC Text Input Box using fbgfx only!
    ''
    ''  Alex Barry
    ''  http://www.mrbarry.com/
    ''
    ''  June 24, 2011
    ''

    #define DEBUG   1

    Type InputBox
    public:
      Declare Constructor( byref strId as string )
      Declare Destructor()
     
      Declare Sub reset( )
     
      Declare Function getStringId( ) As String
     
      Declare Sub display( focus as integer )
      Declare Function getInput( ) As Integer
     
      Declare Sub setCaret( pos as integer )
     
      Declare Sub setCaretBlinkRate( nTimesPerSecond as double = 1.0 )

      As Integer x, y
      As Integer columns
      As String * 1 passwordChar
      As Integer isPassword
      As String text
     
      As Integer redraw
     
      As Integer paddingX, paddingY
     
      As Uinteger background, foreground, border, caretCol
    private:
      Declare Sub moveCaretLeft()
      Declare Sub moveCaretRight()
      As Integer caret
      As Integer caretDraw
      As Integer textStartAt
      As Double caretInterval
      As Double caretNextBlink
      As String stringId
    End Type

    ScreenRes 800, 600, 16
    Dim Shared As Integer fontWidth, fontHeight
    '' Get the default width and height of the font
    var w = Width()
    fontWidth = 800 / LoWord( w )
    fontHeight = 600 / HiWord( w )

    Dim clickLock as Integer = 0

   
    Dim txt(0 To 1) As InputBox Ptr = &#123: new InputBox( "Left" ), new InputBox( "Right" ) &#125
    
    
    txt(0)->x = 20
    txt(0)->y = 20
    txt(0)->columns = 50
    txt(0)->paddingY = 5
    txt(0)->setCaretBlinkRate( 2.5 )

    txt(1)->x = 500
    txt(1)->y = 20
    txt(1)->columns = 30
    txt(1)->paddingY = 5
    txt(1)->setCaretBlinkRate( 2.5 )
    txt(1)->isPassword = 1

    locate 10, 1
    Print "** Press Esc to quit **"
    Print "Font Size: " & fontWidth & "x" & fontHeight
    Print
    Do
     
      Dim As Integer mx, my, mb
      GetMouse( mx, my, , mb )
      If ( mb And 1 ) And ( Not clickLock ) Then
        For obj As Integer = Lbound( txt ) To Ubound( txt )
          Dim ibox As InputBox Ptr = txt(obj)
          If ( mx >= ibox->x ) And ( mx <= ibox->x+(fontWidth*ibox->columns)+(ibox->paddingX*2) ) And ( my >= ibox->y ) And ( my <= ibox->y+(fontHeight)+(ibox->paddingY*2) ) Then
            If obj > 0 Then
              Print "Changing focus to " & ibox->getStringId()
              For r As Integer = obj-1 To Lbound( txt ) Step -1
                swap txt(r+1), txt(r)
              Next r
            End If
            ibox->redraw = 1
            If mx < (ibox->x+ibox->paddingX) Then
              ibox->setCaret(0)
            Else
              var caretPos = fix( (mx-(ibox->x+ibox->paddingX))/fontWidth )
              ibox->setCaret( caretPos )
            End If
          End if
        Next Obj
        clickLock = 1
      ElseIf ( ( mb And 1 ) = 0 ) And clickLock Then
        clickLock = 0
      End if

      if txt(0)->getInput( ) then
        print "Input (" & txt(0)->getStringId() & ") : `" & txt(0)->text & "`"
        txt(0)->reset()
      end if

      ScreenLock()
        txt(0)->display(1)
        For u As Integer = 1 To Ubound( txt )
            txt(u)->display(0)
        Next u
      ScreenUnLock()
      sleep 1, 1
    Loop Until Multikey( &h1 )

    For d As Integer = Lbound( txt ) To Ubound( txt )
      Delete txt(d)
    Next d

    Constructor InputBox( byref strId as string )
      this.isPassword = 0
      this.passwordChar = "*"
      this.paddingX = 2
      this.paddingY = 2
      this.caretInterval = 1.0
      this.background = rgb(255,255,255)
      this.foreground = rgb(0,0,0)
      this.border = rgb( 100,100,100 )
      this.caretCol = rgb( 10,10,10 )
      this.stringId = strId
      this.reset()
    End Constructor

    Destructor InputBox()
      this.text = ""
      this.passwordChar = ""
    End Destructor

    Sub InputBox.reset()
      this.text = ""
      this.caret = 0
      this.caretDraw = 0
      this.textStartAt = 1
      this.redraw = 1
    End Sub

    Function InputBox.getStringId( ) As String
      return this.stringId
    End Function

    Sub InputBox.display( focus as integer )

      If focus Then
        If (Timer >= this.caretNextBlink) Then
          this.caretDraw = Not this.caretDraw
          this.caretNextBlink = Timer + this.caretInterval
          this.redraw = 1
        End If
      Else
        this.caretDraw = 0
      End If

      If this.redraw Then
        Line (this.x, this.y)-step((this.columns*fontWidth)+(this.paddingX*2), fontHeight+(this.paddingY*2)), this.background, bf
        Line (this.x, this.y)-step((this.columns*fontWidth)+(this.paddingX*2), fontHeight+(this.paddingY*2)), this.border, b
     
        Dim showChars as string
        showChars = Mid( this.text, this.textStartAt )
        If len( showChars ) > this.columns Then showChars = Mid( showChars, 1, this.columns )
        If this.isPassword = 1 Then
          showChars = String( len( showChars ), this.passwordChar )
        End If  
        Draw String ( this.x+this.paddingX, this.y+this.paddingY ), showChars, this.foreground
       
        If this.caretDraw Then
          Line ( this.x+this.paddingX + (this.caret*8) - 1, this.y+(this.paddingY/2) )-( this.x+this.paddingX + (this.caret*8), this.y+fontHeight+(this.paddingY) ), this.caretCol, bf
        Else
          Line ( this.x+this.paddingX + (this.caret*8) - 1, this.y+(this.paddingY/2) )-( this.x+this.paddingX + (this.caret*8), this.y+fontHeight+(this.paddingY) ), this.background, bf
        End If

        this.redraw = 0
      End If
       
    End Sub

    Function InputBox.getInput( ) As Integer
      '' Parse text input
      Dim a As Integer
      Dim i As String
      Dim As String splitA, splitB
      i = Inkey()
      a = Asc( i )
      this.redraw = 1
      If ( a >= 32 ) And ( a <= 126 ) Then
        splitA = Mid( this.text, 1, this.textStartAt+this.caret-1 )
        splitB = Mid( this.text, this.textStartAt+this.caret )
        this.text = splitA & i & splitB
        moveCaretRight( )
      ElseIf ( a = 13 ) Then
        this.redraw = 0
        Return 1
        
          ElseIf ( a = 8 ) Then '' Backspace
    If ( len( this.text ) > 0 ) And ( this.textStartAt >= 1 ) and ( this.textStartAt+this.caret >= 2) Then
          splitA = Left( this.text, this.textStartAt+this.caret-2 )
          splitB = Mid( this.text, this.textStartAt+this.caret )
          this.text = splitA & splitB
          moveCaretLeft( )
        End If
      

      ElseIf ( i = (chr(255)+chr(75)) ) Then '' Left
        this.moveCaretLeft( )
      ElseIf ( i = (chr(255)+chr(77)) ) Then '' Right
        this.moveCaretRight( )
      ElseIf ( i = (chr(255)+chr(83)) ) Then '' Delete
        If ( len( this.text ) > 0 ) Then
          splitA = Mid( this.text, 1, this.textStartAt+this.caret-1 )
          splitB = Mid( this.text, this.textStartAt+this.caret + 1 )
          this.text = splitA & splitB
        End If
      ElseIf ( i = (chr(255)+chr(71)) ) Then '' Home
        this.textStartAt = 1
        this.caret = 0
      ElseIf ( i = (chr(255)+chr(79)) ) Then '' End
        Dim max As Integer
        max = len( this.text ) - this.columns
        If max < 1 Then
          this.textStartAt = 1
         this.setCaret( len( this.text ) )
        Else
          this.textStartAt = max
          this.setCaret( this.columns )
        End If
      Else
        If a > 0 Then
    #if DEBUG
          Print "Unhandled key: ";
          For p As Integer = 1 To Len( i )
            print asc( Mid( i, p, 1 ) ) & "+";
          Next
          Print ""
    #endif
        End If
        this.redraw = 0
      End If
     
      Return 0
    End Function

    Sub InputBox.setCaret( p as integer )
      If (p < 0) Then
        this.caret = 0
      ElseIf pos >= 1 Then
        If p > this.columns Then p = this.columns
        Dim maxd As Integer
        maxd = len( mid( this.text, this.textStartAt, this.columns ) )
        If p > maxd Then
          this.caret = maxd
        Else
          this.caret = p
        End If
      End If
      this.caretDraw = 0
      this.caretNextBlink = Timer  
    End Sub

    Sub InputBox.setCaretBlinkRate( nTimesPerSecond as double )
      this.caretInterval = 1.0/nTimesPerSecond
      this.caretNextBlink = Timer
    End Sub

    Sub InputBox.moveCaretLeft()
      If this.caret = 0 Then
        this.textStartAt -= 1
        If this.textStartAt < 1 Then this.textStartAt = 1
      Else
        this.caret -= 1
      End If
    End Sub

    Sub InputBox.moveCaretRight()
      If this.caret = this.columns Then
        this.textStartAt += 1
        Dim max As Integer
        max = len( this.text ) - this.columns
        If max < 1 Then
          this.textStartAt = 1
        Else
          this.textStartAt = max
        End If
      Else
        this.caret += 1
      End If
    End sub
     
