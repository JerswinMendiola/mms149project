extends Button

func cancel() -> void:
	get_tree().current_scene.get_node("Data").visible = false
	get_tree().current_scene.get_node("Main").visible = true
	get_tree().current_scene.get_node("Data").editingEntry = null
