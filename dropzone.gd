extends Position2D

var filled = false
var rect = Rect2(Vector2(0,0),Vector2(250,128))

func _draw():
	#draw_circle(Vector2.ZERO, 75, Color.blanchedalmond)
	draw_rect(rect,Color.gray)
	
func select():
	
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	modulate = Color.webmaroon
	filled = true
	
func deselect():
	modulate = Color.white
	filled = false 
