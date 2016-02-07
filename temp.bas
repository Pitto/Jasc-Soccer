' Create the pointer.
Dim p As Integer Ptr
Dim num As Integer = 100

p = @num


Print "Pointer 'p' ="; *p

*p = 500
Print "Pointer 'p' ="; *p

' Print the actual location in memory that pointer "p" points at.
Print "Pointer 'p' points to memory location:"
Print hex(p)
sleep
