extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var work = get_node("Work")
onready var nojob = get_node("nojob")

onready var main = get_node("Work/main")
onready var job = get_node("Work/main/job")
onready var hours = get_node("Work/main/hours")

onready var memory = get_node("Work/memory")
onready var whack = get_node("Work/whack")

onready var button = get_node("Work/main/Button")
onready var fullyear = get_node("Work/main/fullyear")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func update_job():
	if GameManager.job[0] != "":
		nojob.hide()
		work.show()
		job.text = GameManager.job[0] + " $" + str(GameManager.job[1])
	else:
		nojob.show()
		work.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var hour = int(hours.text.split("/")[0])
	if hour >= 1680:
		button.hide()
		fullyear.show()
	else:
		fullyear.hide()
		

func add_hours():
	GameManager.experience += 2
	var hour = int(hours.text.split("/")[0]) + 140
	hours.text = str(hour) + "/1680 hours worked"
	GameManager.hours = hour
	GameManager.money += GameManager.job[1]/12
	GameManager.taxes += stepify((GameManager.job[1]/12)*0.2,1)

func _on_Button_pressed() -> void:
	main.hide()
	
	var percent = randf()
	if (percent > 0.5):
		memory.show()
		memory.start()
	else:
		whack.start()
		whack.show()
