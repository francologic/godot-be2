class_name VelocityComponent
extends Node

@export_category("Entity Reference")
@export var character : CharacterBody3D
@export var speed : float = 0.0
@export_category("Movement Settings")
@export_category("Easing")
@export var acceleration : float = 0.2
@export var deceleration : float = 0.5
@export_category("Speed")
@export var default_speed : float = 7.0
@export var sprint_speed : float = 3.0
@export var crouch_speed : float = -5.0

#Movement variables
var _movement_input : Vector2
var _movement_velocity : Vector3 = Vector3.ZERO

#Speed related variables
var sprint_speed_modifier : float = 0
var crouch_speed_modifier : float = 0

func _process(delta: float) -> void:
	if not character.is_on_floor():
		character.velocity += character.get_gravity() * delta
	
	var speed_modifier = sprint_speed_modifier + crouch_speed_modifier
	speed = default_speed + speed_modifier

	var current_velocity = Vector2(_movement_velocity.x, _movement_velocity.z)
	var direction = (character.transform.basis * Vector3(_movement_input.x, 0 , _movement_input.y)).normalized()
	
	if direction:
		current_velocity = lerp(current_velocity, Vector2(direction.x, direction.z) * speed, acceleration)
	else :
		current_velocity = current_velocity.move_toward(Vector2.ZERO, deceleration)
	
	_movement_velocity = Vector3(current_velocity.x, character.velocity.y, current_velocity.y)
	print(_movement_velocity)
	character.velocity = _movement_velocity
		
	character.move_and_slide()
