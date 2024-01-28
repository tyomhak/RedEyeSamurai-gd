extends Area2D
class_name PickupItem

func picked_up():
	process_mode = Node.PROCESS_MODE_DISABLED
	queue_free()
