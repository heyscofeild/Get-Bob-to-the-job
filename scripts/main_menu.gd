extends Control


func _ready() :
	pass 


func _process(detlta):
	pass 


func _on_start_pressed():
	get_tree().change_scene_to_file("res://complete scenes/Room.tscn")


func _on_resume_pressed():
	print("Resume pressed")


func _on_options_pressed():
	print("Options pressed")


func _on_exit_pressed():
	get_tree().quit()
