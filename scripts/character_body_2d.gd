extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add gravity if you need it later, but for now: no gravity
	var direction = Vector2.ZERO

	# Horizontal movement
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

	# Vertical movement
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	# Normalize so Bob doesn't go faster diagonally
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * SPEED

	move_and_slide()
