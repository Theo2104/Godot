extends Control
var question = [
	
	"Welcher der beiden Algorithmen berechent die kürzeste Distanz von allen zu allen Knoten?",
	"FloydWarshall",
	"Welcher der beiden Algorithmen berechnet die kürzeste Distanz von einem zu allen Knoten?",
	"Dijkstra",
	"Welcher Algorithmus ist für negative Pfade geeignet?",
	"FloydWarshall",
	
	
	
]

var n = 1
var question_index = 0
var finished = false

func _ready():
	load_question()
	
func _process(delta):
	pass
	
	
	
func load_question():
	if question_index < question.size():
		finished = false
		
		if question_index == 0:
			pass
			
		$RichTextLabel.bbcode_text = question[question_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible" , 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT 
		)
		$Tween.start()
		
	else:
		queue_free()
	question_index += 2
	

func _on_Tween_tween_completed(object, key):
	finished = true


func _on_Dijkstra_pressed():
	var solution = "Dijkstra"
	if (solution==question[n]):
		load_question()
		n=n+2
		var new_style_box:StyleBoxFlat=$Dijkstra.get_stylebox("normal").duplicate()
		new_style_box.bg_color= Color(0,255,0,1)
		$Dijkstra.add_stylebox_override("normal",new_style_box)
		$Dijkstra.add_stylebox_override("hover",new_style_box)
		#button green
	else: 
		var new_style_box:StyleBoxFlat=$Dijkstra.get_stylebox("normal").duplicate()
		new_style_box.bg_color= Color(255,0,0,1)
		$Dijkstra.add_stylebox_override("normal",new_style_box)
		$Dijkstra.add_stylebox_override("hover",new_style_box)
		#button red 


func _on_FloydWarshall_pressed():
	var solution = "FloydWarshall"

	if (solution==question[n]):
		load_question()
		n=n+2
		var new_style_box:StyleBoxFlat=$FloydWarshall.get_stylebox("normal").duplicate()
		new_style_box.bg_color= Color(0,255,0,1)
		$FloydWarshall.add_stylebox_override("normal",new_style_box)
		$FloydWarshall.add_stylebox_override("hover",new_style_box)
		$Farbaenderung.start()
		#button green
	else: 
		var new_style_box:StyleBoxFlat=$FloydWarshall.get_stylebox("normal").duplicate()
		new_style_box.bg_color= Color(255,0,0,1)
		$FloydWarshall.add_stylebox_override("normal",new_style_box)
		$FloydWarshall.add_stylebox_override("hover",new_style_box)
		#button red
	
	 # Replace with function body.


func _on_Farbaenderung_timeout():
	var new_style_box:StyleBoxFlat=$FloydWarshall.get_stylebox("normal").duplicate()
	new_style_box.bg_color= Color("403030")
	$FloydWarshall.add_stylebox_override("normal",new_style_box)
	$FloydWarshall.add_stylebox_override("hover",new_style_box)
	$Dijkstra.add_stylebox_override("normal",new_style_box)
	$Dijkstra.add_stylebox_override("hover",new_style_box)
	 # Replace with function body.
