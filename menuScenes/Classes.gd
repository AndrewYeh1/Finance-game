extends Tabs


onready var degree = get_node("VBoxContainer/HBoxContainer/Degree")
onready var year = get_node("VBoxContainer/HBoxContainer/Year")
onready var card = get_node("VBoxContainer/ReportCard")
onready var degrees = get_node("VBoxContainer/Degrees")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameManager.education != "":
		degree = GameManager.education
		year = GameManager.year
		
	for i in GameManager.marks:
		var mark = Label.new()
		mark.set_name("mark")
		mark.text = str(i)
		mark.set("custom_fonts/font", load("res://renner-small.tres"))
		card.add_child(mark)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
