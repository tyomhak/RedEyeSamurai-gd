extends Node
class_name StateMachine

@export var initial_state: State = null

var states:Dictionary = {}
var curr_state: State = null

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.onStateTransition.connect(on_state_transition)
			child.onForceStateTransition.connect(on_force_state_transition)
			
	if initial_state:
		curr_state = initial_state
		curr_state.enter()

func _process(delta):
	if curr_state != null:
		curr_state.update(delta)
	
func _physics_process(delta):
	if curr_state != null:
		curr_state.phys_update(delta)

func on_state_transition(state: State, new_state_name: String):
	if (state != curr_state):
		return
	_change_state_to(new_state_name)
	
	
func on_force_state_transition(new_state_name: String):
	if not curr_state.interruptible():
		return
	_change_state_to(new_state_name)

func _change_state_to(new_state_name: String):
	var new_state = states.get(new_state_name.to_lower())
	if new_state:
		curr_state.exit()
		new_state.enter()
		curr_state = new_state
