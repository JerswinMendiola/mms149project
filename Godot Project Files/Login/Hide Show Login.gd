extends Button

func _pressed() -> void:
	if name == "login":
		get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login").visible = true
		get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register").visible = false
	else:
		get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login").visible = false
		get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register").visible = true
