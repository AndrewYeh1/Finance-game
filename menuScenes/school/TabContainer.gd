extends TabContainer


onready var enroll = get_node("Enroll")
onready var classes = get_node("Attend Class")
onready var marks = get_node("Classes")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	classes.load_question()
	marks._display_grades()
	pass


func _on_TabContainer_tab_selected(tab: int) -> void:
	print(tab) # Replace with function body.
	


func _on_TabContainer_tab_changed(tab: int) -> void:
	if tab == 1:
		classes.load_question()
	if tab == 2:
		marks._display_grades()

