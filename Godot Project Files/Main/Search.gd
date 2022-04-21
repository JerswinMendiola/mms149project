extends LineEdit

func _process(delta: float) -> void:
	if text != "":
		for item in get_parent().get_parent().get_node("ScrollContainer/List").get_children():
			if item is HBoxContainer:
				for child in item.get_children():
					if child is LineEdit and child.text == text:
						item.visible = true
						break
					else:
						item.visible = false
	else:
		for item in get_parent().get_parent().get_node("ScrollContainer/List").get_children():
			if item is HBoxContainer:
				item.visible = true
