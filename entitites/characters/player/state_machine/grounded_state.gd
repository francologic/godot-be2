extends PlayerState


func _on_grounded_state_physics_processing(delta: float) -> void:
	if player_controller.input_component._jumping and player_controller.is_on_floor():
		player_controller.velocity_component.jump()
		player_controller.state_chart.send_event("onAirborne")

