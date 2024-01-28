extends Area2D

signal onItemPickup

func _on_item_found(area):
	var item = area as PickupItem
	if item:
		item.picked_up()
		onItemPickup.emit()
		

