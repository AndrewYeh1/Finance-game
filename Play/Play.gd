extends Node2D


var menuOpen = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_camera_limits()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
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

func _on_time_timeout() -> void:
	$CanvasLayer/newyeartransition.show()
	$CanvasLayer/newyeartransition._transition()
	
func set_camera_limits():
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$player/Camera2D.limit_left = map_limits.position.x+0.1 * map_cellsize.x
	$player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x - 50
	$player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
