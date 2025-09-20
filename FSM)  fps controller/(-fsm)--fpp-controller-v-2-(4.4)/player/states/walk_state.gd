class_name WalkState extends PlayerMovementState

@export var walk_speed : float = 7.5

func _update(delta:float):
	if Player.velocity.length() == 0.0 :
		change_state.emit("IdleState")
