extends TabContainer

onready var jobs = get_node("Apply/jobs")
onready var job1 = get_node("Apply/jobs/job1")
onready var job2 = get_node("Apply/jobs/job2")
onready var job3 = get_node("Apply/jobs/job3")
onready var job4 = get_node("Apply/jobs/job4")
onready var job5 = get_node("Apply/jobs/job5")

onready var title = get_node("Apply/job/Title")
onready var info = get_node("Apply/job/info")

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func show_jobs():
	job1.text = GameManager.avallow[0][0] + " $" + str(GameManager.avallow[0][1])
	job2.text = GameManager.avallow[1][0] + " $" + str(GameManager.avallow[1][1])
	job3.text = GameManager.avallow[2][0] + " $" + str(GameManager.avallow[2][1])
	job4.text = GameManager.avallow[3][0] + " $" + str(GameManager.avallow[3][1])
	job5.text = GameManager.avallow[4][0] + " $" + str(GameManager.avallow[4][1])
	
	
	#unpaid.set_name("job")
	#unpaid.text = str("$" + str(money) + ": " +  bill + " | " + consequence)
	#unpaid.autowrap = true
	#unpaid.set("custom_fonts/font", load("res://renner-small.tres"))
	#jobs.add_child(unpaid)


func _on_job1_mouse_entered() -> void:
	title.text = GameManager.avallow[0][0] + " $" + str(GameManager.avallow[0][1])
	info.text = "Exp: " + str(GameManager.avallow[0][2]) + "\nDegrees: " + str(GameManager.avallow[0][3])
	pass # Replace with function body.


func _on_job2_mouse_entered() -> void:
	title.text = GameManager.avallow[1][0] + " $" + str(GameManager.avallow[0][1])
	info.text = "Exp: " + str(GameManager.avallow[1][2]) + "\nDegrees: " + str(GameManager.avallow[1][3])
	pass # Replace with function body.


func _on_job3_mouse_entered() -> void:
	title.text = GameManager.avallow[2][0] + " $" + str(GameManager.avallow[1][1])
	info.text = "Exp: " + str(GameManager.avallow[2][2]) + "\nDegrees: " + str(GameManager.avallow[2][3])
	pass # Replace with function body.


func _on_job4_mouse_entered() -> void:
	title.text = GameManager.avallow[3][0] + " $" + str(GameManager.avallow[2][1])
	info.text = "Exp: " + str(GameManager.avallow[3][2]) + "\nDegrees: " + str(GameManager.avallow[3][3])
	pass # Replace with function body.


func _on_job5_mouse_entered() -> void:
	title.text = GameManager.avallow[4][0] + " $" + str(GameManager.avallow[3][1])
	info.text = "Exp: " + str(GameManager.avallow[4][2]) + "\nDegrees: " + str(GameManager.avallow[4][3])
	pass # Replace with function body.
