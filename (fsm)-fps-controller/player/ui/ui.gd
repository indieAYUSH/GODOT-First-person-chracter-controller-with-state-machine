extends CanvasLayer

@onready var speed_val = $Panel/VSplitContainer/SpeedContainer/speed_val
@onready var state_val = $Panel/VSplitContainer/state/state_val
@onready var fps_val = $Panel/VSplitContainer/fps/fps_val

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fps_val.text = str(Engine.get_frames_per_second())


func _on_state_machine_state_changed(state_name):
	state_val.text = str(state_name)
