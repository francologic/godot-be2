extends PlayerState


func _on_crouching_state_physics_processing(delta: float) -> void:
	player_controller.camera_component.update_camera_height(delta, -1)
	if (
		not player_controller.input_component._crouching
		and player_controller.is_on_floor()
		and not player_controller.crouching_check.is_colliding()
	):
		player_controller.state_chart.send_event("onStanding")


func _on_crouching_state_entered() -> void:
	player_controller.crouch()
