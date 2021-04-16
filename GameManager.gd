extends Node

# THESE ARE GLOBAL VARIABLES (goes across scenes)

var first = true

# STATS

var money = 150000
var bankMoney = 0
var happiness = 50
var credit = 50
var health = 50
var netWorth = 0
var experience = 0

# TIME

var year = 1
var second = 10

# SCHOOL STUFF

var degrees = []
var marks = [[], [], [], []]
var education = ""
var edyear = 0
var studentAid = 0

# BILLS
var houseRent = 0
var houseMain = 0
var loans = 0
var taxes = 0
var tuition = 0

# LOANS
var loanStudent = 20
var loanMortgage = 0
var loanPersonal = 0
var creditScore = 200
var loanPersonalInterest = 0
var loanMortgageInterest = 0
var studentLoanPayback = 0
var personalLoanPayback = 0
var mortgageLoanPayback = 0

# HOUSE COSTS
var houseRentCost = 0
var houseMainCost = 0

# ITEMS OWNED
var blueShirt = false
var heartShirt = false
var rainbowShirt = false
var blackPants = false
var sunglasses = false
var dog = false
var smallApartment = false
var largeApartment = false
var smallHouse = false
var largeHouse = false
var largeHouseValue = 800000
var smallHouseValue = 150000


# JOBS

var job = ["", 0]

var lowpaying = ["Janitor", "Fast Food Worker", "Retail Worker", "Waiter", "Hairdresser", "Delivery Driver", "Lab Internship", "Plumber", "Bartender", "Cashier", "Babysitter", "Tutor", "Librarian", "Car Mechanic", "Baker", "Telemarketer", "Nail Technician", "Car Cleaner", "Garbageman", "Desk Clerk", "Coach", "Dishwasher", "Actor", "Magazine Editor", "Photographer", "Chef", "Dancer"]
var medpaying = ["Financial Advisor", "Nurse", "Human Resource Assistant", "Laboratory Technician", "Financial Manager", "Teacher", "Paralegal", "Sales representative", "Data Scientist", "Information Technology", "Architect", "Pilot", "Accountant", "Police Officer", "Food Scientist", "Secretary", "Artist", "Animator", "Painter", "Film Direction", "Actor", "Author", "Fashion Designer", "Politician", "Chef", "Dancer", "Civil Engineer"]
var highpaying = ["Doctor", "Lawyer", "Engineer", "Computer Engineer", "Anesthesiologist", "Biologist", "Chemist", "Dentist", "Orthodontist", "Cardiologist", "Architecture Manager", "Realtor", "Software Architect", "Petroleum Engineer", "CEO", "Sales Manager", "Quantitive Analyist", "Plant Manager", "Mathetician", "Veterinarian", "Computer Security Analyst", "Pharmacist", "Politician", "Chef", "Civil Engineer"]

var avallow = [["", 0, 0, []],["", 0, 0, []],["", 0, 0, []],["", 0, 0, []]]
var avalmed = [["", 0, 0, []],["", 0, 0, []],["", 0, 0, []],["", 0, 0, []]]
var avalhigh = [["", 0, 0, []],["", 0, 0, []],["", 0, 0, []],["", 0, 0, []]]

var hours = 0
