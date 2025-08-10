@icon("res://utilities/components/keyboard_capture_component/keyboard.svg")

class_name KeyboardCaptureComponent
extends Node

var _movement_axis : Vector2
var _sprinting : bool
var _crouching : bool
var _jumping : bool

func _unhandled_input(event: InputEvent) -> void:
	#Movement
	if event is InputEventKey :
		var motion_vector = Input.get_vector("move_right", "move_left","move_forward", "move_back")
		_movement_axis.x = -motion_vector.x
		_movement_axis.y = motion_vector.y
	#Other Keys
	_sprinting = Input.is_action_pressed("sprint")
	_crouching = Input.is_action_pressed("crouch")
	_jumping = Input.is_action_pressed("jump")

