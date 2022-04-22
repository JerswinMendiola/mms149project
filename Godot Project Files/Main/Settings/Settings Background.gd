extends Button

func hideSettings() -> void:
	get_parent().visible = false
	get_node("Panel/VBoxContainer/Change Username/HBoxContainer/warning").visible = false
