@icon("res://utilities/components/gamepad_capture_component/controller_icon.svg")
class_name GamepadCaptureComponent
extends Node

@export_category("Gamepad Capture Settings")
@export var base_gamepad_analog_sensitivity : float = 0.005
@export var base_gamepad_sensitivity : float = 0.005

var _right_axis_input : Vector2
var _movement_axis : Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventJoypadMotion :
		#Camera
		var camera_vector = Input.get_vector("camera_left", "camera_right","camera_down", "camera_up")
		_right_axis_input.x = -camera_vector.x * base_gamepad_sensitivity
		_right_axis_input.y = camera_vector.y * base_gamepad_sensitivity
		#Movement
		var motion_vector = Input.get_vector("move_right", "move_left","move_forward", "move_back")
		print(motion_vector)
		_movement_axis.x = -motion_vector.x
		_movement_axis.y = motion_vector.y 
