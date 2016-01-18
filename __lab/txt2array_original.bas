Dim txt_output() as string

Sub load_whole_txt_file(Byref fn As String,  filearr() As String)
    'Thanks to bulrush for this very useful sub
    'this is a snippet based on his source
    'http://www.freebasic.net/forum/viewtopic.php?f=7&t=24284
    'this sub read a whole text file and put it into an array
    Dim As Integer filenum,res,outpos,i,ub
    Dim As String procname,ln

    outpos 	= 1
    filenum = Freefile
    res 	= Open (fn, For Input, As #filenum)

	While (Not Eof(filenum))
		Line Input #filenum, ln ' Get one whole text line
		ln 	= Trim(ln)
		If (Left(ln,1) <> "#") And (Len(ln)>0) Then
			Redim Preserve filearr(outpos)
			filearr(outpos)	= ln
			outpos += 1
		end if
	Wend

    Close #filenum

    ub = Ubound(filearr)
End Sub

load_whole_txt_file("..\data\aknow.txt", txt_output())

dim c as integer
for c = 0 to Ubound (txt_output)-1
	print txt_output(c)
next c

sleep
    
