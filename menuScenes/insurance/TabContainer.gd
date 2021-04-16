extends TabContainer

onready var insurance = get_node("Insurance/Control/insurance")
onready var total = get_node("Insurance/Control/total")
onready var pay = get_node("Insurance/Control/pay")

onready var error = get_node("Insurance/Control/error")

onready var home = get_node("Insurance/VBoxContainer/Home")
onready var health = get_node("Insurance/VBoxContainer/Health")
onready var employment = get_node("Insurance/VBoxContainer/Employment")
var cost = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	total.text = "$" + str(cost)


func _on_Home_mouse_entered() -> void:
	insurance.text = "Home insurance will cover the monetary value of the damages to your home."


func _on_Health_mouse_entered() -> void:
	insurance.text = "Health insurance can cover a large portion of your medical expenses for you."


func _on_Employment_mouse_entered() -> void:
	insurance.text = "Employment insurance can give you temporary income while you are out of a job."


func _on_Home_toggled(button_pressed: bool) -> void:
	
	if GameManager.insurance["Home"] == 2:
		error.text = "Already bought!"
		home.pressed = false
		return
	
	if button_pressed:
		cost += 800
	else:
		cost -= 800


func _on_Health_toggled(button_pressed: bool) -> void:
	if GameManager.insurance["Health"] == 2:
		error.text = "Already bought!"
		health.pressed = false
		return

	if button_pressed:
		cost += 1000
	else:
		cost -= 1000


func _on_Employment_toggled(button_pressed: bool) -> void:
	if GameManager.insurance["Employment"] == 2:
		error.text = "Already bought!"
		employment.pressed = false
		return
	
	if button_pressed:
		cost += 900
	else:
		cost -= 900


func _on_pay_pressed() -> void:
	if cost <= GameManager.money:
		GameManager.money -= cost
		
		if home.pressed:
			GameManager.insurance["Home"] = 2
			home.pressed = false
		if health.pressed:
			GameManager.insurance["Health"] = 2
			health.pressed = false
		if employment.pressed:
			GameManager.insurance["Employment"] = 2
			employment.pressed = false
		
		cost = 0
		
	else:
		error.text = "Not enough money!"
