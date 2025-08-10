class_name PlayerState extends Node

var player_controller : PlayerController

func _ready() -> void:
	if %PlayerState and %PlayerState is PlayerStateMachine:
		player_controller = %PlayerState.player_controller
