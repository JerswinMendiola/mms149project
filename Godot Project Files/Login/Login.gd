extends Button

var saveFile = "user://data.save"
var username
var password

var savedList = {}
var accounts = {}
var defaultAccounts = {
	"admin": "password"
}


func _ready() -> void:
	var file = File.new()
	if file.file_exists(saveFile):
		file.open(saveFile, File.READ)
		savedList = file.get_var(true)
		file.close()

func _process(delta: float) -> void:
	if get_tree().current_scene.get_node("Login").visible == true:
		username = get_parent().get_parent().get_node("username/usernameField").text
		password = get_parent().get_parent().get_node("password/passwordField").text
		if username and password != "":
			disabled = false
			if Input.is_key_pressed(KEY_ENTER):
				verify()
		else:
			disabled = true

func verify():
	if savedList.size() != 0:
		for savedUsername in savedList["accounts"].keys():
			if savedUsername == username and savedList["accounts"][savedUsername] == password:
				logIn()
			else:
				get_parent().get_parent().get_node("invalid").visible = true
	else:
		if username == "admin" and password == "password":
			logIn()
			var file = File.new()
			file.open(saveFile, File.WRITE)
			var newSave = {
				"accounts": defaultAccounts,
				"data":null
			}
			print(newSave)
			savedList = newSave
			file.store_var(newSave, true)
			file.close()
		else:
			get_parent().get_parent().get_node("invalid").visible = true
func logIn():
	emit_signal("logged")
	get_tree().current_scene.get_node("Login").visible = false
	get_tree().current_scene.get_node("Main").visible = true


func _on_Submit_changeUser(newUser) -> void:
	savedList["accounts"][newUser] = savedList["accounts"][username]
	savedList["accounts"].erase(username)
	username = newUser
	print(savedList)
	var file = File.new()
	if file.file_exists(saveFile):
		file.open(saveFile, File.WRITE)
		file.store_var(savedList, true)
		file.close()

func _on_Submit_changePass(newPass) -> void:
	print(username)
	savedList["accounts"][username] = newPass
	password = newPass
	print(savedList)
	var file = File.new()
	if file.file_exists(saveFile):
		file.open(saveFile, File.WRITE)
		file.store_var(savedList, true)
		file.close()
