extends Control


var total


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _reset_bills() -> void:
	$bills/all.disabled = false
	$bills/rent.disabled = false
	$bills/houseFees.disabled = false
	$bills/loans.disabled = false
	$bills/taxes.disabled = false
	if GameManager.houseRent == 0:
		$bills/rent.disabled = true
	$bills/rentLabel.text = "$" + str(GameManager.houseRent) 
	if GameManager.houseMain == 0:
		$bills/houseFees.disabled = true
	$bills/houseFeesLabel.text = "$" + str(GameManager.houseMain) 
	if GameManager.loans == 0:
		$bills/loans.disabled = true
	$bills/loansLabel.text = "$" + str(GameManager.loans) 
	if GameManager.taxes == 0:
		$bills/taxes.disabled = true
	$bills/taxesLabel.text = "$" + str(GameManager.taxes)
	if $bills/rent.disabled == true and $bills/houseFees.disabled == true and $bills/loans.disabled == true and $bills/taxes.disabled == true:
		$bills/all.disabled = true



func _on_all_toggled(button_pressed):
	if $bills/all.has_focus() == true:
		$bills/rent.pressed = button_pressed
		$bills/houseFees.pressed = button_pressed
		$bills/loans.pressed = button_pressed
		$bills/taxes.pressed = button_pressed


func _on_rent_toggled(button_pressed):
	if button_pressed == false:
		$bills/all.pressed = false


func _on_houseFees_toggled(button_pressed):
	if button_pressed == false:
		$bills/all.pressed = false


func _on_loans_toggled(button_pressed):
	if button_pressed == false:
		$bills/all.pressed = false


func _on_taxes_toggled(button_pressed):
	if button_pressed == false:
		$bills/all.pressed = false


func _on_rentInfo_pressed():
	if GameManager.houseRent == 0:
		$infoLabel.text = "Your currently do not have to pay rent."
	else:
		$infoLabel.text = ("Rent: Your house costs $" + str(GameManager.houseRent) + " to rent this year.")


func _on_loansInfo_pressed():
	if GameManager.loans == 0:
		$infoLabel.text = "Your currently do not have to repay any loans."
	else:
		$infoLabel.text = ("Loans: You have to repay $" + str(GameManager.loans) + " this year for loans.")


func _on_taxesInfo_pressed():
	if GameManager.taxes == 0:
		$infoLabel.text = "Your currently do not have to pay any taxes."
	else:
		$infoLabel.text = ("Taxes: You have to pay $" + str(GameManager.taxes) + " in taxes this year.")


func _on_houseFeesInfo_pressed():
	if GameManager.houseMain == 0:
		$infoLabel.text = "Your currently do not have to pay anything for house fees."
	else:
		$infoLabel.text = ("House fees: Your house costs $" + str(GameManager.houseMain) + " to maintain this year.")


func _on_pay_pressed():
	total = 0
	if $bills/rent.pressed == true:
		total += GameManager.houseRent
	if $bills/houseFees.pressed == true:
		total += GameManager.houseMain
	if $bills/loans.pressed == true:
		total += GameManager.loans
	if $bills/taxes.pressed == true:
		total += GameManager.taxes
	if GameManager.money >= total:
		GameManager.money -= total
		if $bills/rent.pressed == true:
			GameManager.houseRent = 0
		if $bills/houseFees.pressed == true:
			GameManager.houseMain = 0
		if $bills/loans.pressed == true:
			GameManager.loans = 0
		if $bills/taxes.pressed == true:
			GameManager.taxes = 0
		$infoLabel.text = "You paid $" + str(total) + " in fees."
	else:
		$infoLabel.text = "Not enough money! TIP: Withdraw money from bank"
	_reset_bills()
	

func _on_View_Bills_pressed():
	_reset_bills()
	$infoLabel.text = ""
	
