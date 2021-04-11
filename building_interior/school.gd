extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$player/Camera2D.limit_left = 0
	$player/Camera2D.limit_right = 1336
	$player/Camera2D.limit_top = -5
	$player/Camera2D.limit_bottom = -5


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
