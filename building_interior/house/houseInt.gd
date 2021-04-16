extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$SApartment.hide()
	$LApartment.hide()
	$SHouse.hide()
	$LHouse.hide()
	$homeless.hide()
	if GameManager.smallApartment:
		$SApartment.show()
		$SApartment/off.show()
	if GameManager.largeApartment:
		$LApartment.show()
		$LApartment/normal.show()
		$LApartment/off.show()
	if GameManager.smallHouse:
		$SHouse.show()
		$SHouse/off.show()
	if GameManager.largeHouse:
		$LHouse.show()
		$LHouse/off.show()
	if !GameManager.smallApartment and !GameManager.largeApartment and !GameManager.smallHouse and !GameManager.largeHouse:
		$homeless.show()


func _input(event):
	if Input.is_key_pressed(KEY_SPACE):
		if $SApartment.visible:
			$SApartment/off.visible = not $SApartment/off.visible
			$SApartment/on.visible = not $SApartment/on.visible
		if $LApartment.visible:
			$LApartment/off.visible = not $LApartment/off.visible
			$LApartment/on.visible = not $LApartment/on.visible
		if $SHouse.visible:
			$SHouse/off.visible = not $SHouse/off.visible
			$SHouse/on.visible = not $SHouse/on.visible
		if $LHouse.visible:
			$LHouse/off.visible = not $LHouse/off.visible
			$LHouse/on.visible = not $LHouse/on.visible
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://Play/Play.tscn")

