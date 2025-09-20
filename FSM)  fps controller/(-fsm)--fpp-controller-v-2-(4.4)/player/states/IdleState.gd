class_name IdleState extends PlayerMovementState


func _update(delta):
	if Player.is_on_floor() and Player.velocity.length() > 0.1:
		change_state.emit("WalkState")
