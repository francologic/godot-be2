@tool
class_name InputComponent
extends Node

@export_category("Input References")
@export var component_mouse_capture : MouseCaptureComponent
@export var component_gamepad_capture : GamepadCaptureComponent
@export var component_keyboard_capture : KeyboardCaptureComponent

enum INPUT_SCHEMES { KEYBOARD_AND_MOUSE, GAMEPAD}
static var INPUT_SCHEME: INPUT_SCHEMES = INPUT_SCHEMES.KEYBOARD_AND_MOUSE

var _camera_rotation : Vector2
var _movement : Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventJoypadMotion :
		INPUT_SCHEME = INPUT_SCHEMES.GAMEPAD
		_camera_rotation = component_gamepad_capture._right_axis_input
	if event is InputEventMouse :
		INPUT_SCHEME = INPUT_SCHEMES.KEYBOARD_AND_MOUSE
		_camera_rotation = component_mouse_capture._mouse_input
	if event is InputEventKey : 
		INPUT_SCHEME = INPUT_SCHEMES.KEYBOARD_AND_MOUSE
		_movement = component_keyboard_capture._movement_axis
		
func _process(delta: float) -> void: 
	#Cleans current rotation so mouse does not keep increasing sensitivity. There is no need to do that on Joypad as it just use current position.
	if INPUT_SCHEME == INPUT_SCHEMES.KEYBOARD_AND_MOUSE :
		_camera_rotation = Vector2.ZERO

func _get_configuration_warnings():
	if !component_mouse_capture:
		return ["You need a MouseCaptureComponent."]
	if !component_gamepad_capture:
		return ["You need a GamepadCaptureComponent."]
	if !component_keyboard_capture:
		return ["You need a KeyboardCaptureComponent."]
	return []
