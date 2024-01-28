extends Node2D
class_name CigController

#var cig: PackedScene(Node2D) = preload("res://scenes/entities/magic_cig/magic_cig.tscn")
@export var cig: PackedScene = null

@export var inhale_sound: AudioStream = null
@export var exhale_sound: AudioStream = null

signal onSmokeFinish

@onready var timer: Timer = $Timer
var curr_cig: Node2D = null

@onready var audioPlayer: AudioStreamPlayer = $AudioStreamPlayer

func smoke():
	timer.start()
	var new_cig = cig.instantiate()
	add_child(new_cig)
	curr_cig = new_cig
	
	audioPlayer.stream = inhale_sound
	audioPlayer.play()
	
	pass

func stop_smoking():
	remove_child(curr_cig)
	curr_cig.queue_free()
	curr_cig = null
	onSmokeFinish.emit()
	
	audioPlayer.stream = exhale_sound
	audioPlayer.play()
	
