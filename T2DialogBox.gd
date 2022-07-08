extends Control


var dialog = [
	
	'Kapitän: Um den Schatz vor ihm zu erreichen, müssen wir uns noch anschauen wie wir den kürzesten Weg ermitteln können',
	'Kapitän: Infrage kommen dabei zwei Algorithmen',
	'Kapitän: Der Dijkstra Algorithmus ist ein sogenannter Greedy Algorithmus . Er hilft dir die kürzesten beziehungsweise kostengünstigsten Wege zu berechnen. Die Kantengewichte , so nennt man die Kosten, um von einem Punkt zum nächsten zu kommen, dürfen beim Dijkstra-Algorithmus nicht negativ sein.',
	'Kapitän: Zuerst musst du den Algorithmus initialisieren.',
	'Kapitän: Am besten legst du eine Tabelle an, um den Überblick zu behalten. In die erste Spalte trägst du die jeweilige Iteration ein, in der du dich befindest. Für jeden Knoten gibst du dann die jeweiligen Kosten und den direkten Vorgänger In der letzten Spalte kannst du dein Vorgehen verwalten. Das hilft dir dabei einen guten Überblick zu haben.',
	'Kapitän: Die Kosten zum Startknoten betragen Null. Du bist ja schon zuhause. Zu deinen möglichen Reiseorten ist noch kein Weg bekannt. Darum bewertest du die Kosten erst einmal mit Unendlich. Das bleibt natürlich nicht so. Nach und nach werden diese Kosten verbessert.',
	'Kapitän: Jetzt benötigst du eine Warteschlange. In diese werden alle Knoten, die du bereits gefunden hast, eingefügt. Da du bisher nur deinen Startknoten kennst fügst du diesen als erstes in deine Warteschlange',
	'Kapitän: Als Beispiel schauen wir uns die erste Iteration an: Da in der Warteschlange nur ein Element ist, wählst du dieses aus und betrachtest die direkten Nachfolger. Vom Startknoten aus können die Knoten B und D erreicht werden.',
	'Kapitän: Die Kosten, um vom Startknoten nach B zu kommen betragen 100. Als Vorgänger von Knoten B trägst du den Startknoten in deine Tabelle ein. ',
	'Kapitän: Genauso gehst du mit Knoten D Die Kosten, um vom Startknoten nach D zu kommen betragen 50. Und als Vorgänger trägst du ebenfalls den ersten Knoten ein.',
	'Kapitän: Die Nachfolger des Startknotens hast du nun betrachtet. Du kannst ihn als erledigt markieren. Die beiden Nachfolgerknoten nimmst du in deine Warteschlange. ',
	'Kapitän: Dieses Vorgehen übernimmst du für die restlichen Iterationen',
	'Kapitän: Als zweite Möglichkeit möchte ich dir noch den Floyd-Warshall Algorithmus näher bringen.',
	'Kapitän: Der Algorithmus besteht im Grunde aus 2 Teilen: Der Teil von Floyd zur Berechnung der kürzesten Distanzen zwischen den Knoten und der Teil von Warshall zum Konstruieren der kürzesten Wege. Fügt man beide zusammen, erhält man den Floyd-Warshall-Algorithmus.',
	'Kapitän: Formal werden die aktuellen Pfadkosten folgendermaßen ermittelt: d[i, j] = min {d[i, j], d[i, k] + d[k, j]}',
	'Kapitän: Zuerst erstellst du eine Gewichtsmatrix zu dem Graphen. Auf der Diagonalen trägst du überall eine Null ein. Falls es eine Kante zwischen den zwei Knoten i und j gibt, ist der Matrixeintrag W[i, j] das Gewicht der Kante von i nach j. Falls es keine Kante gibt, die die Knoten verbindet, trägst du unendlich in die Zelle ein.',
	'Kapitän: Im ersten Schritt des Algorithmus setzt du k=1. Das heißt, dass du dir genauer anschaust ob Knoten 1 als Verbindungsknoten für andere Knoten dienen kann. Da Knoten 1 jedoch eine Quelle ist, was heißt, dass keine gerichtete Kante in den Knoten eingeht, ist das nicht der Fall. ',
	'Kapitän: Somit kannst du direkt k auf 2 setzen und Knoten 2 quasi „freigeben“. Aber wie war das jetzt nochmal mit dieser Formel? Ganz einfach: d[1, 4] = min {d[1, 4], d[1, 2] + d[2, 4]} = min {∞, 10 + 4} min {∞, 14} = 14', 
	'Kapitän: Dieses Vorgehen wiederholt sich für die restlichen Knoten bzw Kanten.',
	'Kapitän: Die Matrix liefert allerdings nur die kürzesten Distanzen zwischen den Knoten, aber nicht den tatsächlichen Weg. Hierfür ist der Warshall-Teil des Algorithmus zuständig.',
	'Kapitän: Für den benötigen wir eine zweite Matrix, die wir F nennen. Zu Beginn steht in jeder Zelle der Startknoten der jeweiligen Kante, falls sie existiert. ',
	'Kapitän: Wird nun wie im Laufe des Floyd-Algorithmus ein kürzerer Weg gefunden, wird die Matrix F aktualisiert. Der Weg von Knoten 1 zu Knoten 4 führt über Knoten 3. Knoten 3 ist also der neue Vorgänger von Knoten 4 und wird somit in die Matrix eingetragen. Als aktuellen Vorgänger von Knoten 2 auf dem Weg von 1 nach 2 wird ebenfalls 3 eingetragen.',
	'Kapitän: Aus der Matrix F können wir nun zum Beispiel den kürzesten Weg von Knoten 1 zu Knoten 2 konstruieren. In der Zelle [1,2] steht der Vorgänger von Knoten 2. Somit führt der kürzeste Weg von Knoten 1 über Knoten 3 zu Knoten 2.',
	'Kapitän: Um die Erfolgsaussichten wirklich zu gewährleisten, bedarf es noch eines kleinen Tests. Los gehts!',

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
		
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible" , 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT 
		)
		$Tween.start()
		
	else:
		queue_free()
		get_tree().change_scene("res://Dijkstra.tscn")
	dialog_index += 1
	

func _on_Tween_tween_completed(object, key):
	finished = true

