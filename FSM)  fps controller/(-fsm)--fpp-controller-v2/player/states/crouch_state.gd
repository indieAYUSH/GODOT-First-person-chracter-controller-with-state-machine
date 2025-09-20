class_name  CrouchState  extends PlayerMovementState


@export var speed : float = 4.5
@export var acceleration : float = 0.1
@export var deacceleration : float  = 0.25

@export var toggle_crouch : bool

@onready var head = %head

@onready var obstacle_checker = %ShapeCast3D
var crouch_depth : float = -0.6
var lerp_speed : float = 10.0
@export var CameraController : CameraControllerComponent

func enter()->void:
	Player.crouch()


func _update(delta : float) -> void:
	if not Input.is_action_pressed("crouch") and not obstacle_checker.is_colliding():
		Player.uncrouch()
		CameraController.update_crouch_hieght(delta,3)
		change_state.emit("IdleState")

	if not obstacle_checker.is_colliding() and Input.is_action_pressed("jump"):
		change_state.emit("JumpState")
		CameraController.update_crouch_hieght(delta,3)
		

func physics_update(delta : float)-> void:
	CameraController.update_crouch_hieght(delta, -3 )
	Player.update_gravity(delta)
	Player.update_movement(speed,acceleration , deacceleration)
