extends Button

signal changeUser

func _process(delta: float) -> void:
	if get_parent().get_parent().get_node("VBoxContainer2/old username field").text != ""\
	and get_parent().get_parent().get_node("VBoxContainer3/new username field").text != ""\
	and get_parent().get_parent().get_node("VBoxContainer4/confirm username field").text != "":
		disabled = false
	else:
		disabled = true

func changeUsername() -> void:
	var loggedUser = get_tree().current_scene.get_node("Login/VBoxContainer/HBoxContainer/login").username
	if get_parent().get_parent().get_node("VBoxContainer2/old username field").text == loggedUser\
	and get_parent().get_parent().get_node("VBoxContainer3/new username field").text == get_parent().get_parent().get_node("VBoxContainer4/confirm username field").text:
		var newUsername = get_parent().get_parent().get_node("VBoxContainer4/confirm username field").text
		emit_signal("changeUser",newUsername)
		get_parent().get_parent().get_node("VBoxContainer2/old username field").text = ""
		get_parent().get_parent().get_node("VBoxContainer3/new username field").text = ""
		get_parent().get_parent().get_node("VBoxContainer4/confirm username field").text = ""
	else:
		get_parent().get_node("warning").visible = true
