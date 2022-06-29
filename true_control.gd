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
	if true_state and true_state2 and true_state3 and true_state4 and true_state5 and true_state6 and true_state7 and true_state8 and true_state9 and true_state10 and true_state11 and true_state12:
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

onready var dropdown7 = $VLayout/DragAndDropColumns/TargetContainer/DropDown7
onready var dropdown8 = $VLayout/DragAndDropColumns2/TargetContainer/DropDown8
onready var dropdown9 = $VLayout/DragAndDropColumns3/TargetContainer/DropDown9
onready var dropdown10 = $VLayout/DragAndDropColumns4/TargetContainer/DropDown10
onready var dropdown11 = $VLayout/DragAndDropColumns5/TargetContainer/DropDown11
onready var dropdown12 = $VLayout/DragAndDropColumns6/TargetContainer/DropDown12


var true_state = false
var true_state2 = false
var true_state3 = false
var true_state4 = false
var true_state5 = false
var true_state6 = false

var true_state7 = true
var true_state8 = false
var true_state9 = false
var true_state10 = false
var true_state11 = false
var true_state12 = false


var data = ["Unendlich", "0", "7", "15"] 
var data1 = ["Unendlich", "4", "10", "13"]
var data2 = ["Unendlich", "7", "8", "11"]
var data3 = ["Unendlich", "7", "10", "13"]
var data4 = ["Unendlich", "6", "9", "12"]
var data5 = ["Unendlich", "13", "14", "15"]

var data6 = ["-", "B", "C", "D"] 
var data7 = ["-", "A", "C", "E"]
var data8 = ["-", "A", "B", "E"]
var data9 = ["-", "A", "C", "F"]
var data10 = ["-", "B", "C", "F"]
var data11 = ["-", "E", "C", "D"]

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
	for item in data6:
		dropdown7.add_item(item)
	for item in data7:
		dropdown8.add_item(item)
	for item in data8:
		dropdown9.add_item(item)
	for item in data9:
		dropdown10.add_item(item)
	for item in data10:
		dropdown11.add_item(item)
	for item in data11:
		dropdown12.add_item(item)
		
		

func _on_DropDown_item_selected(index):
	if data[index] == "0":
		true_state = true
	else:
		true_state = false
	
#func get_true_state():
#	return true_state

func _on_DropDown2_item_selected(index):
	if data1[index] == "4":
		true_state2 = true
	else:
		true_state2 = false


func _on_DropDown3_item_selected(index):
	if data2[index] == "7":
		true_state3 = true
	else:
		true_state3 = false


func _on_DropDown4_item_selected(index):
	if data3[index] == "10":
			true_state4 = true
	else:
			true_state4 = false


func _on_DropDown5_item_selected(index):
	if data4[index] == "6":
		true_state5 = true
	else:
		true_state5 = false


func _on_DropDown6_item_selected(index):
	if data5[index] == "13":
		true_state6 = true
	else:
		true_state6 = false

func _on_DropDown7_item_selected(index):
	if data6[index] == "-":
		true_state7 = true
	else:
		true_state7 = false


func _on_DropDown8_item_selected(index):
	if data7[index] == "A":
		true_state8 = true
	else:
		true_state8 = false


func _on_DropDown9_item_selected(index):
	if data8[index] == "B":
		true_state9 = true
	else:
		true_state9 = false


func _on_DropDown10_item_selected(index):
	if data9[index] == "A":
		true_state10 = true
	else:
		true_state10 = false


func _on_DropDown11_item_selected(index):
	if data10[index] == "B":
		true_state11 = true
	else:
		true_state11 = false


func _on_DropDown12_item_selected(index):
	if data11[index] == "D":
		true_state12 = true
	else:
		true_state12 = false
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenDrag:
		rect_global_position += event.relative
