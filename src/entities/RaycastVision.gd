extends Node2D
class_name RaycastVision

var rayCasts: Array

func _ready():
	var children = get_children()
	for child in children:
		if child is RayCast2D:
			rayCasts.append(child as RayCast2D)
	pass
	

func get_target():
	var targets = Array()
	for ray in rayCasts:
		if ray.is_colliding():
			targets.append(ray.get_collider())
			
	return targets
