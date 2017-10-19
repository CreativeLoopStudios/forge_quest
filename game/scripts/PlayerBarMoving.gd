extends Node2D

onready var anim = get_node("Anim")
onready var arrow_area_collider = get_node("Arrow/AreaCollider")

signal hitted

func is_arrow_stopped():
	return not anim.is_playing()

func touch():
	var areas = arrow_area_collider.get_overlapping_areas()
	if not areas.empty():
		emit_signal("hitted", true)
	else:
		emit_signal("hitted", false)

func drag():
	pass