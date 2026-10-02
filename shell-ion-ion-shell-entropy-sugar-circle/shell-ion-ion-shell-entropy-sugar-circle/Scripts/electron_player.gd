extends CharacterBody2D
var Shell_LV = 0
var Charge = 0
const SPEED = 300.0
const JUMP_VELOCITY = -240.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Up") : #Later change to when a photon is collected
		position.y += JUMP_VELOCITY
		Shell_LV += 1
	if Input.is_action_just_pressed("Down") :
		position.y -= JUMP_VELOCITY
		Shell_LV -= 1
		Charge += 1
	if Input.is_action_just_pressed("Fire") :
		Charge = 0
	print(Shell_LV)
	print(Charge)
	$"Shell Level".text = "Shell Level" + str(Shell_LV)
	$Charge.text = "Charge" + str(Charge)
	
	var direction := Input.get_axis("<-", "->")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
