@icon("res://utilities/components/mouse_capture_component/mouse_icon.svg")
class_name MouseCaptureComponent extends Node

@export_category("Mouse Capture Settings")
@export var current_mouse_mode : Input.MouseMode = Input.MOUSE_MODE_CAPTURED
@export var base_mouse_sensitivity : float = 0.005

var _capture_mouse : bool
var _mouse_input : Vector2

func _unhandled_input(event: InputEvent) -> void:
	_capture_mouse = event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	if _capture_mouse:
		_mouse_input.x += -event.screen_relative.x * base_mouse_sensitivity
		_mouse_input.y += -event.screen_relative.y * base_mouse_sensitivity

func _ready() -> void:
	Input.mouse_mode = current_mouse_mode
	
func _process(delta: float) -> void: 
	#Cleans mouse input so it does not keep increasing sensitivity
	_mouse_input = Vector2.ZERO
