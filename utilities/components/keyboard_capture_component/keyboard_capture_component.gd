@icon("res://utilities/components/keyboard_capture_component/keyboard.svg")

class_name KeyboardCaptureComponent
extends Node

var _movement_axis : Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey :
		var motion_vector = Input.get_vector("move_right", "move_left","move_forward", "move_back")
		_movement_axis.x = -motion_vector.x
		_movement_axis.y = motion_vector.y 
