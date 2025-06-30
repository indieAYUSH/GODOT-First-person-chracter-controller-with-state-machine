class_name SprintState
extends State


func enter() -> void :
	PLAYER.SPEED = PLAYER.current_player.running_speed


func _input(event):
	if event.is_action_released("sprint"):
		change_state.emit("WalkState")
