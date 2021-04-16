extends Node2D

var music = load("res://data/music.wav")

####
func _ready():
	pass

func play_music():
	
	$Music.stream = music
	$Music.play()


func _on_Music_finished() -> void:
	play_music()
