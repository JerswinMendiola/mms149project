extends Button

signal createAccount

func _process(delta: float) -> void:
	if get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer2/HBoxContainer/create username").text != ""\
	and get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer3/HBoxContainer/create password").text != ""\
	and get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer4/HBoxContainer/confirm create password").text != "":
		disabled = false
	else:
		disabled = true

func createAccount() -> void:
	var accounts = get_tree().current_scene.get_node("Login/VBoxContainer/HBoxContainer/login").savedList["accounts"]
	if get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer3/HBoxContainer/create password").text == get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer4/HBoxContainer/confirm create password").text\
	and not accounts.has(get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer2/HBoxContainer/create username").text):
		var newUsername = get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer2/HBoxContainer/create username").text
		var newPassword =  get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer3/HBoxContainer/create password").text
		emit_signal("createAccount",newUsername,newPassword)
		get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer2/HBoxContainer/create username").text = ""
		get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer3/HBoxContainer/create password").text = ""
		get_tree().current_scene.get_node("Settings/Settings Background/Panel/VBoxContainer/Create Account/VBoxContainer4/HBoxContainer/confirm create password").text = ""
	else:
		get_parent().get_node("warning").visible = true
