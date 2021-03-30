extends Button

func _ready():
	$instructionButtonLight.visible = false
	$instructionButtonLightSmall.visible = false


func _on_InstructionButton_mouse_entered():
	$instructionButtonSprite.visible = false
	$instructionButtonLight.visible = true


func _on_InstructionButton_mouse_exited():
	$instructionButtonSprite.visible = true
	$instructionButtonLight.visible = false
	$instructionButtonLightSmall.visible = false


func _on_InstructionButton_button_down():
	$instructionButtonLightSmall.visible = true
	$instructionButtonLight.visible = false
