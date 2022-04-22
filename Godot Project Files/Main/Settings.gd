extends Button

func openSettings() -> void:
	get_tree().current_scene.get_node("Settings").visible = true
