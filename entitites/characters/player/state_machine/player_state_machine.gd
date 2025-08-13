class_name PlayerStateMachine extends Node

@export_category("References")
@export var player_controller: PlayerController


func _process(delta: float) -> void:
	if player_controller:
		player_controller.state_chart.set_expression_property(
			"Player Velocity", player_controller.velocity
		)
		player_controller.state_chart.set_expression_property(
			"Player Hitting Head", player_controller.crouching_check.is_colliding()
		)
