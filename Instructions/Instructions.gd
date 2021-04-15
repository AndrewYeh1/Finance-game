extends Node2D

var page = 1

func _ready():
	_edit_but()
	

func _on_back_pressed():
	page -= 1
	_edit_but()


func _on_next_pressed():
	if page <= 3:
		page += 1
	else:
		get_tree().change_scene("res://Home/Home.tscn")
	_edit_but()
	
	

func _edit_but():
	if page == 1:
		$back.disabled = true
		$i1.show()
		$i2.hide()
		$i3.hide()
		$i4.hide()
	if page == 2:
		$back.disabled = false
		$i1.hide()
		$i2.show()
		$i3.hide()
		$i4.hide()
	if page == 3:
		$i1.hide()
		$i2.hide()
		$i3.show()
		$i4.hide()
	if page == 4:
		$i1.hide()
		$i2.hide()
		$i3.hide()
		$i4.show()
		$next.text = "DONE"
