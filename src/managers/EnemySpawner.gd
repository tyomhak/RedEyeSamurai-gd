extends Node2D

@export var enemy: PackedScene = null
@export var pos_offset: Vector2 = Vector2(0,0)

@onready var timer: Timer = $Timer

func _ready():
	timer.start()


func _on_timer_timeout():
	spawn_enemy()
	pass # Replace with function body.


func spawn_enemy():
	var newEnemy = enemy.instantiate()
	get_tree().root.add_child(newEnemy)
	newEnemy.global_position = global_position + pos_offset
