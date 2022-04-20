extends Button

signal deleteEntry
var window

func _ready() -> void:
	window = get_tree().root.get_child(0).get_node("Confirm Window")
	var yes = get_tree().root.get_child(0).get_node("Confirm Window/VBoxContainer/HBoxContainer3/Yes")
	connect("deleteEntry", yes,"saveList")

func delete() -> void:
	window.visible = true
	emit_signal("deleteEntry",get_parent().get_parent())
