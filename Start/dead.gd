extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()

func update():
	get_node("age").text = "Age : " + str(GameManager.year + 17)
	get_node("networth").text = "Networth: \n$" + str(GameManager.netWorth)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Button_pressed() -> void:
	get_tree().change_scene("res://Home/Home.tscn")
	
	GameManager.firstplay = false
	
	GameManager.money = 3000
	GameManager.bankMoney = 0
	GameManager.happiness = 50
	GameManager.credit = 50
	GameManager.health = 50
	GameManager.netWorth = 0
	GameManager.experience = 10

	# TIME

	GameManager.year = 1
	GameManager.second = 90

	# SCHOOL STUFF

	GameManager.degrees = []
	GameManager.marks = [[], [], [], []]
	GameManager.education = ""
	GameManager.edyear = 0
	GameManager.studentAid = 0

	# BILLS
	GameManager.houseRent = 0
	GameManager.houseMain = 0
	GameManager.loans = 0
	GameManager.taxes = 0
	GameManager.tuition = 0

	# LOANS
	GameManager.loanStudent = 20
	GameManager.loanMortgage = 0
	GameManager.loanPersonal = 0
	GameManager.creditScore = 200
	GameManager.loanPersonalInterest = 0
	GameManager.loanMortgageInterest = 0
	GameManager.studentLoanPayback = 0
	GameManager.personalLoanPayback = 0
	GameManager.mortgageLoanPayback = 0

	# HOUSE COSTS
	GameManager.houseRentCost = 0
	GameManager.houseMainCost = 0

	# ITEMS OWNED
	GameManager.blueShirt = false
	GameManager.heartShirt = false
	GameManager.rainbowShirt = false
	GameManager.blackPants = false
	GameManager.sunglasses = false
	GameManager.dog = false
	GameManager.smallApartment = false
	GameManager.largeApartment = false
	GameManager.smallHouse = false
	GameManager.largeHouse = false
	GameManager.largeHouseValue = 800000
	GameManager.smallHouseValue = 150000


	# JOBS

	GameManager.job = ["", 0]

	GameManager.lowpaying = ["Janitor", "Fast Food Worker", "Retail Worker", "Waiter", "Hairdresser", "Delivery Driver", "Lab Internship", "Plumber", "Bartender", "Cashier", "Babysitter", "Tutor", "Librarian", "Car Mechanic", "Baker", "Telemarketer", "Nail Technician", "Car Cleaner", "Garbageman", "Desk Clerk", "Coach", "Dishwasher", "Actor", "Magazine Editor", "Photographer", "Chef", "Dancer"]
	GameManager.medpaying = ["Financial Advisor", "Nurse", "Human Resource Assistant", "Laboratory Technician", "Financial Manager", "Teacher", "Paralegal", "Sales representative", "Data Scientist", "Information Technology", "Architect", "Pilot", "Accountant", "Police Officer", "Food Scientist", "Secretary", "Artist", "Animator", "Painter", "Film Direction", "Actor", "Author", "Fashion Designer", "Politician", "Chef", "Dancer", "Civil Engineer"]
	GameManager.highpaying = ["Doctor", "Lawyer", "Engineer", "Computer Engineer", "Anesthesiologist", "Biologist", "Chemist", "Dentist", "Orthodontist", "Cardiologist", "Architecture Manager", "Realtor", "Software Architect", "Petroleum Engineer", "CEO", "Sales Manager", "Quantitive Analyist", "Plant Manager", "Mathetician", "Veterinarian", "Computer Security Analyst", "Pharmacist", "Politician", "Chef", "Civil Engineer"]

	GameManager.avallow = [["", 0, 0, []],["", 0, 0, []],["", 0, 0, []],["", 0, 0, []]]
	GameManager.avalmed = [["", 0, 0, []],["", 0, 0, []],["", 0, 0, []],["", 0, 0, []]]
	GameManager.avalhigh = [["", 0, 0, []],["", 0, 0, []],["", 0, 0, []],["", 0, 0, []]]

	GameManager.hours = 0

	# INSURANCE

	GameManager.insurance = {"Home": 0, "Health": 0, "Employment": 0}


	GameManager.event = 0
