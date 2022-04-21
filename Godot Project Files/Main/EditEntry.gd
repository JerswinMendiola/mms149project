extends Button

var data
signal editEntry

func _ready() -> void:
	data = get_tree().root.get_child(0).get_node("Data")
	connect("editEntry", data,"enterExistingData")

func editEntry() -> void:
	var enteredData = {
		"editing": get_parent().get_parent(),
		"name": get_parent().get_parent().get_node("name").text,
		"age": get_parent().get_parent().get_node("age").text,
		"sex": get_parent().get_parent().get_node("sex").text,
		"employee": get_parent().get_parent().get_node("employeenumber").text,
		"pancakes": get_parent().get_parent().get_node("pancakes").text
	}
	get_tree().current_scene.get_node("Main").visible = false
	get_tree().current_scene.get_node("Data").visible = true
	emit_signal("editEntry",enteredData)
