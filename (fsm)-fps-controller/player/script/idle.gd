class_name IdleState
extends State


func enter():
	pass



func update(delta:float):
	if PLAYER.velocity.length() > 0  and PLAYER.is_on_floor():
		change_state.emit("WalkState")
	elif PLAYER.velocity.length() > 0 and !PLAYER.is_on_floor():
		pass
