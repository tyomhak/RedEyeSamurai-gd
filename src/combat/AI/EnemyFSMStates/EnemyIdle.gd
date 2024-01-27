extends EnemyState
class_name EnemyIdle

@export var visionRayCast: RayCast2D # = $PlayerDetectRaycast

func enter():
	super()
	if anim:
		anim.play("idle")
	
func update(_delta: float):
	pass

func phys_update(_delta: float):
	super(_delta)
	
	charBody.velocity = charBody.velocity.lerp(Vector2.ZERO, 0.5)
	charBody.move_and_slide()
	
	var target = visionRayCast.get_collider()
	#print(target)
	if target and target is PlayerController:
		charBody.player = target
		transition_to("EnemyChasing")
