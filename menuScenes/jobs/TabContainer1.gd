extends TabContainer

onready var jobs = get_node("Apply/jobs")
onready var job1 = get_node("Apply/jobs/job1")
onready var job2 = get_node("Apply/jobs/job2")
onready var job3 = get_node("Apply/jobs/job3")
onready var job4 = get_node("Apply/jobs/job4")

onready var title = get_node("Apply/job/Title")
onready var info = get_node("Apply/job/info")

onready var work = get_node("Work")

onready var current = get_node("Apply/currentjob")
onready var quit = get_node("Apply/Quit")

onready var fullyear = get_node("Work/Work/main/fullyear")
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.job[0] != "":
		quit.show()
		current.text = GameManager.job[0] + ": $" + str(GameManager.job[1])
	else:
		current.text = ""
		quit.hide()


func show_jobs():
	job1.text = GameManager.avalmed[0][0] + " $" + str(GameManager.avalmed[0][1])
	job2.text = GameManager.avalmed[1][0] + " $" + str(GameManager.avalmed[1][1])
	job3.text = GameManager.avalmed[2][0] + " $" + str(GameManager.avalmed[2][1])
	job4.text = GameManager.avalmed[3][0] + " $" + str(GameManager.avalmed[3][1])
	
	
	#unpaid.set_name("job")
	#unpaid.text = str("$" + str(money) + ": " +  bill + " | " + consequence)
	#unpaid.autowrap = true
	#unpaid.set("custom_fonts/font", load("res://renner-small.tres"))
	#jobs.add_child(unpaid)


func _on_job1_mouse_entered() -> void:
	title.text = GameManager.avalmed[0][0] + " $" + str(GameManager.avalmed[0][1])
	info.text = "Exp: " + str(GameManager.avalmed[0][2]) + "\nDegrees: " + str(GameManager.avalmed[0][3])
	pass # Replace with function body.


func _on_job2_mouse_entered() -> void:
	title.text = GameManager.avalmed[1][0] + " $" + str(GameManager.avalmed[0][1])
	info.text = "Exp: " + str(GameManager.avalmed[1][2]) + "\nDegrees: " + str(GameManager.avalmed[1][3])
	pass # Replace with function body.


func _on_job3_mouse_entered() -> void:
	title.text = GameManager.avalmed[2][0] + " $" + str(GameManager.avalmed[1][1])
	info.text = "Exp: " + str(GameManager.avalmed[2][2]) + "\nDegrees: " + str(GameManager.avalmed[2][3])
	pass # Replace with function body.


func _on_job4_mouse_entered() -> void:
	title.text = GameManager.avalmed[3][0] + " $" + str(GameManager.avalmed[2][1])
	info.text = "Exp: " + str(GameManager.avalmed[3][2]) + "\nDegrees: " + str(GameManager.avalmed[3][3])
	pass # Replace with function body.



func _on_TabContainer_tab_changed(tab: int) -> void:
	if tab == 1:
		work.update_job()


func _on_job1_pressed() -> void:
	if GameManager.job[0] == "":
		if GameManager.experience >= GameManager.avalmed[0][2]:
			var has = true
			for degree in GameManager.avalmed[0][3]:
				if !GameManager.degrees.has(degree):
					has = false
			if has:
				title.text = "Success! You were hired!"
				GameManager.job[0] = GameManager.avalmed[0][0]
				GameManager.job[1] = GameManager.avalmed[0][1]
			else:
				title.text = "Don't have the degrees required."
		else:
			title.text = "Not enough experience."
	else:
		title.text = "You already have a job."

func _on_job2_pressed() -> void:
	if GameManager.job[0] == "":
		if GameManager.experience >= GameManager.avalmed[1][2]:
			var has = true
			for degree in GameManager.avalmed[1][3]:
				if !GameManager.degrees.has(degree):
					has = false
			if has:
				title.text = "Success! You were hired!"
				GameManager.job[0] = GameManager.avalmed[1][0]
				GameManager.job[1] = GameManager.avalmed[1][1]
			else:
				title.text = "Don't have the degrees required."
		else:
			title.text = "Not enough experience."
	else:
		title.text = "You already have a job."


func _on_job3_pressed() -> void:
	if GameManager.job[0] == "":
		if GameManager.experience >= GameManager.avalmed[2][2]:
			var has = true
			for degree in GameManager.avalmed[2][3]:
				if !GameManager.degrees.has(degree):
					has = false
			if has:
				title.text = "Success! You were hired!"
				GameManager.job[0] = GameManager.avalmed[2][0]
				GameManager.job[1] = GameManager.avalmed[2][1]
			else:
				title.text = "Don't have the degrees required."
		else:
			title.text = "Not enough experience."
	else:
		title.text = "You already have a job."


func _on_job4_pressed() -> void:
	if GameManager.job[0] == "":
		if GameManager.experience >= GameManager.avalmed[3][2]:
			var has = true
			for degree in GameManager.avalmed[3][3]:
				if !GameManager.degrees.has(degree):
					has = false
			if has:
				title.text = "Success! You were hired!"
				GameManager.job[0] = GameManager.avalmed[3][0]
				GameManager.job[1] = GameManager.avalmed[3][1]
			else:
				title.text = "Don't have the degrees required."
		else:
			title.text = "Not enough experience."
	else:
		title.text = "You already have a job."



func _on_Quit_pressed() -> void:
	GameManager.job[0] = ""
	GameManager.job[1] = 0
	



