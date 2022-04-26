extends TextureButton

var open := true

func _on_menu_pressed() -> void:
	if open:
		get_tree().current_scene.get_node("Main/show").visible = false
		get_tree().current_scene.get_node("Main/hide").visible = true
	else:
		get_tree().current_scene.get_node("Main/show").visible = true
		get_tree().current_scene.get_node("Main/hide").visible = false
	open = !open
