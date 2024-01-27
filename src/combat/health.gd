extends Area2D
class_name Health

signal onTakeDamage
signal onHeal
signal onDeath

@export var max_health: int = 10
@onready var curr_health: int = max_health

func take_damage(amount):
	curr_health = max(0, curr_health - amount)
	if curr_health <= 0:
		onDeath.emit()
	else:
		onTakeDamage.emit()

func heal(amount):
	if (curr_health < max_health):
		curr_health = max(max_health, curr_health + amount)
		onHeal.emit()
	
	

