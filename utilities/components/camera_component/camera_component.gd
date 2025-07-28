@icon("res://utilities/components/camera_component/camera.svg")
class_name CameraComponent
extends Node3D

@export_category("Reference")
@export var input : InputComponent
@export var player : PlayerController

@export_category("Camera Settings")
@export_group("Camera Tilt")
@export_range(-90,-60) var tilt_lower_limit : int = -90
@export_range(60,-90) var tilt_upper_limit : int = 90

var _rotation : Vector3
func _process(delta: float) -> void:
	update_camera_rotation(input._camera_rotation)

func update_camera_rotation(input: Vector2) -> void:
	_rotation.x += input.y
	_rotation.y += input.x
	_rotation.x = clamp(_rotation.x, deg_to_rad(tilt_lower_limit), deg_to_rad(tilt_upper_limit))
	
	var _player_rotation = Vector3(0.0, _rotation.y, 0.0)
	var _camera_rotation = Vector3( _rotation.x, 0.0, 0.0)

	transform.basis = Basis.from_euler(_camera_rotation)
	player.update_rotation(_player_rotation)

	rotation.z = 0.0
