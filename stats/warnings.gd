extends Control

onready var bills = get_node("PanelContainer2/ScrollContainer/Control/VBoxContainer")

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func create_unpaid_bill(money, bill, consequence):
	show()
	var unpaid = Label.new()
	unpaid.set_name("unpaid")
	unpaid.text = str("$" + str(money) + ": " +  bill + " | " + consequence)
	unpaid.autowrap = true
	unpaid.set("custom_fonts/font", load("res://renner-small.tres"))
	bills.add_child(unpaid)

func _on_Button_pressed() -> void:
	hide()
