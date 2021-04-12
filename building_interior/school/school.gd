extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var menuOpen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$player/Camera2D.limit_left = 0
	$player/Camera2D.limit_right = 1336
	$player/Camera2D.limit_top = -5
	$player/Camera2D.limit_bottom = -5


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE) and menuOpen == false:
		get_tree().change_scene("res://Play/Play.tscn")
	if Input.is_key_pressed(KEY_SPACE):
		if menuOpen == false:
			if $player.location == "LeftDoor":
				$"CanvasLayer/schoolMenu".visible = true
				menuOpen = not menuOpen
		else:
			$"CanvasLayer/schoolMenu".visible = false
			menuOpen = not menuOpen
