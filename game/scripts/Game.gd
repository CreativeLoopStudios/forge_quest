extends Node2D

onready var weapon_scn = preload("res://scenes/weapons/RawWeapon.tscn")
onready var raw_weapon = get_node("Weapons/RawWeapon")

const AXE = "axe"
const KNIFE = "knife"

var index_current_weapon = 0
var weapons = []

func _ready():
	weapons.append(AXE)
	weapons.append(KNIFE)
	self._on_RawWeapon_weapon_ready()

func _on_RawWeapon_weapon_ready():
	if index_current_weapon == weapons.size(): return
	
	var current_weapon_name = weapons[index_current_weapon]
	raw_weapon.init(current_weapon_name, 1)
	index_current_weapon += 1