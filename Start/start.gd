extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var page = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	_on_next_pressed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_next_pressed():
	if page == 1:
		$backstory1.show()
	if page == 2:
		$backstory2.show()
	if page == 3:
		$backstory3.show()
	if page == 4:
		$backstory4.show()
		$next.text = "PLAY"
	if page == 5:
		get_tree().change_scene("res://Home/Home.tscn")
	page += 1
