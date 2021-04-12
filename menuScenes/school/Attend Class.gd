extends Tabs

onready var math = get_node("QuestionContainer/MathQuestion")
onready var question = get_node("QuestionContainer/MathQuestion/question")
onready var answer = get_node("QuestionContainer/MathQuestion/answer")


onready var mc = get_node("QuestionContainer/MultipleChoice")
onready var questionmc = get_node("QuestionContainer/MultipleChoice/question")
onready var answer0 = get_node("QuestionContainer/MultipleChoice/answer")
onready var answer1 = get_node("QuestionContainer/MultipleChoice/answer2")
onready var answer2 = get_node("QuestionContainer/MultipleChoice/answer3")
onready var answer3 = get_node("QuestionContainer/MultipleChoice/answer4")

var defs = {"Budget": " A summary or estimate of income and expenses over a period of time.", "Credit card": " A card issued by the bank to an individual that allows them to purchase goods and services on credit.", "Debt": "Something, usually money, that is owed by someone to another party.", "Income tax": " The amount of money subtracted from an individual’s salary by the government to pay for its programs.", "Interest": " Payments made by someone borrowing money for their use of the lender’s money, usually expressed as a percentage.", "Investment": " To purchase something that offers the potential for profitable returns such as income, increased value, or interest in the future.", "Landlord": " An individual who rents their property to another individual.", "Loan": " An amount of money borrowed that is expected to be repaid with interest.", "Net worth": " The value of all the assets that a person owns, subtracted by the liabilities that they owe.", "Salary": " The fixed amount paid by an employer to an employee, typically bi-weekly or monthly, for a job. The amount is usually specified in a contract and could include benefits such as health coverage.", "Tenant": " An individual who pays rent to live in another individual’s property.", "Variable interest rate": " An interest rate on a liability that changes over time.", "Wage": " The amount paid by an employer to an employee for labour or services according to a contract for a unit of time (eg. hourly or daily)."}
var defsmed = {"Employment Insurance": "The amount of money subtracted from an individual’s salary in order to be paid out in the case of sudden illness or unemployment.", "Credit history": "The record of an individual’s ability to pay back debt and includes their payment patterns.", "Credit limit": "The maximum amount of money that the bank extends to a client based on their credit rating and history.", "Credit rating": "An evaluation of an individual’s ability to complete their financial commitments (eg. pay back debt) based on previous actions.", "Insurance coverage": "The amount of risk or liability that an insurance policy covers for an individual.", "Landlord": "An individual who rents their property to another individual.", "Liability": "Anything that is owed to someone else by an individual (debt).", "Credit": "The ability of a client to receive goods or services before pay, due to the trust that the payment will be completed in the future.", "Annual fee": "The fee charged every year by the bank or institution to clients for the right to use their credit card.", "Asset": "Anything that a person owns that has monetary value."}
var defshard = {"Principle": "The total amount of money that an individual still owes to the lender. This value decreases over time as an individual’s loan is paid.", "Fixed expense": "An expense that usually remains the same from one billing period to the next, and is not affected by individual usage, but instead is defined in a contract, such as rent.", "Fixed interest rate": "An interest rate that is charged on a liability (such as a loan), that remains the same over time.", "Flexible expense": "An expense that changes from one billing period to the next, and may depend on individual usage, such as utility bills.", "Insurance Premium": "the amount of money an individual pays, usually on a monthly basis, to keep an insurance policy active.", "Lease": "A contract between a landlord and a tenant regarding the terms of rent.", "Rate of return": "The profit or loss of an investment over a period of time, often shown as a percentage."}

var correctmc

onready var correct = get_node("correct")
onready var mark = get_node("mark")

onready var un = get_node("Unavailible")

var a
var b
var op

var rng = RandomNumberGenerator.new()
var expression = Expression.new()

#var cor = {"Associate's": 50, "Bachelor's": 50, "Master's": 50, "phD": 50}
var cor = {"Associate's": 10, "Bachelor's": 10, "Master's": 5, "phD": 4}
var incor = {"Associate's": 20, "Bachelor's": 25, "Master's": 15, "phD": 20}
var  num = {"Associate's": 0, "Bachelor's": 1, "Master's": 2, "phD": 3}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


func load_question():
	if GameManager.education != "" and GameManager.education != null:
		mark.text = "Mark: " + str(GameManager.marks[num[GameManager.education]][GameManager.edyear-1]) + "%"
		correct.show()
		mark.show()
	else:
		mc.hide()
		math.hide()
		correct.hide()
		mark.hide()
		un.show()
		
	if a == null and questionmc.text == "":
		question()

func question():
	if GameManager.education != "":
		mark.text = "Mark: " + str(GameManager.marks[num[GameManager.education]][GameManager.edyear-1]) + "%"
		un.hide()
		var percent = randf()
		if (percent > 0.5):
			mc.hide()
			math.show()
			set_math_question()
		else:
			math.hide()
			mc.show()
			set_mc_question()
		

func set_mc_question(): #multiple choice question
	var defsc = defs.duplicate() # defs copy
	if GameManager.education == "Associate's":
		defsc = defs.duplicate()
	if GameManager.education == "Bachelor's":
		merge_dict(defsc, defsmed.duplicate()) 
	if GameManager.education == "Master's":
		merge_dict(defsc, defsmed.duplicate()) 
		merge_dict(defsc, defshard.duplicate()) 
	if GameManager.education == "phD's":
		merge_dict(defsc, defsmed.duplicate()) 
		merge_dict(defsc, defshard.duplicate()) 
		
	var term = get_random(defsc)
	questionmc.text = defsc[term]
	
	var defswithout = defsc.duplicate()
	defswithout.erase(term)
	
	answer0.text = get_random(defswithout)
	answer1.text = get_random(defswithout)
	answer2.text = get_random(defswithout)
	answer3.text = get_random(defswithout)
	
	var rand = rng.randi_range(1, 4)
	
	correctmc = rand
	
	if rand == 1:
		answer0.text = term
	elif rand == 2:
		answer1.text = term
	elif rand == 3:
		answer2.text = term
	elif rand == 4:
		answer3.text = term

func button_pressed(button):
	if button == correctmc:
		correct.text = "correct"
		GameManager.marks[num[GameManager.education]][GameManager.edyear-1] += cor[GameManager.education]
	else:
		correct.text = "incorrect"
		GameManager.marks[num[GameManager.education]][GameManager.edyear-1] -= incor[GameManager.education]
	
	if GameManager.marks[num[GameManager.education]][GameManager.edyear-1] > 100:
		GameManager.marks[num[GameManager.education]][GameManager.edyear-1] = 100
	if GameManager.marks[num[GameManager.education]][GameManager.edyear-1] < 0:
		GameManager.marks[num[GameManager.education]][GameManager.edyear-1] = 0
	
	mark.text = "Mark: " + str(GameManager.marks[num[GameManager.education]][GameManager.edyear-1]) + "%"
	question()

func _on_answer_pressed() -> void:
	button_pressed(1)

func _on_answer2_pressed() -> void:
	button_pressed(2)

func _on_answer3_pressed() -> void:
	button_pressed(3)

func _on_answer4_pressed() -> void:
	button_pressed(4)

func set_math_question():
	if GameManager.education == "Associate's":
		a = rng.randi_range(1,9)
		b = rng.randi_range(1,9)
		op = "+"
		question.text = str(a) + " " + op + " " + str(b)
	
	if GameManager.education == "Bachelor's":
		a = rng.randi_range(1,9)
		b = rng.randi_range(1,9)
		var ops = ["+", "*"]
		op = ops[randi() % ops.size()]
		question.text = str(a) + " " + op + " " + str(b)
		
	if GameManager.education == "Master's":
		a = rng.randi_range(1,12)
		b = rng.randi_range(1,12)
		var ops = ["+", "*", "-"]
		op = ops[randi() % ops.size()]
		question.text = str(a) + " " + op + " " + str(b)
		
	if GameManager.education == "phD":
		a = rng.randi_range(1,15)
		b = rng.randi_range(1,15)
		var ops = ["+", "*", "-"]
		op = ops[randi() % ops.size()]
		question.text = str(a) + " " + op + " " + str(b)

func _on_answer_text_entered(new_text: String) -> void:

	
	expression.parse(question.text)
	var a = expression.execute()
	if new_text == str(a):
		correct.text = "correct"
		GameManager.marks[num[GameManager.education]][GameManager.edyear-1] += cor[GameManager.education]
	else:
		correct.text = "incorrect"
		GameManager.marks[num[GameManager.education]][GameManager.edyear-1] -= incor[GameManager.education]
		
	answer.text = ""
	
	if GameManager.marks[num[GameManager.education]][GameManager.edyear-1] > 100:
		GameManager.marks[num[GameManager.education]][GameManager.edyear-1] = 100
	if GameManager.marks[num[GameManager.education]][GameManager.edyear-1] < 0:
		GameManager.marks[num[GameManager.education]][GameManager.edyear-1] = 0
		
	mark.text = "Mark: " + str(GameManager.marks[num[GameManager.education]][GameManager.edyear-1]) + "%"
	question()

func get_random(dict):
   var a = dict.keys()
   a = a[randi() % a.size()]
   return a

static func merge_dict(dest, source):
	for key in source:                     # go via all keys in source
		if dest.has(key):                  # we found matching key in dest
			var dest_value = dest[key]     # get value 
			var source_value = source[key] # get value in the source dict           
			if typeof(dest_value) == TYPE_DICTIONARY:       
				if typeof(source_value) == TYPE_DICTIONARY: 
					merge_dict(dest_value, source_value)  
				else:
					dest[key] = source_value # override the dest value
			else:
				dest[key] = source_value     # add to dictionary 
		else:
			dest[key] = source[key]          # just add value to the dest
