extends Button

var oldUsername
var newUsername
var confirmUsername
var oldPassword
var newPassword
var confirmPassword
var deleteUser
var deletePassword

func changeUsername() -> void:
	oldUsername = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Username/HBoxContainer/VBoxContainer/old username").text
	newUsername = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Username/HBoxContainer/VBoxContainer/new username").text
	confirmUsername = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Username/HBoxContainer/VBoxContainer/confirm username").text
	if oldUsername != ""\
	and newUsername != ""\
	and confirmUsername != ""\
	and Global.loggedUser == oldUsername\
	and newUsername == confirmUsername:
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Username/HBoxContainer/VBoxContainer/old username").text = ""
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Username/HBoxContainer/VBoxContainer/new username").text = ""
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Username/HBoxContainer/VBoxContainer/confirm username").text = ""
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Username/HBoxContainer/VBoxContainer/invalid").visible = false
	else:
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Username/HBoxContainer/VBoxContainer/invalid").visible = true
func changePassword() -> void:
	oldPassword = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Password/HBoxContainer/VBoxContainer/old password").text
	newPassword = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Password/HBoxContainer/VBoxContainer/new password").text
	confirmPassword = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Password/HBoxContainer/VBoxContainer/confirm password").text
	if oldPassword != ""\
	and newPassword != ""\
	and confirmPassword != ""\
	and Global.loggedPassword == oldPassword\
	and newPassword == confirmPassword:
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Password/HBoxContainer/VBoxContainer/old password").text = ""
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Password/HBoxContainer/VBoxContainer/new password").text = ""
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Password/HBoxContainer/VBoxContainer/confirm password").text = ""
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Password/HBoxContainer/VBoxContainer/invalid").visible = false
	else:
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Change Password/HBoxContainer/VBoxContainer/invalid").visible = true
func deleteAccount() -> void:
	deleteUser = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Delete Account/HBoxContainer/VBoxContainer/delete username").text
	deletePassword = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Delete Account/HBoxContainer/VBoxContainer/delete password").text
	if deleteUser != ""\
	and deletePassword != ""\
	and Global.loggedUser == deleteUser\
	and Global.loggedPassword == deletePassword:
		Global.loggedUser = null
		Global.loggedPassword = null
		get_tree().current_scene.get_node("Login").visible = true
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Delete Account/HBoxContainer/VBoxContainer/delete username").text = ""
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Delete Account/HBoxContainer/VBoxContainer/delete password").text = ""
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Delete Account/HBoxContainer/VBoxContainer/invalid").visible = false
	else:
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings/VBoxContainer2/VBoxContainer/Delete Account/HBoxContainer/VBoxContainer/invalid").visible = true
