extends CharacterBody2D

const SPEED = 9000.0
@onready var anim_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Direction input
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	# Movement logic
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * SPEED * delta 

		# Animation logic
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				anim_sprite.play("moving right")
			else:
				anim_sprite.play("moving left")
		else:
			if direction.y > 0:
				anim_sprite.play("walking forward")
			else:
				anim_sprite.play("walking backward")
	else:
		velocity = Vector2.ZERO
		anim_sprite.stop()
		
	move_and_slide()
# Interaction key
	if Input.is_action_just_pressed("interact"):
		interact_with_object()


func interact_with_object(): 
	print("Interacted!")
