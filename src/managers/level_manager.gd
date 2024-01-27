extends Node

func restart_level():
	get_tree().reload_current_scene()

func debug_print():
	print("player_damaged")

func _process(_delta):
	if Input.is_action_just_pressed("restart"):
		restart_level()
