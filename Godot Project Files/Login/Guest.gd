extends Button

func guestSign() -> void:
	get_tree().current_scene.get_node("Login").visible = false
	get_tree().current_scene.get_node("Main/VBoxContainer/Welcome Panel/HBoxContainer/welcome").text = "Welcome, Guest"
	Global.loggedUser = "Guest"
	Global.loggedPassword = "Guest"
	var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
	var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
	var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
	var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
	get_tree().current_scene.get_node("Main/show/VBoxContainer/VBoxContainer/add").visible = false
	main.visible = true
	data.visible = false
	settings.visible = false
	saveEntry.visible = false
