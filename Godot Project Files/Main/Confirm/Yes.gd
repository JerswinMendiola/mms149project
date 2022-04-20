extends Button

var savedNode
var window

func _ready() -> void:
	window = get_parent().get_parent().get_parent()

func saveList(saved):
	savedNode = saved
	print("recieved")

func confirm_Delete() -> void:
	savedNode.queue_free()
	window.visible = false
