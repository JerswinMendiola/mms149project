extends Node

var saveFile = "user://data.save"

func _ready() -> void:
	var file = File.new()
	if file.file_exists(saveFile):
		file.open(saveFile, File.READ)
		var savedList = file.get_var(true)
		for i in savedList.values():
			var listItem = load("res://Main/List Item.tscn").instance()
			for x in i.size():
				var item = listItem.get_child(x)
				item.text = i[x]
			var list = get_parent().get_node("Main/ScrollContainer/List")
			list.add_child(listItem)
		var list = get_parent().get_node("Main/ScrollContainer/List")
		var button = get_parent().get_node("Main/ScrollContainer/List/Add")
		list.move_child(button,list.get_child_count())
		file.close()


func save() -> void:
	var count := 1
	var saveDict = {}
	var info = []
	var list = get_parent().get_node("Main/ScrollContainer/List")
	for i in list.get_children():
		info = []
		for x in i.get_children():
			if x is LineEdit:
				info.append(x.text)
		if i is HBoxContainer:
			saveDict[str(count)] = info
			count += 1
	var file = File.new()
	file.open(saveFile,File.WRITE)
	file.store_var(saveDict, true)
	file.close()
	print(saveDict)
