'dim text(1) as string = {""}
'dim filename as string = "prova.txt"

'sub readfile(fn as string,  filearr() as string)
	' This also ignores comment lines beginning with '#'.
	' Usage:
	Dim as string filename
	filename = "prova.txt"
	Dim filearr() as string
	' readfile(filename, filearr())
	dim as integer filenum, res, outpos, i, ub
	dim as string procname, ln

	procname = "readfile"

	' Check if fn exists.
	if (len(filename)=0) then
		print procname;" ERROR: File name was blank "
		end
	end if
	if dir(filename)="" then ' Does file exist?
		print procname;" ERROR: File doesn't exist: ";filename;". Check your spelling."
		end
	end if

	outpos = 1
	filenum = Freefile
	res = open (filename, for Input, as #filenum)
	
	if res > 0 then print procname;" ERROR opening ";filename:end
	
	while (not eof(filenum))
		line input #filenum, ln ' Get one whole text line
		ln = trim (ln)
		if (left(ln,1) <> "#") and (len(ln)>0) then
			redim preserve filearr(outpos)
			filearr(outpos)=ln
			'print procname;": Read line: ";ln
			outpos=outpos+1
		endif
	wend
	close #filenum
	ub=ubound(filearr)

	
'end sub ' readfile()

'readfile(filename, text)
dim c as integer

for c = 1 to Ubound(filearr)
	print filearr(c)
next c

sleep
