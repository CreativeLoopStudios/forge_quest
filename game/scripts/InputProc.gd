extends Node2D

onready var player_bar = get_node("../PlayerBar")

func _ready():
	pass

func _on_ForgeBtn_pressed():
	player_bar.touch()
