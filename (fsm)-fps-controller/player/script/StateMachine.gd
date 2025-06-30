class_name StateMachine
extends Node

@export var current_state : State
var states : Dictionary = {}

#for debugging prpose  only                         
signal state_changed(state_name )
									 
func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.change_state.connect(on_change_state)
		else:
			push_warning("state machine contain in valid child node")
	await owner.ready
	current_state.enter()
	state_changed.emit(current_state)



func _process(delta):
	if current_state:
		current_state.update(delta)
	print(current_state)



func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)



func on_change_state(new_state_name:String) ->void:
	var new_state = states.get(new_state_name)
	
	if current_state == new_state:
		return
	
	if current_state == null:
		return
	
	if current_state != new_state:
		current_state.exit()
		new_state.enter()
		current_state = new_state
		state_changed.emit(current_state)
	else:
		print("error in state")
