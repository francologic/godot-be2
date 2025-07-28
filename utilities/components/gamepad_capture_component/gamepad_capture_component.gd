@icon("res://utilities/components/gamepad_capture_component/controller_icon.svg")
class_name GamepadCaptureComponent
extends Node

@export_category("Gamepad Capture Settings")
@export var base_gamepad_analog_sensitivity : float = 0.005
@export var base_gamepad_sensitivity : float = 0.005

var _right_axis_input : Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventJoypadMotion :
		var motion_vector = Input.get_vector("camera_left", "camera_right","camera_down", "camera_up")
		_right_axis_input.x = -motion_vector.x * base_gamepad_sensitivity
		_right_axis_input.y = motion_vector.y * base_gamepad_sensitivity
