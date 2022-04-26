extends Button

func viewRecord() -> void:
	var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
	var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
	var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
	var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
	main.visible = true
	data.visible = false
	settings.visible = false
	saveEntry.visible = false

func addRecord() -> void:
	var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
	var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
	var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
	var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
	main.visible = false
	data.visible = true
	settings.visible = false
	saveEntry.visible = true

func logOut() -> void:
	var login = get_tree().current_scene.get_node("Login")
	login.visible = true
	get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login/VBoxContainer/username/usernameField").text = ""
	get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login/VBoxContainer/password/passwordField").text = ""
	get_tree().current_scene.get_node("Main/ProfileSettings").visible = false

func settings() -> void:
	var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
	var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
	var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
	var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
	get_tree().current_scene.get_node("Main/ProfileSettings").visible = false
	main.visible = false
	data.visible = false
	settings.visible = true
	saveEntry.visible = false
