extends Node2D

onready var arrow = get_node("Arrow")
onready var arrow_area_collider = get_node("Arrow/AreaCollider")

signal hitted

func is_arrow_stopped():
	return arrow.get_linear_velocity() == Vector2(0, 0)

func touch():
	var areas = arrow_area_collider.get_overlapping_areas()
	if not areas.empty():
		emit_signal("hitted", true)
	elif not is_arrow_stopped():
		emit_signal("hitted", false)

	if is_arrow_stopped():
		arrow.apply_impulse(Vector2(0, 0), Vector2(0, -800))