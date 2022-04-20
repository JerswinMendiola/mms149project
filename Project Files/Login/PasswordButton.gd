extends Button

var show := false

func _on_Button_pressed() -> void:
	show = !show
	if show:
		set_text("HIDE")
	else:
		set_text("SHOW")
	get_parent().get_node("passwordField").secret = !show
	print(show)


func verify() -> void:
	pass # Replace with function body.
