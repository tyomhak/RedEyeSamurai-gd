extends EnemyState
class_name EnemyIdle

#@export var visionRayCast: RayCast2D # = $PlayerDetectRaycast
@export var raycastVision: RaycastVision = null

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
	
	var target = get_target()
	if target:
		charBody.player = target
		transition_to("EnemyChasing")

func get_target() -> PlayerController:
	var targets = raycastVision.get_target()
	for target in targets:
		if target is PlayerController:
			return target
			
	return null
		
	
