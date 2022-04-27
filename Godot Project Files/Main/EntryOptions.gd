extends Button

var data = {}
var infoPath = ["Main/VBoxContainer/Main Panel/Data/VBoxContainer/Personal Info/HBoxContainer/VBoxContainer/first name",
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

func _process(delta: float) -> void:
	if Global.loggedUser == "Guest":
		if name == "edit" or name == "delete":
			disabled = true
	else:
		disabled = false

func editEntry() -> void:
	var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
	var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
	var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
	var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
	main.visible = false
	data.visible = true
	settings.visible = false
	saveEntry.visible = true
	for i in infoPath:
		if get_tree().current_scene.get_node(i) is LineEdit:
			get_tree().current_scene.get_node(i).editable = true
		elif get_tree().current_scene.get_node(i) is OptionButton:
			get_tree().current_scene.get_node(i).disabled = false
		elif get_tree().current_scene.get_node(i) is SpinBox:
			get_tree().current_scene.get_node(i).editable = true
	supplyData()
	get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save").editEntry = get_parent().get_parent()

func viewEntry() -> void:
	var main = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Main")
	var data = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Data")
	var settings = get_tree().current_scene.get_node("Main/VBoxContainer/Main Panel/Settings")
	var saveEntry = get_tree().current_scene.get_node("Main/VBoxContainer/Footer Panel/HBoxContainer/Save")
	main.visible = false
	data.visible = true
	settings.visible = false
	saveEntry.visible = false
	for i in infoPath:
		if get_tree().current_scene.get_node(i) is LineEdit:
			get_tree().current_scene.get_node(i).editable = false
		elif get_tree().current_scene.get_node(i) is OptionButton:
			get_tree().current_scene.get_node(i).disabled = true
		elif get_tree().current_scene.get_node(i) is SpinBox:
			get_tree().current_scene.get_node(i).editable = false
	supplyData()

func supplyData():
	for i in data.keys():
		for node in infoPath:
			if get_tree().current_scene.get_node(node).name == i:
				if get_tree().current_scene.get_node(node) is LineEdit:
					get_tree().current_scene.get_node(node).text = data[i]
				elif get_tree().current_scene.get_node(node) is OptionButton:
					get_tree().current_scene.get_node(node).selected = int(data[i])
				elif get_tree().current_scene.get_node(node) is SpinBox:
					get_tree().current_scene.get_node(node).value = int(data[i])
				break

func deleteEntry() -> void:
	get_tree().current_scene.get_node("Confirm/Confirm Window/VBoxContainer/HBoxContainer3/Yes").savedNode = get_parent().get_parent()
	get_tree().current_scene.get_node("Confirm").visible = true
