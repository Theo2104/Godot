extends Node2D

#moving is true, if confirm button was clicked and if there are nodes to go there (false if pathArray is empty)
export var moving = false

#contains all paths that ship have to go through until it comes to the final destination (saves the position of the Nodes)
onready var pathArray = [$Ship.global_position]

#array that contains speed for each path (synchronous updated to pathArray
onready var speed = [200]

#moves ship to next position in pathArray
func go_there(delta):
	if moving:
		$Ship.global_position = $Ship.global_position.move_toward(pathArray[0], delta*speed[0])
		
	#checks if ship arrives on of the nodes in path array and deletes this node from the array
	if !pathArray.empty():
		if $Ship.global_position == pathArray[0]:
			pathArray.pop_front() #for removing this path from array after ship drove through
			speed.pop_front()
			
	#if ship already arrived on last node(=final destination) all paths will be deselected(not red)
	if pathArray.empty():
		setPressedToFalse()
		moving=false
		
#method that continuingly is called, delta is the variable that updates the game
func _process(delta):
	print("Knoten: ", pathArray, ", speed: ", speed) #only for checking
	go_there(delta)
	
#method that checks which path will be added to the array after klicking (hands over button/path values)
func quickPath(Y,X,s):
	if checkPath(Y,X):
		#we have to check which node has to be added to the pathArray after we click on one path: example: if we click on path AB, do we add A or B to the path Array as the next destination?
		if !pathArray.empty():
			#if node Y is already in Array we add node X to the array(otherwise we would stay on that spot and do not move)
			if pathArray[-1] == Y:
				pathArray.append(X)
				speed.append((11-s)*20)
			elif pathArray[-1] == X:
				pathArray.append(Y)
				speed.append((11-s)*20)
			else:
				deselectSpecificPath(Y,X) #fixes problem that if you click path AB and BC you cannot click BE
		else:
			#if we are on position Y we want to add position X to the array (otherwise we would stay on our current position and not move)
			if $Ship.global_position == Y:
				pathArray.append(X)
				speed.append((11-s)*20)
			elif $Ship.global_position == X:
				pathArray.append(Y)
				speed.append((11-s)*20)
			
#checks if we dont click a random path but click one, that has connection either to our current position(1) or to the last position in the array(2)
func checkPath(Y,X):
	if pathArray.empty(): #(1)
		if Y == $Ship.global_position || X == $Ship.global_position:
			return true
		else:
			return false
	else: #(2)
		var Z = pathArray[-1]
		if Z == Y || Z == X: 
			return true
		else:
			return false
			
#deselects all red paths and nodes
func setPressedToFalse():
	$AB.set_pressed(false)
	$BC.set_pressed(false)
	$BD.set_pressed(false)
	$CG.set_pressed(false)
	$AD.set_pressed(false)
	$CF.set_pressed(false)
	$EF.set_pressed(false)
	$CD.set_pressed(false)
	$AE.set_pressed(false)
	$FI.set_pressed(false)
	$GH.set_pressed(false)
	$HI.set_pressed(false)
	$GF.set_pressed(false)
	$ButtonA.set_pressed(false)
	$ButtonB.set_pressed(false)
	$ButtonC.set_pressed(false)
	$ButtonD.set_pressed(false)
	$ButtonE.set_pressed(false)
	$ButtonF.set_pressed(false)
	

func deselectSpecificPath(Y,X):
	if Y == $C.global_position || X == $C.global_position:
		if X == $A.global_position || Y == $A.global_position:
			$AC.set_pressed(false)
		elif X == $E.global_position || Y == $E.global_position:
			$CE.set_pressed(false)
		elif X == $B.global_position || Y == $B.global_position:
			$BC.set_pressed(false)
		elif X == $F.global_position || Y == $F.global_position:
			$CF.set_pressed(false)
	
	elif Y == $A.global_position || X == $A.global_position:
		if X == $B.global_position || Y == $B.global_position:
			$AB.set_pressed(false)
		elif X == $D.global_position || Y == $D.global_position:
			$AD.set_pressed(false)
			
	elif Y == $F.global_position || X == $F.global_position:
		if X == $D.global_position || Y == $D.global_position:
			$DF.set_pressed(false)
		elif X == $E.global_position || Y == $E.global_position:
			$EF.set_pressed(false)
	else: 
		$BE.set_pressed(false)
	
#checks if the same path is clicked two times (brown-red-brown) and avoids adding it multiple times to the array 
func checkDoublePath(path, Y, X, s):
	if path.is_pressed():
		quickPath(Y, X,s)
	elif !path.is_pressed() && (Y == pathArray[-1] || X == pathArray[-1]): #checking if it is the last added path in the array makes sure that we cannot deselect middle paths
		path.set_pressed(false)
		pathArray.pop_back()
	else:
		path.set_pressed(true)
		
#methods to change testination position (and move there - go_there() in process method), set moving to true, set move_speed
func _on_AB_pressed():
	print($AB.is_pressed())
	checkDoublePath($AB, $A.global_position, $B.global_position, 4)

func _on_BC_pressed():
	checkDoublePath($BC, $B.global_position, $C.global_position, 4)

func _on_BD_pressed():
	checkDoublePath($BD, $B.global_position, $D.global_position, 1)

func _on_CG_pressed():
	checkDoublePath($CG, $C.global_position, $G.global_position, 6)

func _on_AD_pressed():
	checkDoublePath($AD, $A.global_position, $D.global_position, 2)

func _on_CF_pressed():
	checkDoublePath($CF, $C.global_position, $F.global_position, 4)

func _on_EF_pressed():
	checkDoublePath($EF, $E.global_position, $F.global_position, 7)

func _on_CD_pressed():
	checkDoublePath($CD, $C.global_position, $D.global_position, 8)

func _on_AE_pressed():
	checkDoublePath($AE, $A.global_position, $E.global_position, 4)

func _on_FI_pressed():
	checkDoublePath($FI, $F.global_position, $I.global_position, 5)

func _on_GH_pressed():
	checkDoublePath($GH, $G.global_position, $H.global_position, 7)

func _on_HI_pressed():
	checkDoublePath($HI, $H.global_position, $I.global_position, 3)

func _on_GF_pressed():
	checkDoublePath($GF, $G.global_position, $F.global_position, 8)
	
func _on_confirmButton_pressed():
	if !pathArray.empty():
		moving = true

func _on_deleteButton_pressed():
	if !moving:
		pathArray.clear()
		speed.clear()
		setPressedToFalse()
