extends PanelContainer

func _process(delta: float) -> void:
	if get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty/VBoxContainer/ScrollContainer/item list").get_child_count() > 0:
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty").visible = true
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Empty").visible = false
	else:
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Empty").visible = true
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty").visible = false
