extends Node2D

func _ready() -> void:
	get_node("Login").visible = true
	get_node("Main").visible = false
	get_node("Data").visible = false
