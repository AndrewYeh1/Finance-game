extends MarginContainer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

func _process(delta: float) -> void:
	$PanelContainer/VBoxContainer/Money.text = "Money: $" + str(GameManager.money)
	$PanelContainer/VBoxContainer/BankMoney.text = "Bank Money: $" + str(GameManager.bankMoney)
	
	$PanelContainer/VBoxContainer/HealthBar.value = GameManager.health
	$PanelContainer/VBoxContainer/HappinessBar.value = GameManager.happiness
	$PanelContainer/VBoxContainer/ExperienceBar.value = GameManager.experience
	$PanelContainer/VBoxContainer/CreditBar.value = GameManager.credit
	
