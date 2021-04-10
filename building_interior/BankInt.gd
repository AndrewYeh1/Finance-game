extends Node2D


var menuOpen = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE) and menuOpen == false:
		get_tree().change_scene("res://Play/Play.tscn")
	if Input.is_key_pressed(KEY_SPACE):
		if menuOpen == false:
			if $player.location == "BankTeller":
				$"CanvasLayer/bankMenu".visible = true
				menuOpen = not menuOpen
		else:
			$"CanvasLayer/bankMenu".visible = false
			menuOpen = not menuOpen
