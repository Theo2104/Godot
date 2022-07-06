extends Node2D

var selected = false
var rest_point
var rest_nodes = []
var right_pos = false

func get_right_pos():
	return right_pos

func _ready():
	print(get_node("Icon"))
	rest_nodes = get_tree().get_nodes_in_group("zone")
	#rest_point = rest_nodes[0].global_position
	#rest_nodes[0].select()
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") or event is InputEventScreenTouch:
		selected = true
		if(selected):
			print("Selected")
		
#Following segement is for the wiggly movement of the dragable object		
func _physics_process(delta):
	if selected: 
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		look_at(get_global_mouse_position())
	else:
		#global_position = lerp(global_position, rest_point, 10 * delta)
		rotation = lerp_angle(rotation, 0, 10 * delta)
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 75
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					if(child.get_name() == "dropzone"):
						right_pos = true
					else:
						right_pos = false
						
					print(right_pos)
					child.select()
					rest_point = child.global_position
					shortest_dist = distance
					
				
			

