extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$payApplyBut.add_item("APPLY", 0)
	$payApplyBut.add_item("PAY", 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_applyBut_pressed():
	if $applyBut.text == "APPLY":
		GameManager.money += $applySpinBox.value
		GameManager.loanPersonal += $applySpinBox.value
		$messageLabel.text = "Succesfully applied for $" + str($applySpinBox.value) + " in loans."
		GameManager.personalLoanPayback += $applySpinBox.value * 0.1
	else:
		if GameManager.money >= $applySpinBox.value:
			$messageLabel.text = "Succesfully paid for $" + str($applySpinBox.value) + " from loans."
			GameManager.money -= $applySpinBox.value
			GameManager.loanPersonal -= $applySpinBox.value
	_update_loan_label()


func _on_personalLoan_pressed():
	# resets the screen
	$messageLabel.text = ""
	$applySpinBox.value = 0
	_update_loan_label()
	
func _update_loan_label():
	$currentLoanLable.text = "You currently have $" + str(GameManager.loanPersonal) + " in unpaid loans."
	$applySpinBox.value = 0
	if $applyBut.text == "PAY":
		$applySpinBox.max_value = GameManager.loanStudent


func _on_payApplyBut_item_selected(index):
	if index == 1:
		$applyBut.text = "PAY"
		$applySpinBox.max_value = GameManager.loanStudent
	else:
		$applyBut.text = "APPLY"
