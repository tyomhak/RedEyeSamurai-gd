extends EnemyState

@onready var timer: Timer = $Timer

func force_interrupt():
	force_transition_to(self.name)

func enter():
	super()
	timer.start()
	anim.play("hurt")
	
func exit():
	super()
	charBody.scale.y = 1

func on_hurt_finish():
	transition_to("EnemyIdle")
