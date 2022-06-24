extends Panel

export (NodePath) var dropdown_path
	
onready var dropdown = get_node("DropDown")

var true_state = false

var data = ["Unendlich", "0", "7", "15"] 
var data1 = ["Unendlich", "4", "10", "13"]
var data2 = ["Unendlich", "7", "8", "11"]
var data3 = ["Unendlich", "7", "10", "13"]
var data4 = ["Unendlich", "6", "9", "12"]
var data5 = ["Unendlich", "13", "14", "15"]

func _ready():
	add_items()


func add_items():
	for item in data:
		$DropDown.add_item(item)
	
		
		
func check_for_true_state(id):
	if data[id] == "1337":
		true_state = true
	else:
		true_state = false


func _on_DropDown_item_selected(index):
	check_for_true_state(index)
	print(true_state)
	
func get_true_state():
	return true_state
