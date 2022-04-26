extends Button

var data = {}
var accounts = {}
var defaultAccounts = {
	"admin": "password"
}

var savePath = "user://data.save"

func _ready() -> void:
	var invalidRegister = get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register/VBoxContainer/invalid")
	var invalidLogin = get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login/VBoxContainer/invalid")
	invalidLogin.visible = false
	invalidRegister.visible = false
	var file = File.new()
	if file.file_exists(savePath):
		file.open(savePath,File.READ)
		var dict = file.get_var()
		accounts = dict["accounts"]
	else:
		file.open(savePath,File.WRITE)
		var dict = {
			"data": data,
			"accounts": defaultAccounts
		}
		file.store_var(dict)
	file.close()

func register() -> void:
	var usernameInput = get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register/VBoxContainer/username/usernameField").text
	var passwordInput = get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register/VBoxContainer/password/VBoxContainer/createPassword").text
	var confirmPassword = get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register/VBoxContainer/password/VBoxContainer/confirmPassword").text
	var invalidRegister = get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register/VBoxContainer/invalid")
	if usernameInput != " "\
	and confirmPassword == passwordInput\
	and (usernameInput != "Guest" or passwordInput != "Guest"):
		saveNewAccount(usernameInput,passwordInput)
		get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register/VBoxContainer/username/usernameField").text = ""
		get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register/VBoxContainer/password/VBoxContainer/createPassword").text = ""
		get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register/VBoxContainer/password/VBoxContainer/confirmPassword").text = ""
		invalidRegister.visible = false
	else:
		invalidRegister.visible = true

func login() -> void:
	var usernameInput = get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login/VBoxContainer/username/usernameField").text
	var passwordInput = get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login/VBoxContainer/password/passwordField").text
	var invalidLogin = get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login/VBoxContainer/invalid")
	if accounts.has(usernameInput)\
	and accounts[usernameInput] == passwordInput:
		get_tree().current_scene.get_node("Main/show/VBoxContainer/VBoxContainer/add").visible = true
		get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login/VBoxContainer/username/usernameField").text = ""
		get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login/VBoxContainer/password/passwordField").text = ""
		invalidLogin.visible = false
		get_tree().current_scene.get_node("Login").visible = false
		get_tree().current_scene.get_node("Main/VBoxContainer/Welcome Panel/HBoxContainer/welcome").text = "Welcome, " + usernameInput
		Global.loggedUser = usernameInput
		Global.loggedPassword = passwordInput
		var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
		var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
		var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
		var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
		main.visible = true
		data.visible = false
		settings.visible = false
		saveEntry.visible = false
		
	else:
		invalidLogin.visible = true

func saveNewAccount(u,p):
	accounts[u] = p
	var file = File.new()
	file.open(savePath,File.WRITE)
	var dict = {
		"data": data,
		"accounts": accounts
	}
	file.store_var(dict)
	file.close()

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_ENTER):
		if get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login").visible:
			login()
		elif get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Register").visible:
			register()
