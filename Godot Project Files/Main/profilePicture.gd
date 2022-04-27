extends TextureButton

func profilePicture() -> void:
	if Global.loggedUser == "Guest" or Global.loggedPassword == "Guest":
		get_tree().current_scene.get_node("Main/ProfileSettings/Panel4/VBoxContainer/settings").visible = false
	else:
		get_tree().current_scene.get_node("Main/ProfileSettings/Panel4/VBoxContainer/settings").visible = true
	get_tree().current_scene.get_node("Main/ProfileSettings").visible = !get_tree().current_scene.get_node("Main/ProfileSettings").visible
