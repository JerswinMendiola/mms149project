extends LineEdit

var dataInItem

func _process(delta: float) -> void:
	if text != "":
		for item in get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty/VBoxContainer/ScrollContainer/item list").get_children():
			if item is HBoxContainer:
				dataInItem = item.get_node("settings/edit").data
				for child in item.get_children():
					if child is LineEdit and child.text in text:
						item.visible = true
						break
					elif dataInItem.values().has(text):
						item.visible = true
						break
					else:
						item.visible = false
	else:
		for item in get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty/VBoxContainer/ScrollContainer/item list").get_children():
			if item is HBoxContainer:
				item.visible = true
