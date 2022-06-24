extends Node2D

export var moving = false

onready var pathArray = [$Ship.global_position]
onready var speed = [200]

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
		
func _process(delta):
	print("Knoten: ", pathArray, ", speed: ", speed)
	go_there(delta)
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
				speed.append((11-s)*20)

		elif pathArray[-1] == X:
			if checkPath(Y,X):
				pathArray.append(Y)
				speed.append((11-s)*20)
		else:
			deselectSpecificPath(Y,X) #fixes problem that if you click path AB and BC you cannot click BE

	else:
		if $Ship.global_position == Y:
			if checkPath(Y,X):
				pathArray.append(X)
				speed.append((11-s)*20)

		elif $Ship.global_position == X:
			if checkPath(Y,X):
				pathArray.append(Y)
				speed.append((11-s)*20)
			
func checkPath(Y,X):
	if pathArray.empty():
		print(1)
		if Y == $Ship.global_position || X == $Ship.global_position:
			return true
		else:
			return false
	else: 
		print(2)
		var Z = pathArray[-1]
		if Z == Y || Z == X: 
			return true
		else:
			print(22)
			return false
			
func setPressedToFalse():
	$AB.set_pressed(false)
	$BE.set_pressed(false)
	$AC.set_pressed(false)
	$CE.set_pressed(false)
	$BC.set_pressed(false)
	$AD.set_pressed(false)
	$CF.set_pressed(false)
	$DF.set_pressed(false)
	$EF.set_pressed(false)
	
func deselectSpecificPath(Y,X):
	if Y == $A.global_position || X == $A.global_position:
		if X == $B.global_position || Y == $B.global_position:
			$AB.set_pressed(false)
		elif X == $C.global_position || Y == $C.global_position:
			$AC.set_pressed(false)
		elif X == $D.global_position || Y == $C.global_position:
			$AD.set_pressed(false)
	
	elif Y == $C.global_position || X == $C.global_position:
		if X == $E.global_position || Y == $E.global_position:
			$CE.set_pressed(false)
		elif X == $B.global_position || Y == $B.global_position:
			$BC.set_pressed(false)
		elif X == $F.global_position || Y == $F.global_position:
			$CF.set_pressed(false)
			
	elif Y == $F.global_position || X == $F.global_position:
		if X == $D.global_position || Y == $D.global_position:
			$DF.set_pressed(false)
		elif X == $E.global_position || Y == $E.global_position:
			$EF.set_pressed(false)
	else: 
		$BE.set_pressed(false)
	
	
func checkDoublePath(path, Y, X, s):
	if path.is_pressed():
		quickPath(Y, X,s)
	elif !path.is_pressed() && (Y == pathArray[-1] || X == pathArray[-1]):
		path.set_pressed(false)
		pathArray.pop_back()
	else:
		path.set_pressed(true)
		
#methods to change testination position (and move there - go_there() in process method), set moving to true, set move_speed
func _on_AB_pressed():
	checkDoublePath($AB, $A.global_position, $B.global_position, 4)

func _on_BE_pressed():
	checkDoublePath($BE, $B.global_position, $E.global_position, 4)

func _on_AC_pressed():
	checkDoublePath($AC, $A.global_position, $C.global_position, 4)

func _on_CE_pressed():
	checkDoublePath($CE, $C.global_position, $E.global_position, 4)

func _on_BC_pressed():
	checkDoublePath($BC, $B.global_position, $C.global_position, 4)

func _on_AD_pressed():
	checkDoublePath($AD, $A.global_position, $D.global_position, 4)

func _on_CF_pressed():
	checkDoublePath($CF, $C.global_position, $F.global_position, 4)

func _on_DF_pressed():
	checkDoublePath($DF, $D.global_position, $F.global_position, 4)

func _on_EF_pressed():
	checkDoublePath($EF, $E.global_position, $F.global_position, 4)

func _on_Button_pressed():
	if !pathArray.empty():
		moving = true
	
func _on_Delete_pressed():
	if !moving:
		pathArray.clear()
		speed.clear()
		setPressedToFalse()
	
