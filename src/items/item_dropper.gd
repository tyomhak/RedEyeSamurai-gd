extends Node2D

@export var itemScene: PackedScene = null
@export var dropChance: float = 1.0


var rng = RandomNumberGenerator.new()
	

func drop_item():
	var rand_value = rng.randf_range(0.0, 1.0)
	if rand_value > dropChance:
		return
	
	var newItem = itemScene.instantiate() as Node2D
	get_parent().add_child(newItem)
	newItem.global_position = global_position
