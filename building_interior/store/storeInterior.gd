extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var menuOpen = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$player/Camera2D.limit_right = 1520
	if GameManager.year == 1:
		$CanvasLayer/Node2D.show()


func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE) and menuOpen == false:
		get_tree().change_scene("res://Play/Play.tscn")
	elif Input.is_key_pressed(KEY_ESCAPE) and menuOpen == true:
		$CanvasLayer/menu.hide()
		menuOpen = false
	if Input.is_key_pressed(KEY_SPACE) and $player.location == "StoreInt":
		$CanvasLayer/menu.visible = not $CanvasLayer/menu.visible
		menuOpen = true
