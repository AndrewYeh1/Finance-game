extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$player/Camera2D.limit_right = 1520


func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://Play/Play.tscn")
	if Input.is_key_pressed(KEY_SPACE) and $player.location == "StoreInt":
		$CanvasLayer/menu.visible = not $CanvasLayer/menu.visible
	elif Input.is_key_pressed(KEY_SPACE):
		$CanvasLayer/menu.hide()
