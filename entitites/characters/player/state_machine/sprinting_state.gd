extends PlayerState

func _on_sprinting_state_processing(delta: float) -> void:
	if not player_controller.input_component._sprinting:
		player_controller.state_chart.send_event("onWalking")


func _on_sprinting_state_entered() -> void:
	player_controller.sprint()
