extends CharacterBody2D
class_name BasicEnemy


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	velocity.y += gravity
	move_and_slide()

func _on_death():
	queue_free()
