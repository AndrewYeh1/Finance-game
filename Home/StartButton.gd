extends Button

func _ready():
	$startButtonLight.visible = false
	$startButtonLightSmall.visible = false


func _on_StartButton_mouse_entered():
	$startButtonSprite.visible = false
	$startButtonLight.visible = true


func _on_StartButton_mouse_exited():
	$startButtonSprite.visible = true
	$startButtonLight.visible = false
	$startButtonLightSmall.visible = false


func _on_StartButton_button_down():
	$startButtonLightSmall.visible = true
	$startButtonLight.visible = false
