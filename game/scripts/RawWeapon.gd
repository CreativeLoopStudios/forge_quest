extends Node2D

onready var sprite = get_node("Sprite")
onready var anim = get_node("Anim")

var texture_name
var hits_before_complete = 0

signal weapon_ready

func _ready():
	pass

func init(texture_name, hits_before_complete):
	self.texture_name = texture_name
	self.sprite.set_texture(load("res://assets/weapons/" + texture_name + ".png"))
	self.hits_before_complete = hits_before_complete

func destroy():
	queue_free()

func _on_PlayerBar_hitted(isHit):
	if isHit and hits_before_complete > 0:
		anim.play("Vibrate")

func _on_Anim_finished():
	hits_before_complete -= 1
	
	if hits_before_complete == 0:
		emit_signal("weapon_ready")
