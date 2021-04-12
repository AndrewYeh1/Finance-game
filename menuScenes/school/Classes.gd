extends Tabs


onready var degree = get_node("VBoxContainer/HBoxContainer/Degree")
onready var year = get_node("VBoxContainer/HBoxContainer/Year")
onready var card = get_node("VBoxContainer/ReportCard")
onready var degrees = get_node("VBoxContainer/Degrees")

onready var marks = get_node("VBoxContainer/ReportCard/marks")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

func _display_grades():
	
	
	
	delete_children(marks)
	
	if GameManager.education != "":
		degree.text = str(GameManager.education) + " Degree"
		year.text = "Year: " + str(GameManager.edyear)
	else:
		degree.text = "Not Enrolled"
		year.text = ""
	
	var count = -1
	for value in GameManager.marks:
		count += 1
		if value:
			if count == 0:
				var degree = Label.new()
				degree.set_name("Associate's")
				degree.text = str("Associate's Degree Marks")
				degree.set("custom_fonts/font", load("res://renner-bold-gui.tres"))
				marks.add_child(degree)
				display_marks(value)
			
			if count == 1:
				var degree = Label.new()
				degree.set_name("Bachelor's")
				degree.text = str("Bachelor's Degree Marks")
				degree.set("custom_fonts/font", load("res://renner-bold-gui.tres"))
				marks.add_child(degree)
				display_marks(value)
			
			if count == 2:
				var degree = Label.new()
				degree.set_name("Master's")
				degree.text = str("Master's Degree Marks")
				degree.set("custom_fonts/font", load("res://renner-bold-gui.tres"))
				marks.add_child(degree)
				display_marks(value)
				
			if count == 3:
				var degree = Label.new()
				degree.set_name("phD")
				degree.text = str("phD Degree Marks")
				degree.set("custom_fonts/font", load("res://renner-bold-gui.tres"))
				marks.add_child(degree)
				display_marks(value)

func display_marks(value):
	var j = 0
	for i in value:
		j += 1
		var mark = Label.new()
		mark.set_name("mark")
		mark.text = "Year " + str(j) + " : " + str(i) + "%"
		mark.set("custom_fonts/font", load("res://renner-smaller.tres"))
		marks.add_child(mark)

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
