class_name PlayerController
extends CharacterBody3D

@export var velocity_component : VelocityComponent
@export var input_component : InputComponent


func _process(delta: float) -> void:
	velocity_component._movement_input = input_component._movement
	
func update_rotation(rotation_input) -> void:
	global_transform.basis = Basis.from_euler(rotation_input)
