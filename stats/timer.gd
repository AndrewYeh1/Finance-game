extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var timer = get_node("Timer")
onready var box = get_node("PanelContainer/VBoxContainer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.set_wait_time(1)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	box.get_node("Year").text = "Year " + str(GameManager.year)
	box.get_node("Age").text = str(GameManager.year + 18) + " years old"
	

func _on_Timer_timeout() -> void:
	GameManager.second -= 1
	print(GameManager.second)
	box.get_node("Time").text = str(GameManager.second) + " seconds"
