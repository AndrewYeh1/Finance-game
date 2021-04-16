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
	if GameManager.smallHouse == false:
		item = "Small House"
		price = 150000
		_purchase()


func _on_largeHouseBut_pressed():
	if GameManager.largeHouse == false:
		item = "Large House"
		price = 800000
		_purchase()


func _purchase():
	if item == "Blue Shirt" or item == "Rainbow Shirt" or item == "Sunglasses" or item == "Black Pants" or item == "Rainbow Shirt" or item == "Dog":
		$notif.visible = true
		if GameManager.money >= price:
			$notif/confirmation.visible = true
			$notif/confirmation/confirmationMsg.text = "Buy " + item + " for $" + str(price) + "?"
		else:
			$notif/money.visible = true
	else:
		if GameManager.money >= price:
			$notif.visible = true
			$notif/confirmation.visible = true
			$notif/confirmation/confirmationMsg.text = "Buy " + item + " for $" + str(price) + "?"
		else:
			$TabContainer/Houses/mortgage.visible = true
			if item == "Small House":
				print("HI")
				if GameManager.money >= 25000 and GameManager.creditScore >= 200:
					$TabContainer/Houses/mortgage/mortgagePanel/title.text = "MORTGAGE (ACCEPTED)"
					$TabContainer/Houses/mortgage/mortgagePanel/confirm.disabled = false
					$TabContainer/Houses/mortgage/mortgagePanel/percentSpinBox.editable = true
					$TabContainer/Houses/mortgage/mortgagePanel/moneyLabel.text = "Credit score and/or money too low to apply for mortgage."
					$TabContainer/Houses/mortgage/mortgagePanel/percentSpinBox.min_value = 100 - stepify(float(GameManager.money) / price * 100, 1)
				else:
					$TabContainer/Houses/mortgage/mortgagePanel/title.text = "MORTGAGE (DENIED)"
					$TabContainer/Houses/mortgage/mortgagePanel/confirm.disabled = true
					$TabContainer/Houses/mortgage/mortgagePanel/percentSpinBox.editable = false
					$TabContainer/Houses/mortgage/mortgagePanel/moneyLabel.text = "You do not have enough money, please apply for mortgage."
			if item == "Large House":
				print("HI")
				if GameManager.money >= 100000 and GameManager.creditScore >= 400:
					$TabContainer/Houses/mortgage/mortgagePanel/title.text = "MORTGAGE (ACCEPTED)"
					$TabContainer/Houses/mortgage/mortgagePanel/confirm.disabled = false
					$TabContainer/Houses/mortgage/mortgagePanel/percentSpinBox.editable = true
					$TabContainer/Houses/mortgage/mortgagePanel/moneyLabel.text = "Credit score and/or money too low to apply for mortgage."
					$TabContainer/Houses/mortgage/mortgagePanel/percentSpinBox.min_value = 100 - stepify(float(GameManager.money) / price * 100, 1)
				else:
					$TabContainer/Houses/mortgage/mortgagePanel/title.text = "MORTGAGE (DENIED)"
					$TabContainer/Houses/mortgage/mortgagePanel/confirm.disabled = true
					$TabContainer/Houses/mortgage/mortgagePanel/percentSpinBox.editable = false
					$TabContainer/Houses/mortgage/mortgagePanel/moneyLabel.text = "You do not have enough money, please apply for mortgage."
	


func _on_confirmBut_pressed():
	GameManager.money -= price
	if item == "Blue Shirt":
		GameManager.happiness += 1
		GameManager.blueShirt = true
		get_parent().get_parent().get_node("player").blue()
	elif item == "Heart Shirt":
		GameManager.happiness += 1
		GameManager.heartShirt = true
		get_parent().get_parent().get_node("player").pink()
	elif item == "Sunglasses":
		GameManager.happiness += 1
		GameManager.sunglasses = true
		get_parent().get_parent().get_node("player").glasses()
	elif item == "Black Pants":
		GameManager.happiness += 1
		GameManager.blackPants = true
		get_parent().get_parent().get_node("player").pants()
	elif item == "Rainbow Shirt":
		GameManager.happiness += 2
		GameManager.rainbowShirt = true
		get_parent().get_parent().get_node("player").rainbow()
	elif item == "Dog":
		GameManager.happiness += 5
		GameManager.dog = true
		get_parent().get_parent().get_node("player").dog()
	elif item == "Small House":
		GameManager.smallHouse = true
		GameManager.houseMainCost = 2500
	elif item == "Large House":
		GameManager.largeHouse = true
		GameManager.houseMainCost = 3000
	$notif/confirmation.hide()
	$notif.hide()


func _on_okBut_pressed():
	$notif/confirmation.hide()
	$notif.hide()


func _on_cancelBut_pressed():
	$notif/money.hide()
	$notif.hide()


func _input(ev):
	if Input.is_key_pressed(KEY_SPACE):
		$TabContainer.show()


func _on_cancel_pressed():
	$TabContainer/Houses/mortgage.hide()


func _on_confirm_pressed():
	$TabContainer/Houses/mortgage.hide()
	GameManager.loanMortgage += ($TabContainer/Houses/mortgage/mortgagePanel/percentSpinBox.value / 100) * price
	GameManager.money -= ((100 - $TabContainer/Houses/mortgage/mortgagePanel/percentSpinBox.value) / 100) * price
	GameManager.mortgageLoanPayback = stepify(GameManager.loanMortgage / 20, 1)
	if price == 150000:
		GameManager.houseMainCost = 2500
		GameManager.smallHouse = true
	if price == 800000:
		GameManager.houseMainCost = 3000
		GameManager.largeHouse = true


func _on_smallApartmentBut_pressed():
	$TabContainer/Houses/rent.show()
	$TabContainer/Houses/rent/rentPanel/msg.text = "The rent will be $430/month, bills will be paid yearly."


func _on_largeApartmentBut_pressed():
	$TabContainer/Houses/rent.show()
	$TabContainer/Houses/rent/rentPanel/msg.text = "The rent will be $1200/month, bills will be paid yearly."


func _on_CONFIRM_pressed():
	if $TabContainer/Houses/rent/rentPanel/msg.text == "The rent will be $430/month, bills will be paid yearly.":
		GameManager.houseRentCost = 5160
		GameManager.houseMainCost = 1500
		GameManager.smallApartment = true
	else:
		GameManager.houseRentCost = 14400
		GameManager.houseMainCost = 2000
		GameManager.largeApartment = true
	$TabContainer/Houses/rent.hide()


func _on_CANCEL_pressed():
	$TabContainer/Houses/rent.hide()
