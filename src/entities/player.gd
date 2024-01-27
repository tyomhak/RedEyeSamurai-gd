extends CharacterBody2D

signal onJump

@export var hor_vel: float = 10.0
@export var jump_vel: float = 10.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@onready var simple_attack: AreaAttack = $SimpleAreaAttack
@onready var _animated_sprite = $AnimatedSprite2D

var target_vel: Vector2 = Vector2.ZERO

var _is_attacking = false

func _ready():
	_animated_sprite.play("idle")

func _physics_process(delta):
	velocity.y += gravity * delta

	handle_movement()
	handle_jump()
	handle_attack()
	move_and_slide()


func handle_movement():
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * hor_vel
	if(_is_attacking): return
	if(!is_on_floor()):
		if(velocity.y < 0):
			_animated_sprite.play("jump")
		else:
			_animated_sprite.play("fall")
	elif(velocity.x == 0):
		_animated_sprite.play("idle")
	elif(velocity.x != 0):
		_animated_sprite.play("run")

func handle_jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_vel
		onJump.emit()

func handle_attack():
	if Input.is_action_just_pressed("attack"):
		simple_attack.attack()
		_is_attacking = true
		_animated_sprite.play("attack-1")
	pass


func _on_animated_sprite_2d_animation_finished():
	if(_animated_sprite.animation == "attack-1"):
		_is_attacking = false
