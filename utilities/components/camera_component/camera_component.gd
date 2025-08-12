@icon("res://utilities/components/camera_component/camera.svg")
class_name CameraComponent
extends Node3D

@export_category("Reference")
## We set an achor and then interpolate the camera position using physics interpolation in the engine.
## This is needed so it updates camera position every frame instead of every physics tick.
@export var camera_controller_anchor: Marker3D
@export var input: InputComponent
@export var player: PlayerController

@export_category("Camera Settings")
@export_group("Camera Tilt")
@export_range(-90, -60) var tilt_lower_limit: int = -90
@export_range(60, -90) var tilt_upper_limit: int = 90

@export_category("Crouch Vertical Movement")
@export var crouch_offset: float = 0.0
@export var crouch_speed: float = 3.0

const DEFAULT_HEIGHT: float = 0.5

var _rotation: Vector3


func _process(delta: float) -> void:
	update_camera_rotation(input._camera_rotation)


func update_camera_rotation(input: Vector2) -> void:
	_rotation.x += input.y
	_rotation.y += input.x
	_rotation.x = clamp(_rotation.x, deg_to_rad(tilt_lower_limit), deg_to_rad(tilt_upper_limit))

	var _player_rotation = Vector3(0.0, _rotation.y, 0.0)
	var _camera_rotation = Vector3(_rotation.x, 0.0, 0.0)

	camera_controller_anchor.transform.basis = Basis.from_euler(_camera_rotation)
	player.update_rotation(_player_rotation)

	global_transform = camera_controller_anchor.get_global_transform_interpolated()

	rotation.z = 0.0


#Direction should be:
#1 for up
#0 for down
func update_camera_height(delta: float, direction: int) -> void:
	if (
		camera_controller_anchor.position.y >= crouch_offset
		and camera_controller_anchor.position.y <= DEFAULT_HEIGHT
	):
		camera_controller_anchor.position.y = clampf(
			camera_controller_anchor.position.y + (crouch_speed * direction) * delta,
			crouch_offset,
			DEFAULT_HEIGHT
		)
