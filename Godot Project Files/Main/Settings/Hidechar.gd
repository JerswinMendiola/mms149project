extends Button

func _on_hide_pressed() -> void:
	get_parent().get_child(0).secret = !pressed
	if get_parent().get_child(0).secret:
		text = "SHOW"
	else:
		text = "HIDE"
