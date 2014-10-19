type proto_obj
    x as integer
    y as integer
    z as single
end type

declare sub change_value (obj as proto_obj ptr)

dim obj as proto_obj
obj.x = 0
obj.y = 0
obj.z = 0.0f

print "obj.x "; obj.x
print "obj.y "; obj.y
print "obj.z "; obj.z

print "-----"
change_value (@obj)
print "obj.x "; obj.x
print "obj.y "; obj.y
print "obj.z "; obj.z

sleep

sub change_value (obj as proto_obj ptr)
    (*obj).x = 1
    (*obj).y = 1
    (*obj).z = 1.1f
end sub