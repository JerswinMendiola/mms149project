extends Button

signal save

func _process(delta: float) -> void:
	if get_parent().get_parent().get_node("Name/VBoxContainer2/Name").text != "" and \
	get_parent().get_parent().get_node("Name/VBoxContainer2/EmployeeNumber").text != ""  and\
	get_parent().get_parent().get_node("Name/VBoxContainer2/Pancakes").text != ""  and\
	get_parent().get_parent().get_node("Name/VBoxContainer/HBoxContainer/Age Spin").value != 0  and\
	(get_parent().get_parent().get_node("Name/VBoxContainer2/HBoxContainer/Female").pressed == true or \
	get_parent().get_parent().get_node("Name/VBoxContainer2/HBoxContainer/Male").pressed == true):
		disabled = false
	else:
		disabled = true

func submit() -> void:
	var nameEmployee = get_parent().get_parent().get_node("Name/VBoxContainer2/Name").text
	var employeenumber = get_parent().get_parent().get_node("Name/VBoxContainer2/EmployeeNumber").text
	var pancakes = get_parent().get_parent().get_node("Name/VBoxContainer2/Pancakes").text
	var age = str(get_parent().get_parent().get_node("Name/VBoxContainer/HBoxContainer/Age Spin").value)
	var sex
	if get_parent().get_parent().get_node("Name/VBoxContainer2/HBoxContainer/Female").pressed == true:
		sex = "F"
	else:
		sex = "M"
	
	get_tree().current_scene.get_node("Data").visible = false
	get_tree().current_scene.get_node("Main").visible = true
	get_parent().get_parent().get_node("Name/VBoxContainer2/Name").text = ""
	get_parent().get_parent().get_node("Name/VBoxContainer2/EmployeeNumber").text = ""
	get_parent().get_parent().get_node("Name/VBoxContainer2/Pancakes").text = ""
	get_parent().get_parent().get_node("Name/VBoxContainer/HBoxContainer/Age Spin").value = 0
	get_parent().get_parent().get_node("Name/VBoxContainer2/HBoxContainer/Female").pressed = false
	get_parent().get_parent().get_node("Name/VBoxContainer2/HBoxContainer/Male").pressed = false

	var enteredData = [nameEmployee,age,sex,employeenumber,pancakes]
	if get_tree().current_scene.get_node("Data").editingEntry == null:
		var container = load("res://Main/List Item.tscn").instance()
		var count := 0
		for i in enteredData:
			var editing = container.get_child(count)
			editing.text = i
			count += 1
		var list = get_parent().get_parent().get_parent().get_node("Main/ScrollContainer/List")
		list.add_child(container)
		var button = get_parent().get_parent().get_parent().get_node("Main/ScrollContainer/List/Add")
		list.move_child(button,list.get_child_count())
	else:
		var editItem = get_tree().current_scene.get_node("Data").editingEntry
		var count := 0
		for i in enteredData:
			var editing = editItem.get_child(count)
			editing.text = i
			count += 1
	emit_signal("save")
