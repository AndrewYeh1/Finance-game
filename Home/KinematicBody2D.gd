extends KinematicBody2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	var velocity = Vector2(1, 0)
	position += velocity
	if position.x >= get_viewport_rect().size.x*2 or position.x <= 0:
		position.x = 0
	print(get_node("backgroundwnotext").position.x)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
