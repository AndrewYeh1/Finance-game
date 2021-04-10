extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_camera_limits()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_time_timeout() -> void:
	$CanvasLayer/newyeartransition.show()
	$CanvasLayer/newyeartransition._transition()
	
func set_camera_limits():
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$player/Camera2D.limit_left = map_limits.position.x+0.1 * map_cellsize.x
	$player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
