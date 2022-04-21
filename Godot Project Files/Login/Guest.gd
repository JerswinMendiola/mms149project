extends Button

func guestSign() -> void:
	get_tree().current_scene.get_node("Login").visible = false
	get_tree().current_scene.get_node("Main").visible = true
	get_tree().current_scene.get_node("Main/HBoxContainer2/Add").visible = false
	get_tree().current_scene.get_node("Main/ScrollContainer/List/Add").visible = false
	get_tree().current_scene.get_node("Main/Categories/Settings").visible = false
	for item in get_tree().current_scene.get_node("Main/ScrollContainer/List").get_children():
		if item is HBoxContainer:
			for child in item.get_children():
				if child is HBoxContainer:
					child.visible = false
