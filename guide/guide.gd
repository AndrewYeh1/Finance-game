extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var page = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	_flip_page()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_back_pressed():
	page -= 1
	_flip_page()


func _on_home_pressed():
	page = 1
	_flip_page()


func _on_studentAid_pressed():
	page = 2
	_flip_page()


func _on_loanPay_pressed():
	page = 2
	_flip_page()


func _on_credit_pressed():
	page = 3
	_flip_page()


func _on_budgeting_pressed():
	page = 4
	_flip_page()


func _on_insurance_pressed():
	page = 5
	_flip_page()


func _on_uni_pressed():
	page = 6
	_flip_page()


func _on_bankAcc_pressed():
	page = 7
	_flip_page()


func _on_glossary_pressed():
	page = 8
	_flip_page()
	

func _flip_page():
	$buttons.hide()
	$back.disabled = false
	$g1.hide()
	$g2.hide()
	$g3.hide()
	$g4.hide()
	$g5.hide()
	$g6.hide()
	$g7.hide()
	$g8.hide()
	$g9.hide()
	$g10.hide()
	$g11.hide()
	if page == 1:
		$back.disabled = true
		$buttons.show()
		$g1.show()
	if page == 2:
		$g2.show()
	if page == 3:
		$g3.show()
	if page == 4:
		$g4.show()
	if page == 5:
		$g5.show()
	if page == 6:
		$g6.show()
	if page == 7:
		$g7.show()
	if page == 8:
		$g8.show()
	if page == 9:
		$g9.show()
	if page == 10:
		$g10.show()
	if page == 11:
		$g11.show()


func _on_next_pressed():
	if page < 11:
		page += 1
	else:
		get_tree().change_scene("res://Play/Play.tscn")
	_flip_page()


func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://Play/Play.tscn")
