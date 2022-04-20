extends Button

var username
var password

func _process(delta: float) -> void:
	username = get_parent().get_node("username/usernameField").text
	password = get_parent().get_node("password/passwordField").text
	if username and password != "":
		disabled = false
		if Input.is_key_pressed(KEY_ENTER):
			verify()
	else:
		disabled = true

func verify():
	if not username == "admin" and not password == "password":
		emit_signal("logged")
		get_tree().current_scene.get_node("Login").visible = false
		get_tree().current_scene.get_node("Main").visible = true
	else:
		get_parent().get_node("invalid").visible = true
