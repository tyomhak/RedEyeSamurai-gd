extends CharacterBody2D
class_name PlayerController

signal onJump

@export var hor_vel: float = 10.0
@export var jump_vel: float = 10.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@onready var simple_attack: AreaAttack = $SimpleAreaAttack

var target_vel: Vector2 = Vector2.ZERO

func _physics_process(delta):
	velocity.y += gravity * delta

	handle_movement()
	handle_jump()
	handle_attack()

	move_and_slide()


func handle_movement():
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * hor_vel

func handle_jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_vel
		onJump.emit()

func handle_attack():
	if Input.is_action_just_pressed("attack"):
		simple_attack.attack()
	pass
