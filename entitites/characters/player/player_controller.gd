class_name PlayerController
extends CharacterBody3D

@export_category("References")
@export var velocity_component : VelocityComponent
@export var input_component : InputComponent
@export var camera_component : CameraComponent
@export var state_chart : StateChart
@export_subgroup("Collision References")
@export var standing_collision : CollisionShape3D
@export var crouching_collision : CollisionShape3D
@export var crouching_check : ShapeCast3D

func _process(delta: float) -> void:
	velocity_component._movement_input = input_component._movement

func update_rotation(rotation_input) -> void:
	global_transform.basis = Basis.from_euler(rotation_input)

func sprint() -> void:
	velocity_component.sprint_speed_modifier = velocity_component.sprint_speed

func walk() -> void:
	velocity_component.sprint_speed_modifier = 0.0

func stand() -> void:
	velocity_component.crouch_speed_modifier = 0
	standing_collision.disabled = false
	crouching_collision.disabled = true

func crouch() -> void:
	velocity_component.crouch_speed_modifier = velocity_component.crouch_speed
	standing_collision.disabled = true
	crouching_collision.disabled = false
