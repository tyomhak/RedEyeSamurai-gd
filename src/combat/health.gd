extends Area2D
class_name Health

signal onTakeDamage
signal onHeal
signal onDeath

signal onHealthChange(healthPercent)

@export var max_health: int = 10
@onready var curr_health: int = max_health

#func _ready():
	#onHealthChange.emit(get_health_percent())

func take_damage(amount):
	curr_health = max(0, curr_health - amount)
	onHealthChange.emit(get_health_percent())
	if curr_health <= 0:
		onDeath.emit()
	else:
		onTakeDamage.emit()

func heal(amount):
	if (curr_health < max_health):
		curr_health = max(max_health, curr_health + amount)
		onHeal.emit()
		onHealthChange.emit(get_health_percent())
		

func get_health_percent():
	return float(curr_health) / float(max_health)
