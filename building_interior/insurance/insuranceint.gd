extends Node2D


var menuOpen = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$player/Camera2D.limit_left = 5
	$player/Camera2D.limit_right = 1425
	$player/Camera2D.limit_top = 0
	$player/Camera2D.limit_bottom = 0
	if GameManager.year == 1:
		$CanvasLayer/Node2D.show()

func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE) and menuOpen == false:
		get_tree().change_scene("res://Play/Play.tscn")
	if Input.is_key_pressed(KEY_ESCAPE) and menuOpen == true:
		$"CanvasLayer/insurancemenu".visible = false
		menuOpen = not menuOpen
	if Input.is_key_pressed(KEY_SPACE):
		if menuOpen == false:
			if $player.location == "BankTeller":
				$"CanvasLayer/insurancemenu".visible = true
				menuOpen = not menuOpen
