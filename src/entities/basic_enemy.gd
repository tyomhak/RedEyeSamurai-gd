extends CharacterBody2D
class_name BasicEnemy

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var player: PlayerController = null

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += gravity
	move_and_slide()
