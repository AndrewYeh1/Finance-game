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
		GameManager.studentAid += $applySpinBox.value
		GameManager.loanStudent += $applySpinBox.value
		$messageLabel.text = "Succesfully applied for $" + str($applySpinBox.value) + " in student aid."
	else:
		if GameManager.money + GameManager.studentAid >= $applySpinBox.value:
			$messageLabel.text = "Succesfully paid for $" + str($applySpinBox.value) + " in student aid."
			if GameManager.studentAid >= $applySpinBox.value:
				GameManager.studentAid -= $applySpinBox.value
				GameManager.loanStudent -= $applySpinBox.value
				$applySpinBox.value = 0
			else:
				$applySpinBox.value -= GameManager.studentAid
				GameManager.loanStudent -= GameManager.studentAid
				GameManager.studentAid = 0
			GameManager.loanStudent -= $applySpinBox.value
			GameManager.money -= $applySpinBox.value
	_update_loan_label()


func _on_studentAid_pressed():
	# resets the screen
	$messageLabel.text = ""
	$applySpinBox.value = 0
	_update_loan_label()
	
func _update_loan_label():
	$currentLoanLable.text = "You currently have $" + str(GameManager.studentAid) + " in your student aid account and $" + str(GameManager.loanStudent) + " in unpaid student aid loans."
	$applySpinBox.value = 0
	if $applyBut.text == "PAY":
		$applySpinBox.max_value = GameManager.loanStudent


func _on_payApplyBut_item_selected(index):
	if index == 1:
		$applyBut.text = "PAY"
		$applySpinBox.max_value = GameManager.loanStudent
	else:
		$applyBut.text = "APPLY"
