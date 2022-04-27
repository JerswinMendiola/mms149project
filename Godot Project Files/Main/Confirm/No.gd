extends Button

func _on_No_pressed() -> void:
	get_tree().current_scene.get_node("Confirm").visible = false
	get_parent().get_node("Yes").savedNode = null
