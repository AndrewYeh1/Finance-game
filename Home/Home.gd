extends Node2D


func _ready():
	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://Play/Play.tscn")


func _on_InstructionButton_pressed():
	get_tree().change_scene("res://Instructions/Instructions.tscn")
	
