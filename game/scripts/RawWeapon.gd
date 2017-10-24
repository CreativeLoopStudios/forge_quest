extends Node2D

onready var sprite = get_node("Sprite")
onready var anim = get_node("Anim")

var name = "axe"
var hits_before_complete = 1

signal weapon_ready

func _ready():
	pass

func init(sprite_texture, hits_before_complete, name):
	self.sprite.set_texture(sprite_texture)
	self.hits_before_complete = hits_before_complete
	self.name = name

func destroy():
	queue_free()

func _on_PlayerBar_hitted(isHit):
	if isHit and hits_before_complete > 0:
		anim.play("Vibrate")
		hits_before_complete -= 1
		
	if hits_before_complete == 0:
		emit_signal("weapon_ready")