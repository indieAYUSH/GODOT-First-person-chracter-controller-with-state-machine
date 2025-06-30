class_name WalkState
extends State

func enter():
	PLAYER.SPEED = PLAYER.current_player.walking_speed
	print(PLAYER.SPEED)

func update(delta:float) -> void:
	if PLAYER.velocity.length() == 0 :
		change_state.emit("IdleState")

func _input(event):
	if event.is_action_pressed("sprint"):
		change_state.emit("SprintState")
