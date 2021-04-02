extends MarginContainer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

func _process(delta: float) -> void:
	$PanelContainer/VBoxContainer/Money.text = "Money: $" + str(GameManager.money)
