extends Button

func entry():
	get_tree().current_scene.get_node("Main").visible = false
	get_tree().current_scene.get_node("Data").visible = true
