extends Control

signal transitioned


func _transition():
	$ColorRect/Label.text = "YEAR\n" + str(GameManager.year + 1)
	$AnimationPlayer.play("newyeartransitionfadein")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "newyeartransitionfadein":
		emit_signal("transitioned")
		$AnimationPlayer.play("newyeartransitionfadeout")
	if anim_name == "newyeartransitionfadeout":
		hide()


func _on_time_timeout() -> void:
	show()
	_transition()
