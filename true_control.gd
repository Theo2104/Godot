extends PanelContainer

onready var target1 = get_node("VLayout/DragAndDropColumns/TargetContainer/Node2D3")
# Declare member variables here. Examples:
# var a = 2	
# var b = "text"


# Called when the node enters the scene tree for the first time.

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#$VLayout/DragAndDropColumns/TargetContainer/Node2D3.get_right_pos()

func _on_Button_pressed():
	if true_state and true_state2 and true_state3 and true_state4 and true_state5 and true_state6:
		return true
	else: 
		return false
	#debugging print
	

#export (NodePath) var dropdown_path
	
onready var dropdown = $VLayout/DragAndDropColumns/SrcTargetDivider/DropDown
onready var dropdown2 = $VLayout/DragAndDropColumns2/SrcTargetDivider/DropDown2
onready var dropdown3 = $VLayout/DragAndDropColumns3/SrcTargetDivider/DropDown3
onready var dropdown4 = $VLayout/DragAndDropColumns4/SrcTargetDivider/DropDown4
onready var dropdown5 = $VLayout/DragAndDropColumns5/SrcTargetDivider/DropDown5
onready var dropdown6 = $VLayout/DragAndDropColumns6/SrcTargetDivider/DropDown6


var true_state = false
var true_state2 = false
var true_state3 = false
var true_state4 = false
var true_state5 = false
var true_state6 = false


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
		dropdown.add_item(item)
	for item in data1:
		dropdown2.add_item(item)
	for item in data2:
		dropdown3.add_item(item)
	for item in data3:
		dropdown4.add_item(item)
	for item in data4:
		dropdown5.add_item(item)
	for item in data5:
		dropdown6.add_item(item)
		
		
		

func _on_DropDown_item_selected(index):
	if index == 00:
		true_state = true
	else:
		true_state = false
	
#func get_true_state():
#	return true_state

func _on_DropDown2_item_selected(index):
	if index == 00:
		true_state2 = true
	else:
		true_state2 = false


func _on_DropDown3_item_selected(index):
	if index == 00:
		true_state3 = true
	else:
		true_state3 = false


func _on_DropDown4_item_selected(index):
	if index == 00:
			true_state4 = true
	else:
			true_state4 = false


func _on_DropDown5_item_selected(index):
	if index == 00:
		true_state5 = true
	else:
		true_state5 = false


func _on_DropDown6_item_selected(index):
	if index == 00:
		true_state6 = true
	else:
		true_state6 = false
