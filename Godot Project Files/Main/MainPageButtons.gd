extends Button

signal save
var item
var details = ["Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer/first name",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer2/middle name",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer3/last name",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer/sex/sex",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer/birthday/LineEdit2/month birthday",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer/birthday/LineEdit2/day birthday",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer/birthday/LineEdit2/year birthday",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer2/place birth",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer3/nationality",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer/address",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer2/tin",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer3/philhealth",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer2/sss",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer3/hdmf",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Education/HBoxContainer/VBoxContainer/educ attainment",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Education/HBoxContainer/VBoxContainer2/school name",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Education/HBoxContainer/VBoxContainer/educ attend from/LineEdit2/educ month from",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Education/HBoxContainer/VBoxContainer/educ attend from/LineEdit2/educ day from",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Education/HBoxContainer/VBoxContainer/educ attend from/LineEdit2/educ year from",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Education/HBoxContainer/VBoxContainer2/educ attend to/LineEdit2/educ month to",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Education/HBoxContainer/VBoxContainer2/educ attend to/LineEdit2/educ day to",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Education/HBoxContainer/VBoxContainer2/educ attend to/LineEdit2/educ year to",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Employment/HBoxContainer/VBoxContainer/emp position",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Employment/HBoxContainer/VBoxContainer2/department",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Employment/HBoxContainer/VBoxContainer3/emp attended/LineEdit2/employ month",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Employment/HBoxContainer/VBoxContainer3/emp attended/LineEdit2/employ day",
	"Main/VBoxContainer/Main Panel/Data/VBoxContainer/Employment/HBoxContainer/VBoxContainer3/emp attended/LineEdit2/employ year"]
var editEntry

func viewRecord() -> void:
	var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
	var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
	var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
	var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
	main.visible = true
	data.visible = false
	settings.visible = false
	saveEntry.visible = false
	for i in details:
		if get_tree().current_scene.get_node(i) is LineEdit:
			get_tree().current_scene.get_node(i).editable = true
		elif get_tree().current_scene.get_node(i) is OptionButton:
			get_tree().current_scene.get_node(i).disabled = false
		elif get_tree().current_scene.get_node(i) is SpinBox:
			get_tree().current_scene.get_node(i).editable = true

func addRecord() -> void:
	var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
	var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
	var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
	var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
	main.visible = false
	data.visible = true
	settings.visible = false
	saveEntry.visible = true
	editEntry = null
	for i in details:
		if get_tree().current_scene.get_node(i) is LineEdit:
			get_tree().current_scene.get_node(i).text = ""
		elif get_tree().current_scene.get_node(i) is OptionButton:
			get_tree().current_scene.get_node(i).selected = 0
		elif get_tree().current_scene.get_node(i) is SpinBox:
			if get_tree().current_scene.get_node(i).name == "day birthday"\
			or get_tree().current_scene.get_node(i).name == "employ day"\
			or get_tree().current_scene.get_node(i).name == "educ day to"\
			or get_tree().current_scene.get_node(i).name == "educ day from":
				get_tree().current_scene.get_node(i).value = 1
			elif get_tree().current_scene.get_node(i).name == "year birthday"\
			or get_tree().current_scene.get_node(i).name == "employ year"\
			or get_tree().current_scene.get_node(i).name == "educ year to"\
			or get_tree().current_scene.get_node(i).name == "educ year from":
				get_tree().current_scene.get_node(i).value = 2022

	for i in details:
		if get_tree().current_scene.get_node(i) is LineEdit:
			get_tree().current_scene.get_node(i).editable = true
		elif get_tree().current_scene.get_node(i) is OptionButton:
			get_tree().current_scene.get_node(i).disabled = false
		elif get_tree().current_scene.get_node(i) is SpinBox:
			get_tree().current_scene.get_node(i).editable = true

func logOut() -> void:
	var login = get_tree().current_scene.get_node("Login")
	login.visible = true
	get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login/VBoxContainer/username/usernameField").text = ""
	get_tree().current_scene.get_node("Login/HBoxContainer/Panel2/Node2D/VBoxContainer/Login/VBoxContainer/password/passwordField").text = ""
	get_tree().current_scene.get_node("Main/ProfileSettings").visible = false

func settings() -> void:
	var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
	var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
	var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
	var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
	get_tree().current_scene.get_node("Main/ProfileSettings").visible = false
	main.visible = false
	data.visible = false
	settings.visible = true
	saveEntry.visible = false

func createEntry() -> void:
	var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
	var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
	var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
	var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
	main.visible = true
	data.visible = false
	settings.visible = false
	saveEntry.visible = false
	var itemInfo = {}
	for i in details:
		if get_tree().current_scene.get_node(i) is LineEdit:
			itemInfo[get_tree().current_scene.get_node(i).name] = get_tree().current_scene.get_node(i).text
		elif get_tree().current_scene.get_node(i) is SpinBox:
			itemInfo[get_tree().current_scene.get_node(i).name] = get_tree().current_scene.get_node(i).value
		elif get_tree().current_scene.get_node(i) is OptionButton:
			itemInfo[get_tree().current_scene.get_node(i).name] = get_tree().current_scene.get_node(i).selected
	if editEntry:
		item = editEntry
	else:
		if get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty/VBoxContainer/ScrollContainer/item list").get_child_count() % 2 == 0:
			item = load("res://Main/Items/List Item.tscn").instance()
		else:
			item = load("res://Main/Items/List Item 2.tscn").instance()
	if itemInfo["middle name"] != "":
		item.get_node("name").text = itemInfo["first name"] + " " + itemInfo["middle name"].left(1) + ". " + itemInfo["last name"]
	else:
		item.get_node("name").text = itemInfo["first name"] + " " + itemInfo["last name"]
	var currentTime = OS.get_date()
	var age = int(currentTime["year"]) - int(itemInfo["year birthday"])
	if int(itemInfo["month birthday"]) + 1 <= currentTime["month"]\
	and int(itemInfo["day birthday"]) <= currentTime["day"]:
		age += 1
	itemInfo["age"] = age
	item.get_node("age").text = str(itemInfo["age"])
	if itemInfo["sex"] == 0:
		item.get_node("sex").text = "M"
	else:
		item.get_node("sex").text = "F"
	item.get_node("position").text = itemInfo["emp position"]
	item.get_node("department").text = itemInfo["department"]
	item.get_node("settings/edit").data = itemInfo
	item.get_node("settings/view").data = itemInfo
	if not editEntry:
		get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main/Not Empty/VBoxContainer/ScrollContainer/item list").add_child(item)
	emit_signal("save")
