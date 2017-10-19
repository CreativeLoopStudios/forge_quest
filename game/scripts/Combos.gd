extends Control

onready var combo_label = get_node("ComboLabel")

var combos = 0

func reset_combo():
	combos = 0
	hide()

func _on_PlayerPhysicsBar_hitted(isHit):
	if isHit:
		combos += 1
		combo_label.set_text(str(combos) + " combos")
		show()
	else:
		reset_combo()