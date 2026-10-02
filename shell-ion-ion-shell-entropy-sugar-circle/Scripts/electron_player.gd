extends CharacterBody2D
var Ring

const SPEED = 300.0
const JUMP_VELOCITY = -200.0


func _physics_process(delta: float) -> void:
	pass

	# Handle jump.
	if Input.is_action_just_pressed("Up") :
		position.y += JUMP_VELOCITY
	if Input.is_action_just_pressed("Down") :
		position.y -= JUMP_VELOCITY
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
