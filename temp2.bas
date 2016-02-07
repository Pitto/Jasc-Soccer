Dim i As Integer
For i = 0 To __FB_ARGC__ - 1
        Print "arg "; i; " = '"; Command(i); "'"
Next i

if __FB_ARGC__ > 1 then print "ARGOMENTI"

sleep
