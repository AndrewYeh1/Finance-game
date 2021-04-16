extends Control


onready var main = get_parent().get_node("main")
onready var work = get_parent().get_parent()

onready var question = get_node("question")
onready var answer = get_node("answer")
onready var score = get_node("score")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var ans = ""

func start():
	print("WHAT")
	ans = ""
	
	rng.randomize()
	answer.hide()
	
	for i in range(4):
		ans += str(rng.randi_range(0,9))
	
	print(ans)
	
	for i in ans:
		question.text = str(i)
		var t = Timer.new()
		t.set_wait_time(0.6)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		t.queue_free()
	
	question.text = ""
	answer.show()
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_answer_text_entered(new_text: String) -> void:
	answer.text = ""
	var new = int(score.text.split("/")[0])+1
	if new_text == ans:
		score.text = str(new) + "/3"
	if new >= 3:
		hide()
		main.show()
		work.add_hours()
		question.text = ""
		ans = ""
		score.text = "0/3"
	else:
		start()
	
