@tool
extends Control

@export_category("References")
@export var velocity_component: VelocityComponent

@export_category("General Reticle Settings")
@export var reticle_color: Color = Color.WHITE:
	set = set_reticle_color
@export var reticle_width: float = 1.0:
	set = set_reticle_width

@export_category("Center Reticle")
@export var dot_radius: float = 1.0:
	set = set_dot_radius

@export_category("Left Line")
@export var left_reticle_starting_point: Vector2 = Vector2(-30, 0):
	set = set_left_reticle_starting_point
@export var left_reticle_finishing_point: Vector2 = Vector2(-15, 0):
	set = set_left_reticle_finishing_point

@export_category("Right Line")
@export var right_reticle_starting_point: Vector2 = Vector2(30, 0):
	set = set_right_reticle_starting_point
@export var right_reticle_finishing_point: Vector2 = Vector2(15, 0):
	set = set_right_reticle_finishing_point


func _draw() -> void:
	draw_side_reticle()
	draw_center_reticle()


func draw_side_reticle():
	draw_line(
		left_reticle_starting_point,
		left_reticle_finishing_point,
		reticle_color,
		reticle_width,
		true
	)
	draw_line(
		right_reticle_starting_point,
		right_reticle_finishing_point,
		reticle_color,
		reticle_width,
		true
	)


func draw_center_reticle():
	draw_circle(Vector2(0, 0), dot_radius, reticle_color)


func update_crosshair():
	queue_redraw()


#Setters
func set_reticle_color(new_reticle_color):
	reticle_color = new_reticle_color
	update_crosshair()


func set_reticle_width(new_reticle_width):
	reticle_width = new_reticle_width
	update_crosshair()


func set_dot_radius(new_set_dot_radius):
	dot_radius = new_set_dot_radius
	update_crosshair()


func set_left_reticle_starting_point(new_left_reticle_starting_point):
	left_reticle_starting_point = new_left_reticle_starting_point
	update_crosshair()


func set_left_reticle_finishing_point(new_left_reticle_finishing_point):
	left_reticle_finishing_point = new_left_reticle_finishing_point
	update_crosshair()


func set_right_reticle_starting_point(new_right_reticle_starting_point):
	right_reticle_starting_point = new_right_reticle_starting_point
	update_crosshair()


func set_right_reticle_finishing_point(new_right_reticle_finishing_point):
	right_reticle_finishing_point = new_right_reticle_finishing_point
	update_crosshair()
