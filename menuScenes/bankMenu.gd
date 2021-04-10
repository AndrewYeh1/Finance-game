extends Node2D


var deposit = 0
var withdraw = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_depWithBut_pressed():
	get_node("depWithMenu").show()
	get_node("loanMenu").hide()
	get_node("payMenu").hide()


func _on_loanBut_pressed():
	get_node("depWithMenu").hide()
	get_node("loanMenu").show()
	get_node("payMenu").hide()


func _on_payBut_pressed():
	get_node("depWithMenu").hide()
	get_node("loanMenu").hide()
	get_node("payMenu").show()

func _on_depBut_pressed():
	$"depWithMenu".hide()
	$"deposit".show()
	
func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		if $"deposit".visible:
			$"deposit".hide()
			$"depWithMenu".show()

func _on_depositButton_pressed():
	if GameManager.money >= deposit:
		GameManager.money -= deposit
		GameManager.bankMoney += deposit
		deposit = 0

func _on_depositSpinBox_value_changed(value):
	deposit = value

func _on_withBut_pressed():
	$"depWithMenu".hide()
	$"withdraw".show()

func _on_withdrawSpinBox_value_changed(value):
	withdraw = value

func _on_withdrawButton_pressed():
	if GameManager.money >= withdraw:
		GameManager.money += withdraw
		GameManager.bankMoney -= withdraw
		withdraw = 0
