extends Node2D


func _ready():
	pass


func _on_StartButton_pressed():
	$TransitionScene.show()
	$TransitionScene._transition()
	


func _on_InstructionButton_pressed():
	get_tree().change_scene("res://Instructions/Instructions.tscn")
	

func _on_TransitionScene_transitioned() -> void:
	get_tree().change_scene("res://Play/Play.tscn")
