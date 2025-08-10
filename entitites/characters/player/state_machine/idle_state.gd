extends PlayerState

func _on_idle_state_processing(delta: float) -> void:
	if player_controller and player_controller.input_component._movement:
		player_controller.state_chart.send_event("onMoving")
