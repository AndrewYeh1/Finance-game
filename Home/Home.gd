extends Node2D


func _ready():
	MusicController.play_music()
	if GameManager.first == true:
		GameManager.first = false
		get_tree().change_scene("res://Start/start.tscn")
		


func _on_StartButton_pressed():
	GameManager.netWorth = GameManager.money + GameManager.bankMoney
	if GameManager.largeHouse:
		GameManager.netWorth += GameManager.largeHouseValue
	if GameManager.smallHouse:
		GameManager.netWorth += GameManager.smallHouseValue
	$TransitionScene.show()
	$TransitionScene._transition()
	


func _on_InstructionButton_pressed():
	get_tree().change_scene("res://Instructions/Instructions.tscn")
	

func _on_TransitionScene_transitioned() -> void:
	get_tree().change_scene("res://Play/Play.tscn")
