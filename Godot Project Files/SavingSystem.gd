extends Node

var saveFile = "user://data.save"
var accounts = {
	"admin": "password"
}

func _ready() -> void:
	var file = File.new()
	if file.file_exists(saveFile):
		file.open(saveFile, File.READ)
		var savedList = file.get_var(true)
		if  savedList["data"] != null:
			for i in savedList["data"].values():
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
	var file = File.new()
	file.open(saveFile,File.READ_WRITE)
	var currentDict = file.get_var(true)
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
	var dict = {
		"data": saveDict,
		"accounts": currentDict["accounts"]
	}
	print(dict)
	file.store_var(dict, true)
	file.close()
