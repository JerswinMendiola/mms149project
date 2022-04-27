extends Node

var savePath = "user://data.save"
var dict

func _ready() -> void:
	var file = File.new()
	if file.file_exists(savePath):
		file.open(savePath,File.READ)
		dict = file.get_var()
		for i in dict["data"].values():
			var item
			if get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty/VBoxContainer/ScrollContainer/item list").get_child_count() % 2 == 0:
				item = load("res://Main/Items/List Item.tscn").instance()
			else:
				item = load("res://Main/Items/List Item 2.tscn").instance()
			item.get_node("settings/edit").data = i
			item.get_node("settings/view").data = i
			if i["middle name"] != "":
				item.get_node("name").text = i["first name"] + " " + i["middle name"].left(1) + ". " + i["last name"]
			else:
				item.get_node("name").text = i["first name"] + " " + i["last name"]
			item.get_node("age").text = str(i["age"])
			if i["sex"] == 0:
				item.get_node("sex").text = "M"
			else:
				item.get_node("sex").text = "F"
			item.get_node("position").text = i["emp position"]
			item.get_node("department").text = i["department"]
			get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty/VBoxContainer/ScrollContainer/item list").add_child(item)
		file.close()

func save() -> void:
	var file = File.new()
	file.open(savePath,File.READ)
	dict = file.get_var()
	file.close()
	var accounts = dict["accounts"]
	var data = {}
	var count = 1
	for i in get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty/VBoxContainer/ScrollContainer/item list").get_children():
		data[count] = i.get_node("settings/view").data
		count += 1
	var saveDict = {
		"accounts": accounts,
		"data": data
	}
	file.open(savePath,File.WRITE)
	file.store_var(saveDict,true)
	file.close()
	print("SAVED!")
