extends Tabs


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_View_Bills_pressed():
	$"View Bills".visible = false
	$details.visible = false
	$viewBillsScreen.visible = true


func _on_back_pressed():
	$"View Bills".visible = true
	$viewBillsScreen.visible = false
	$details.visible = true