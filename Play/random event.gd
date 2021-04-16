extends Control


var event = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	event = GameManager.event
	if event == 1:
		$ok.show()
		if GameManager.insurance["Home"] >= 1:
			$event1I.show()
		else:
			$event1.show()
	if event == 2:
		$ok.show()
		if GameManager.insurance["Health"] >= 1:
			$event2I.show()
		else:
			$event2.show()
	if event == 3:
		$ok.show()
		if GameManager.insurance["Health"] >= 1:
			$event3I.show()
		else:
			$event3.show()
	if event == 4:
		$ok.show()
		if GameManager.insurance["Employment"] >= 1:
			$event4I.show()
		else:
			$event4.show()




func _on_ok_pressed():
	if $event1.visible:
		GameManager.money -= 3500
	if $event1I.visible:
		GameManager.money -= 1000
	if $event2.visible:
		GameManager.money -= 1500
	if $event2I.visible:
		GameManager.money -= 250
	if $event3.visible:
		GameManager.money -= 1500
	if $event3I.visible:
		GameManager.money -= 200
	if $event4.visible:
		GameManager.job = ""
	if $event4I.visible:
		GameManager.job = ""
		GameManager.money += 10000
	$event1.hide()
	$event1I.hide()
	$event2.hide()
	$event2I.hide()
	$event3.hide()
	$event3I.hide()
	$event4.hide()
	$event4I.hide()
	$ok.hide()
	GameManager.event = 0
