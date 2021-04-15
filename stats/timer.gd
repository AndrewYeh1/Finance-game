extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

signal timeout

onready var timer = get_node("Timer")
onready var box = get_node("PanelContainer/VBoxContainer")

onready var bills = get_node("bills")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	box.get_node("Year").text = "Year " + str(GameManager.year)
	box.get_node("Time").text = str(GameManager.second) + " seconds"
	box.get_node("Age").text = str(GameManager.year + 18) + " years old"
	timer.set_wait_time(1)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	box.get_node("Year").text = "Year " + str(GameManager.year)
	box.get_node("Age").text = str(GameManager.year + 18) + " years old"
	

func _on_Timer_timeout() -> void:
	if GameManager.second > 0:
		GameManager.second -= 1
		print(GameManager.second)
	
	box.get_node("Time").text = str(GameManager.second) + " seconds"
	
	if GameManager.second <= 0:
		emit_signal("timeout")

# NEW YEAR
func _on_newyeartransition_transitioned() -> void:
	GameManager.second = 10
	GameManager.year += 1
	
	
	# finance
	GameManager.houseMain = GameManager.houseMainCost
	GameManager.houseRent = GameManager.houseRentCost
	if GameManager.education == "":
		GameManager.loanStudent = GameManager.studentLoanPayback
		GameManager.loanStudent -= GameManager.studentLoanPayback
	GameManager.bankMoney = stepify(1.05 * GameManager.bankMoney, 0.01)
	GameManager.netWorth = GameManager.money + GameManager.bankMoney
	if GameManager.largeHouse:
		GameManager.netWorth += GameManager.largeHouseValue
	if GameManager.smallHouse:
		GameManager.netWorth += GameManager.smallHouseValue
  
	# education
	var degrees = {"Associate's": 0, "Bachelor's": 1, "Master's": 2, "phD": 3}
	if GameManager.education != "":
		print("asdads")
		print(GameManager.marks[degrees[GameManager.education]][GameManager.edyear-1])
		if GameManager.tuition <= 0:
			if GameManager.marks[degrees[GameManager.education]][GameManager.edyear-1] >= 50:
				print("worked")
				if (GameManager.edyear == 2 and ["Associate's", "Master's"].has(GameManager.education)) or (GameManager.edyear == 4 and ["Bachelor's", "phD"].has(GameManager.education)):
					if !GameManager.degrees.has(GameManager.education):
						print("yes")
						GameManager.degrees.append(GameManager.education)
						GameManager.edyear = 0
						GameManager.education = ""
						print(GameManager.degrees)
				else:
					GameManager.edyear += 1
					GameManager.marks[degrees[GameManager.education]].append(0)
		else:
			# didnt pay tuition
			GameManager.edyear = 0
			bills.create_unpaid_bill(GameManager.tuition, "School Tuition", " | You have been unenrolled from school.")
			GameManager.education = ""

