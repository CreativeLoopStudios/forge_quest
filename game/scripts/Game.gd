extends Node2D

onready var weapon = preload("res://scenes/weapons/RawWeapon.tscn")

onready var weapons_group = get_node("Weapons")
onready var current_weapon = get_node("Weapons/RawWeapon")

func _ready():
	pass

func _on_RawWeapon_weapon_ready():
	var new_weapon = weapon.instance()
	weapons_group.add_child(new_weapon)

	new_weapon.set_pos(current_weapon.get_pos())
	# change to next job on the list
	new_weapon.init(load("res://assets/weapons/knife.png"), 5, "knife")
	
	current_weapon.destroy()
	current_weapon = new_weapon

func _on_Timer_timeout():
	print(current_weapon.name)
