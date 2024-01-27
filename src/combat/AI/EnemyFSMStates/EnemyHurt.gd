extends State

@onready var timer: Timer = $Timer

var charBody: BasicEnemy = null

func force_interrupt():
	print(self.name)
	force_transition_to(self.name)

func enter():
	super()
	
	charBody = get_parent().get_parent()
	assert(charBody != null)
	
	timer.start()
	# add hurt animation
	charBody.scale.y = 0.5
	
func exit():
	super()
	charBody.scale.y = 1

func on_hurt_finish():
	transition_to("EnemyIdle")
