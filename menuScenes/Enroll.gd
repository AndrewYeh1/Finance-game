extends Tabs

onready var info = get_node("HBoxContainer/VBoxContainer2/Info")
onready var title = get_node("HBoxContainer/VBoxContainer2/Title")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Associates_mouse_entered() -> void:
	title.text = "Associate's (2 years)"
	info.text = "Undergraduate degree (the first stage after secondary school) that aims to give students the basic technical and academic knowledge. It is faster, easier and cheaper than a bachelor."

func _on_Bachelors_mouse_entered() -> void:
	title.text = "Bachelor's (4 years)"
	info.text = "Undergraduate degree (the first stage after secondary school) where students focus on a specific major, or topic of study. It offers more opportunities, is more academic but takes more time."

func _on_Masters_mouse_entered() -> void:
	title.text = "Master's (2 years)"
	info.text = "Postgraduate degree (after obtaining a Bachelor’s Degree). An academic qualification granted to individuals who have successfully undergone study demonstrating a high level of expertise in a specific field of study or area of professional practice."

func _on_phD_mouse_entered() -> void:
	title.text = "phD (4 years)"
	info.text = "Postgraduate degree (after obtaining a Bachelor’s Degree). A doctoral research degree and normally the highest level of academic qualification you can achieve. The degree takes four years of full-time work towards a thesis offering an original contribution to your subject."


func _on_Associates_pressed() -> void:
	title.text = ""
	var cost = 0
	if GameManager.money > cost:
		if GameManager.education != "Associate's":
			info.text = "Sucessfully enrolled!"
			GameManager.money -= cost
			GameManager.education = "Associate's"
			
		else:
			info.text = "You are already enrolled."
	else:
		info.text = "Failed, not enough money. :("
