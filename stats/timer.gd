extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

signal timeout

onready var timer = get_node("Timer")
onready var box = get_node("PanelContainer/VBoxContainer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("asdasdad")
	box.get_node("Year").text = "Year " + str(GameManager.year)
	box.get_node("Time").text = str(GameManager.second) + " seconds"
	box.get_node("Age").text = str(GameManager.year + 18) + " years old"
	timer.set_wait_time(1)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	box.get_node("Year").text = "Year " + str(GameManager.year)
	box.get_node("Age").text = str(GameManager.year + 18) + " years old"
	

func _on_Timer_timeout() -> void:
	if GameManager.second > 0:
		GameManager.second -= 1
		print(GameManager.second)
	
	box.get_node("Time").text = str(GameManager.second) + " seconds"
	
	if GameManager.second <= 0:
		emit_signal("timeout")

# NEW YEAR
func _on_newyeartransition_transitioned() -> void:
	GameManager.second = 10
	GameManager.year += 1
	
	var degrees = {"Associate's": 0, "Bachelor's": 1, "Master's": 2, "phD": 3}
	if GameManager.education != "":
		print("asdads")
		print(GameManager.marks[degrees[GameManager.education]][GameManager.edyear-1])
		if GameManager.marks[degrees[GameManager.education]][GameManager.edyear-1] >= 50:
			print("worked")
			if (GameManager.edyear == 2 and ["Associate's", "Master's"].has(GameManager.education)) or (GameManager.edyear == 4 and ["Bachelor's", "phD"].has(GameManager.education)):
				if !GameManager.degrees.has(GameManager.education):
					print("yes")
					GameManager.degrees.append(GameManager.education)
					GameManager.edyear = 0
					GameManager.education = ""
					print(GameManager.degrees)
			else:
				GameManager.edyear += 1
				GameManager.marks[degrees[GameManager.education]].append(0)
