extends CharacterBody2D
class_name BasicEnemy

@onready var anim: AnimatedSprite2D = $DirectionNode/AnimatedSprite2D
@onready var directionNode: Node2D = $DirectionNode

var player: PlayerController = null

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += gravity
	move_and_slide()

func look_direction(dir: Vector2):
	if dir.x != 0:
		var direction = sign(dir.x)
		directionNode.scale.x = abs(directionNode.scale.x) * direction
