extends Node2D

onready var player_bar = get_node("../PlayerBar")

var drag = false

func _ready():
	set_process_input(true)

func _input(event):
	event = make_input_local(event)
	
	if event.type == InputEvent.SCREEN_TOUCH:
		if event.pressed:
			touch()
		else:
			released()

	if event.type == InputEvent.SCREEN_DRAG:
		drag()

func touch():
	if not player_bar.is_arrow_stopped():
		player_bar.touch()

func drag():
	if not drag and player_bar.is_arrow_stopped():
		drag = true
		player_bar.drag()
	
func released():
	drag = false