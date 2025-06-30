class_name Player
extends CharacterBody3D


var SPEED = 5.0
const JUMP_VELOCITY = 4.5

#		
@export var current_player : PlayerStats

#Node_Refrence
@onready var head = %Head




#variable
@export var camera_senstivity : float = 0.02

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	$ui/Panel/VSplitContainer/SpeedContainer/speed_val.text = str(velocity.length())

#------mouse_input----#
func _input(event):
	if event is InputEventMouseMotion:
		head.rotate_x(deg_to_rad(-event.relative.y)*camera_senstivity)
		rotate_y(deg_to_rad(-event.relative.x)*camera_senstivity)
		head.rotation.x = clamp(head.rotation.x , deg_to_rad(-90) , deg_to_rad(90))

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
