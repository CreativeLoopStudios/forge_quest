extends Node2D

onready var arrow = get_node("Bar/Arrow")
onready var arrow_position = get_node("Bar/Arrow/Position2D")
onready var area2d_collision = get_node("Area2D/Collision")

func _ready():
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.SCREEN_TOUCH && event.pressed:
		var space_state = get_world_2d().get_direct_space_state()
		var result = space_state.intersect_ray(get_node("Bar/Arrow").get_global_pos(), get_node("Bar/Arrow/Position2D").get_global_pos(), [self])
		print(get_node("Bar/Arrow/Position2D").get_global_pos())
		if result.size() == 0:
			print("vazio")
		else:
			print("teste")