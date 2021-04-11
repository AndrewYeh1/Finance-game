extends Tabs



var deposit = 0
var withdraw = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Deposit_pressed():
	$Deposit.hide()
	$Withdraw.hide()
	$DepositPage.show()


func _on_Withdraw_pressed():
	$Deposit.hide()
	$Withdraw.hide()
	$WithdrawPage.show()


func _on_DepBut_pressed():
	deposit = $DepositPage/DepSpinBox.value
	if GameManager.money >= deposit:
		$DepositPage/SuccessLabel.text = ("Succesfully deposited " + str(deposit) + " dollars!")
		GameManager.money -= deposit
		GameManager.bankMoney += deposit
		deposit = 0
	else:
		$DepositPage/SuccessLabel.text = "Failed, not enough money. :("
	$DepositPage/DepSpinBox.value = 0


func _on_BackBut_pressed():
	$Deposit.show()
	$Withdraw.show()
	$DepositPage.hide()


func _on_WithBut_pressed():
	withdraw = $WithdrawPage/WithSpinBox.value
	if GameManager.bankMoney >= withdraw:
		$WithdrawPage/WithSuccessLabel.text = ("Succesfully withdrawn " + str(withdraw) + " dollars!")
		GameManager.money += withdraw
		GameManager.bankMoney -= withdraw
		deposit = 0
	else:
		$WithdrawPage/WithSuccessLabel.text = "Failed, not enough money. :("
	$WithdrawPage/WithSpinBox.value = 0


func _on_WithBackBut_pressed():
	$Deposit.show()
	$Withdraw.show()
	$WithdrawPage.hide()
