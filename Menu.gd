extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_TutorialButton_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_Level1Button_pressed():
	get_tree().change_scene("res://Dijkstra1.tscn")
