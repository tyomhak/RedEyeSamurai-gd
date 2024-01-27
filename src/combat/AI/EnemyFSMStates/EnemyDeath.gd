extends EnemyState

@export var time_before_selfdestruct: float = 2.0

@onready var self_destruct_timer: Timer = $Timer

func _ready():
	self_destruct_timer.wait_time = time_before_selfdestruct

func enter():
	super()
	self_destruct_timer.start()
	anim.play("death")

func _on_timer_timeout():
	charBody.queue_free()

func force_interrupt():
	force_transition_to(self.name)

func interruptible() -> bool:
	return false
