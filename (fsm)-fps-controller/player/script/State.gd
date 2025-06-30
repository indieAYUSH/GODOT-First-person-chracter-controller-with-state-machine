class_name State
extends Node

signal change_state(new_state_name : String)

var PLAYER : Player
var ANIMATION : AnimationPlayer
var  ANIM_TREE : AnimationTree

func _ready():
	await owner.ready
	PLAYER = owner as Player
	ANIMATION = PLAYER.get_node("AnimationPlayer") as AnimationPlayer
	ANIM_TREE = PLAYER.get_node("AnimationTree")    as AnimationTree
func enter():
	pass

func exit():
	pass

func update(delta):
	pass

func physics_update(delta):
	pass
