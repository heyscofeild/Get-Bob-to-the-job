extends CharacterBody2D

const SPEED = 9000.0
@onready var anim_sprite = $AnimatedSprite2D
@onready var footsteps_sound: AudioStreamPlayer2D = $footsteps_sound
@onready var timer: Timer = $Timer
@onready var actionable_finder: Area2D =$"Direction/Actionable finder"


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _physics_process(delta: float) -> void:
	# Direction input
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	# Movement logic
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * SPEED * delta
		if timer.is_stopped():
			footsteps_sound.play()
			timer.start()
		# Play footstep sound with delay
		move_and_slide()

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
		timer.stop()
		anim_sprite.stop()

	

	# Interaction key
	if Input.is_action_just_pressed("interact"):
		interact_with_object()

func interact_with_object(): 
	print("Interacted!")
