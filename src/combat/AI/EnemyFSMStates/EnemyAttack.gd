extends State
class_name EnemyAttack

@export var attackNode: AreaAttack = null
@export var attack_duration: float = 1.0
@export var attack_distance: float = 30.0

@onready var timer: Timer = $Timer

var charBody: BasicEnemy = null

func enter():
	super()
	
	charBody = get_parent().get_parent()
	assert(charBody != null)
	timer.start()
	hit_player()
	
func exit():
	super()
	timer.stop()

func update(_delta: float):
	super(_delta)
	
	if (charBody.to_local(charBody.player.global_position).length() > attack_distance):
		return transition_to("EnemyChasing")

func hit_player():
	attackNode.attack()

