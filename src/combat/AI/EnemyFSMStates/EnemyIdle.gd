extends State
class_name EnemyIdle


@export var visionRayCast: RayCast2D # = $PlayerDetectRaycast

var charBody: BasicEnemy = null

func enter():
	super()
	
	charBody = get_parent().get_parent()
	assert(charBody != null)
	
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
