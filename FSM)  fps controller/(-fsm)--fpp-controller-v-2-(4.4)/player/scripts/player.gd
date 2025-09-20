class_name PlayerController  extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var accel : float = 10.0
@export var deccel : float  = 15.0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.


	move_and_slide()
	

func _update_rotation(rot_value : Vector3) -> void :
	transform.basis = Basis.from_euler(rot_value)

func update_movement(SPEED : float , Acceleration : float , Deacceleration :float ):
	var input_dir = Input.get_vector("left", "right", "forward", "baackward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * Deacceleration)
		velocity.z = move_toward(velocity.z, 0, SPEED * Deacceleration)
