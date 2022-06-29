extends Node2D

export var moving = false

onready var pathArray = [$Ship.global_position]
onready var speed = [200]
onready var pathArrayEnemy = [$Ship2.global_position, $B.global_position, $D.global_position]
onready var speedEnemy = [200, (11-4)*11*8, (11-5)*11*8]
var table_visibility = false

#moves ship to destination position
func go_there(delta):
	if moving:
		$Ship.global_position = $Ship.global_position.move_toward(pathArray[0], delta*speed[0])
	if !pathArray.empty():
		if $Ship.global_position == pathArray[0]:
			pathArray.pop_front() #for removing this path from array after ship drove through
			speed.pop_front()
			
	if pathArray.empty():
		setPressedToFalse()
		moving=false
		
#moves ship to destination position
func go_thereEnemy(delta):
	if moving:
		$Ship2.global_position = $Ship2.global_position.move_toward(pathArrayEnemy[0], delta*speedEnemy[0])
	if !pathArrayEnemy.empty():
		if $Ship2.global_position == pathArrayEnemy[0]:
			pathArrayEnemy.pop_front() #for removing this path from array after ship drove through
			speedEnemy.pop_front()
			
	if pathArrayEnemy.empty():
		setPressedToFalse()
		moving=false
		
func _process(delta):
	#print("Knoten: ", pathArray, ", speed: ", speed)
	go_there(delta)
	go_thereEnemy(delta)
	set_animation()
	
func set_animation():
	if moving:
		$Ship/AnimationPlayer.play("swim")
		#if $Ship.global_position == $B.global_position && $Ship.global_position.move_toward($A.global_position, 400):
		if $Ship.global_position == $B.global_position && pathArray[0] == $A.global_position:
		# if ship moves from B to A image should be flipped
			$Ship/Image.flip_h = true
		else:
			$Ship/Image.flip_h = false
			
	else:
		$Ship/AnimationPlayer.play("float")
		
func quickPath(Y,X,s):
	print(pathArray)
	if !pathArray.empty():
		if pathArray[-1] == Y:
			if checkPath(Y,X):
				pathArray.append(X)
				speed.append(s)

		elif pathArray[-1] == X:
			if checkPath(Y,X):
				pathArray.append(Y)
				speed.append(s)
		else:
			deselectSpecificPath(Y,X) #fixes problem that if you click path AB and BC you cannot click BE

	else:
		if $Ship.global_position == Y:
			if checkPath(Y,X):
				pathArray.append(X)
				speed.append(s)

		elif $Ship.global_position == X:
			if checkPath(Y,X):
				pathArray.append(Y)
				speed.append(s)
			
func checkPath(Y,X):
	if pathArray.empty():
		if Y == $Ship.global_position || X == $Ship.global_position:
			return true
		else:
			return false
	else: 
		var Z = pathArray[-1]
		if Z == Y || Z == X: 
			return true
		else:
			return false
			
func setPressedToFalse():
	$AB.set_pressed(false)
	$AC.set_pressed(false)
	$BC.set_pressed(false)
	$BD.set_pressed(false)
	$CD.set_pressed(false)
	$ButtonA.set_pressed(false)
	$ButtonB.set_pressed(false)
	$ButtonC.set_pressed(false)
	$ButtonD.set_pressed(false)
	
func deselectSpecificPath(Y,X):
	if Y == $A.global_position || X == $A.global_position:
		if X == $B.global_position || Y == $B.global_position:
			$AB.set_pressed(false)
		elif X == $C.global_position || Y == $C.global_position:
			$AC.set_pressed(false)
	
	elif Y == $B.global_position || X == $B.global_position:
		if X == $C.global_position || Y == $C.global_position:
			$BC.set_pressed(false)
		elif X == $D.global_position || Y == $D.global_position:
			$BD.set_pressed(false)
	else: 
		$CD.set_pressed(false)
	
	
func checkDoublePath(path, Y, X, s):
	if path.is_pressed():
		quickPath(Y, X,s)
	elif !path.is_pressed() && (Y == pathArray[-1] || X == pathArray[-1]):
		path.set_pressed(false)
		pathArray.pop_back()
	else:
		path.set_pressed(true)

func _on_Delete_pressed():
	if !moving:
			pathArray.clear()
			speed.clear()
			setPressedToFalse()

func _on_Confirm_pressed():
	if !pathArray.empty():
		moving = true

func _on_AC_pressed():
	checkDoublePath($AC, $A.global_position, $C.global_position, (11-5)*11*8)

func _on_BC_pressed():
	checkDoublePath($BC, $B.global_position, $C.global_position, (11-7)*11*8)

func _on_BD_pressed():
	checkDoublePath($BD, $B.global_position, $D.global_position, (11-5)*11*8)

func _on_CD_pressed():
	checkDoublePath($CD, $C.global_position, $D.global_position, (11-3)*11*8)

func _on_AB_pressed():
	checkDoublePath($AB, $A.global_position, $B.global_position, (11-4)*11*8)


func _on_TableButton_pressed():
	if(table_visibility):
		table_visibility = false
		$DragAndDropDemo.visible = false
	else:
		table_visibility = true
		$DragAndDropDemo.visible = true
