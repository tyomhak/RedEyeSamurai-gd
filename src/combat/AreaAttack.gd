extends Area2D
class_name AreaAttack

signal onAttack

@export var damage_amount: int = 1

func attack():
	var targets = get_overlapping_areas()
	print(targets.size())
	if not targets.is_empty():
		for target in targets:
			if target.has_method("take_damage"):
				target.take_damage(damage_amount)
				
		onAttack.emit()
	pass
