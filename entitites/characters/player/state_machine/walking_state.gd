extends PlayerState


func _on_walking_state_physics_processing(delta: float) -> void:
	if (
		player_controller.input_component._movement.length() == 0
		and player_controller.velocity.length() < 0.5
	):
		player_controller.state_chart.send_event("onIdle")
	if player_controller.input_component._sprinting:
		player_controller.state_chart.send_event("onSprinting")


func _on_walking_state_entered() -> void:
	player_controller.walk()
