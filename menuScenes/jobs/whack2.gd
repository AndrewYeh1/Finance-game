extends Control

onready var button1 = get_node("greenopen")
onready var button2 = get_node("greenopen2")
onready var button3 = get_node("greenopen3")
onready var button4 = get_node("greenopen4")
onready var button5 = get_node("greenopen5")
onready var button6 = get_node("greenopen6")

onready var main = get_parent().get_node("main")
onready var work = get_parent().get_parent()

var buttons = []

var greenopen = preload("res://data/buttons/greenopen.png")
var greenhover = preload("res://data/buttons/greenhower.png")
var greenpressed = preload("res://data/buttons/greenpressed.png")
var redopen = preload("res://data/buttons/redopen.png")
var redhover = preload("res://data/buttons/redhover.png")
var redpressed = preload("res://data/buttons/redpressed.png")

onready var score = get_node("score")

var rng = RandomNumberGenerator.new()

var r = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buttons = [button1, button2, button3, button4, button5, button6]
	pass # Replace with function body.

func start():
	var t = Timer.new()
	t.set_wait_time(rng.randf_range(0.5, 1))
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	
	r = rng.randi_range(0, 5)
	
	print(buttons)
	print(r)
	buttons[r].set_texture(redopen)
	
	t = Timer.new()
	t.set_wait_time(1.5)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	
	buttons[r].set_texture(greenopen)
	
	var new = int(score.text.split("/")[0])
	if new < 5:
		start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func pressed(button):
	print(button)
	if button == r:
		buttons[button].set_texture(redpressed)
		var new = int(score.text.split("/")[0])+1
		score.text = str(new) + "/5"
		if new >= 5:
			hide()
			main.show()
			work.add_hours()
			score.text = "0/5"
			for b in buttons:
				b.set_texture(greenopen)
	else:
		buttons[button].set_texture(greenpressed)
		var t = Timer.new()
		t.set_wait_time(rng.randf_range(0.5, 3))
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		t.queue_free()
		buttons[button].set_texture(greenopen)
	

func entered(button):
	print("ENTERED")
	print(button, r)

	
	if button == r:
		buttons[button].set_texture(redhover)
	else:
		buttons[button].set_texture(greenhover)

func _on_Button_mouse_entered() -> void:
	entered(0)

func _on_Button1_mouse_entered() -> void:
	entered(1)

func _on_Button2_mouse_entered() -> void:
	entered(2) # Replace with function body.


func _on_Button3_mouse_entered() -> void:
	entered(3) # Replace with function body.


func _on_Button4_mouse_entered() -> void:
	entered(4) # Replace with function body.


func _on_Button5_mouse_entered() -> void:
	entered(5) # Replace with function body.


func _on_Button_pressed() -> void:
	pressed(0)


func _on_Button1_pressed() -> void:
	pressed(1)


func _on_Button2_pressed() -> void:
	pressed(2)


func _on_Button3_pressed() -> void:
	pressed(3)


func _on_Button4_pressed() -> void:
	pressed(4)


func _on_Button5_pressed() -> void:
	pressed(5)


func wait(time):
	var t = Timer.new()
	t.set_wait_time(time)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()



