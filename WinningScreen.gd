extends Node2D


var scene = 0;


func _on_MenuButton_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_WeiterButton_pressed():
	if (scene == 0):
		get_tree().change_scene("res://Tutorial2.tscn");
		scene = 1;
	else:
		get_tree().change_scene("res://Menu.tscn");
		scene = 0;
