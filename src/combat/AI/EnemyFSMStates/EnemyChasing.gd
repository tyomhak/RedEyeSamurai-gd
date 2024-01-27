extends EnemyState

@export var run_speed: float = 200
@export var attack_distance: float = 30
@export var max_chase_distance: float = 400
	

func enter():
	super()
	anim.play("run")

func exit():
	super()
	charBody.velocity = Vector2.ZERO
	charBody.move_and_slide()
	
func phys_update(_delta: float):
	super(_delta)
	
	var to_target =  charBody.to_local(charBody.player.global_position)
	var distance_to_target = to_target.length()
	
	if (distance_to_target < attack_distance):
		return transition_to("EnemyAttack")
	elif (distance_to_target > max_chase_distance):
		return transition_to("EnemyIdle")
	
	var direction = to_target.normalized()
	charBody.velocity = direction * run_speed
	charBody.velocity.y = 0
	
	charBody.move_and_slide()
	pass
