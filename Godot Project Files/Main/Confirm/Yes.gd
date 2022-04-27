extends Button

signal save
var savedNode
var window

func _ready() -> void:
	window = get_tree().current_scene.get_node("Confirm")

func confirm_Delete() -> void:
	savedNode.free()
	window.visible = false
	savedNode = null
	recolorItems()
	emit_signal("save")

func recolorItems():
	var count = 1
	for i in get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty/VBoxContainer/ScrollContainer/item list").get_children():
		if count % 2 != 0:
			for lines in i.get_children():
				if lines is LineEdit:
					lines.add_stylebox_override("read_only",load("res://Main/Items/Item 1 Color.tres"))
		else:
			for lines in i.get_children():
				if lines is LineEdit:
					lines.add_stylebox_override("read_only",load("res://Main/Items/Item 2 Color.tres"))
		count += 1
