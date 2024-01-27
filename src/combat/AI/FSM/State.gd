extends Node
class_name State

signal onEnter()
signal onExit()
signal onStateTransition(state: State, new_state_name: String)
signal onForceStateTransition(new_state_name: String)

func enter():
	onEnter.emit()
	pass
	
func exit():
	onExit.emit()
	pass
	
func update(_delta: float):
	pass
	
func phys_update(_delta: float):
	pass

func transition_to(new_state_name: String):
	onStateTransition.emit(self, new_state_name)

func force_transition_to(new_state_name: String):
	onForceStateTransition.emit(new_state_name)
