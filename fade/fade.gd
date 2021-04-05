extends Control

signal transitioned

func _transition():
	$AnimationPlayer.play("fadein")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "fadein":
		emit_signal("transitioned")
		$AnimationPlayer.play("fadeout")
