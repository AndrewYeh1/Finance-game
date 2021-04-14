extends Control


var item = ""
var price


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_blueShirtBut_pressed():
	print("HI")
	item = "Blue Shirt"
	price = 30
	_purchase()


func _on_heartShirtBut_pressed():
	item = "Heart Shirt"
	price = 30
	_purchase()


func _on_rainbowShirtBut_pressed():
	item = "Rainbow Shirt"
	price = 50
	_purchase()


func _on_blackPantsBut_pressed():
	item = "Black Pants"
	price = 35
	_purchase()


func _on_sunglassesBut_pressed():
	item = "Sunglasses"
	price = 25
	_purchase()


func _on_dogBut_pressed():
	item = "Dog"
	price = 200
	_purchase()


func _on_smallHouseBut_pressed():
	item = "Small House"
	price = 150000
	_purchase()


func _on_largeHouseBut_pressed():
	item = "Large House"
	price = 800000
	_purchase()


func _purchase():
	$notif.visible = true
	if GameManager.money >= price:
		$notif/confirmation.visible = true
		$notif/confirmation/confirmationMsg.text = "Buy " + item + " for $" + str(price) + "?"
	else:
		$notif/money.visible = true
	


func _on_confirmBut_pressed():
	GameManager.money -= price
	if item == "Blue Shirt" or item == "Rainbow Shirt" or item == "Sunglasses" or item == "Black Pants":
		GameManager.happiness += 1
	elif item == "Rainbow Shirt":
		GameManager.happiness += 2
	elif item == "Dog":
		GameManager.happiness += 5
	$notif/confirmation.hide()
	$notif.hide()


func _on_okBut_pressed():
	$notif/confirmation.hide()
	$notif.hide()


func _on_cancelBut_pressed():
	$notif/money.hide()
	$notif.hide()


func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://Play/Play.tscn")
