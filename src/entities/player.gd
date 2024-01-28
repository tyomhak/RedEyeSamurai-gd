extends CharacterBody2D
class_name PlayerController

signal onJump

@export var hor_vel: float = 10.0
@export var jump_vel: float = 10.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var simple_attack: AreaAttack = $DirectionNode/SimpleAreaAttack
@onready var _animated_sprite = $DirectionNode/AnimatedSprite2D
@onready var flip_node: Node2D = $DirectionNode

var target_vel: Vector2 = Vector2.ZERO

#attack variables
var _is_attacking = false
var _can_attack = true
const _attack_types = ["attack-1" , "attack-2"]
var rng = RandomNumberGenerator.new()

#sound
var _swing_sounds

func _ready():
	_animated_sprite.play("idle")
	_swing_sounds = get_node("SoundQueue")

func _physics_process(delta):
	velocity.y += gravity * delta

	handle_movement()
	handle_jump()
	handle_attack()
	move_and_slide()

	## Flip the character based on the movement direction
	if velocity.x != 0:
		var direction = sign(velocity.x)
		flip_node.scale.x = abs(flip_node.scale.x) * direction

func handle_movement():
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * hor_vel
	handle_animation()

func handle_jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_vel
		onJump.emit()

func handle_attack():
	if Input.is_action_just_pressed("attack") and _can_attack:
		_is_attacking = true
		_can_attack = false
		simple_attack.attack()
		var random_attack_index = rng.randf_range(0, _attack_types.size())		
		_animated_sprite.play(_attack_types[random_attack_index])
		_swing_sounds.play_sound()
	pass

func handle_animation():
	if(_is_attacking):
		return
	if(!is_on_floor()):
		if(velocity.y < 0):
			_animated_sprite.play("jump")
		else:
			_animated_sprite.play("fall")
	elif(velocity.x == 0):
		_animated_sprite.play("idle")
	elif(velocity.x != 0):
		_animated_sprite.play("run")
	
func _on_animated_sprite_2d_animation_finished():
	if(_attack_types.has(_animated_sprite.animation)):
		_can_attack = true
		_is_attacking = false
