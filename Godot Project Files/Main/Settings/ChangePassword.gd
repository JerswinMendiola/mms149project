extends Button

signal changePass

func _process(delta: float) -> void:
	if get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Change Password/VBoxContainer2/HBoxContainer/old password field").text != ""\
	and get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Change Password/VBoxContainer3/HBoxContainer/new password field").text != ""\
	and get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Change Password/VBoxContainer4/HBoxContainer/confirm password field").text != "":
		disabled = false
	else:
		disabled = true

func changePassword() -> void:
	var loggedPass = get_tree().current_scene.get_node("Login/VBoxContainer/HBoxContainer/login").password
	if get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Change Password/VBoxContainer2/HBoxContainer/old password field").text == loggedPass\
	and get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Change Password/VBoxContainer3/HBoxContainer/new password field").text == get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Change Password/VBoxContainer4/HBoxContainer/confirm password field").text:
		var newpassword = get_parent().get_parent().get_node("VBoxContainer4/HBoxContainer/confirm password field").text
		emit_signal("changePass",newpassword)
		get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Change Password/VBoxContainer2/HBoxContainer/old password field").text = ""
		get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Change Password/VBoxContainer3/HBoxContainer/new password field").text = ""
		get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Change Password/VBoxContainer4/HBoxContainer/confirm password field").text = ""
	else:
		get_parent().get_node("warning").visible = true
