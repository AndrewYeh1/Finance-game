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

func _on_newyeartransition_transitioned() -> void:
	GameManager.second = 60
	GameManager.year += 1
