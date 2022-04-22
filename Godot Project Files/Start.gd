extends Node2D

func _ready() -> void:
	get_node("Login").visible = true
	get_node("Main").visible = false
	get_node("Data").visible = false
	get_node("Confirm Window").visible = false
	get_node("Settings").visible = false


func createAccount() -> void:
	pass # Replace with function body.
