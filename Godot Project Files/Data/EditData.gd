extends VBoxContainer

var editingEntry

func enterExistingData(data):
	editingEntry = data["editing"]
	get_node("Name/VBoxContainer2/Name").text = data["name"]
	get_node("Name/VBoxContainer/HBoxContainer/Age Spin").value = int(data["age"])
	get_node("Name/VBoxContainer2/EmployeeNumber").text = data["employee"]
	get_node("Name/VBoxContainer2/Pancakes").text = data["pancakes"]
	if data["sex"] == "M":
		get_node("Name/VBoxContainer2/HBoxContainer/Male").pressed = true
	else:
		get_node("Name/VBoxContainer2/HBoxContainer/Female").pressed = true
