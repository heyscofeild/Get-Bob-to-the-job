extends Area2D

var entered = false

func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _on_Area2D_body_exited(body: PhysicsBody2D):
		entered = false

func _process(delta):
	if entered and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://complete scenes/trainstation.tscn")
