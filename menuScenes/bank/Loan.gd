extends Tabs


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_studentAid_pressed():
	$studentAid.visible = false
	$personalLoan.visible = false
	$studentAidScreen.visible = true


func _on_personalLoan_pressed():
	$studentAid.visible = false
	$personalLoan.visible = false
	$personalLoanScreen.visible = true


func _on_doneBut_pressed():
	$studentAid.visible = true
	$personalLoan.visible = true
	$studentAidScreen.visible = false
	$personalLoanScreen.visible = false
