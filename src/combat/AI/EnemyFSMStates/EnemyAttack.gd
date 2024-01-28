extends EnemyState
class_name EnemyAttack

@export var attackNode: AreaAttack = null
@export var attack_duration: float = 1.0
@export var attack_distance: float = 30.0

@onready var timer: Timer = $Timer
@onready var hurt_delay_timer: Timer = $HurtDelayTimer

func enter():
	super()
	timer.start()
	hit_player()
	
func exit():
	super()
	timer.stop()
	hurt_delay_timer.stop()

func update(_delta: float):
	super(_delta)
	
	if not charBody.player:
		return transition_to("EnemyIdle")
	
	var to_target = charBody.to_local(charBody.player.global_position)
	if (to_target.length() > attack_distance):
		return transition_to("EnemyChasing")

func hit_player():
	var to_target = charBody.to_local(charBody.player.global_position)
	charBody.look_direction(to_target)
	anim.play("attack")
	hurt_delay_timer.start()

func damage_player():
	attackNode.attack()
