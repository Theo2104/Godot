extends Control

var dialog = [
	'Kapitän: Ahoi Matrose! Willkommen an Bord der Jolly Roger, dem Schiff der berüchtigtsten Piraten der sieben Welt Meere…  zumindest bald. Mit deiner Hilfe als Navigator sind wir endlich in der Lage der Schatzkarte nachzugehen, die wir vor vielen Jahren erbeutet haben.' ,
	'Pirat: HHAHAHAHA, Ihr seid nicht die Einzigen die eine Kopie der Karte haben! Mit euren miserablen Fähigkeiten werdet ihr nie vor mir am Schatz sein.' , 
	'Kapitän: Hmpf. Das wird sich noch zeigen, los Matrose zeig ihnen was du draufhast.',
	
	
	
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	$Pirat.hide()
	
func _process(delta):
	$"Next-indicator".visible = finished
	
	if Input.is_action_just_pressed("select"):
		load_dialog()
	

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		
		if dialog_index ==1:
			$Matrose.hide()
			$Pirat.show()
		
		else:
			$Matrose.show()
			$Pirat.hide()
		
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible" , 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT 
		)
		$Tween.start()
		
	else:
		queue_free()
		get_tree().change_scene("res://easyDijkstra.tscn")
	dialog_index += 1
	

func _on_Tween_tween_completed(object, key):
	finished = true
	
