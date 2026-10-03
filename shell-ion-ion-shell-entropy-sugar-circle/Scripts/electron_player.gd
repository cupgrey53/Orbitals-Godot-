extends CharacterBody2D

var Shell_LV = 0
var Charge = 0
const SPEED = 300.0

@onready var center: Node2D = $"../../Orbitals"
var angle := -PI / 2   # starts at the top of the ring
var dir := 1           # 1 = clockwise, -1 = counterclockwise

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Up"):  # later: when a photon is collected
		Shell_LV += 1
	if Input.is_action_just_pressed("Down") and Shell_LV > 0:
		Shell_LV -= 1
		Charge += 1
	if Input.is_action_just_pressed("Fire"):
		Charge = 0

	var boosted := false
	if Input.is_action_pressed("<-"):
		dir = -1
		boosted = true
	elif Input.is_action_pressed("->"):
		dir = 1
		boosted = true

	var radius := Orbitals.radius_for(Shell_LV)
	var speed := SPEED * 2 if boosted else SPEED
	angle += dir * (speed / radius) * delta
	global_position = center.global_position + Vector2(radius, 0).rotated(angle)

	$"Shell Level".text = "Shell Level" + str(Shell_LV)
	$Charge.text = "Charge" + str(Charge)













#extends CharacterBody2D
#var Shell_LV = 0
#var Charge = 0
#const SPEED = 300.0
#const JUMP_VELOCITY = -240.0

#func _physics_process(delta: float) -> void:
	#if Input.is_action_just_pressed("Up") : #Later change to when a photon is collected
		#position.y += JUMP_VELOCITY
		#Shell_LV += 1
	#if Input.is_action_just_pressed("Down") :
		#position.y -= JUMP_VELOCITY
		#Shell_LV -= 1
		#Charge += 1
	#if Input.is_action_just_pressed("Fire") :
		#Charge = 0
	#print(Shell_LV)
	#print(Charge)
	#$"Shell Level".text = "Shell Level" + str(Shell_LV)
	#$Charge.text = "Charge" + str(Charge)
	
	#var direction := Input.get_axis("<-", "->")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	#move_and_slide()
	
