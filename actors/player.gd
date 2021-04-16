extends Actor

export var stomp_impulse: = 1000.0

var location = null

onready var dog = get_node("Node2D/dog")
onready var glasses = get_node("Node2D/glasses")
onready var pants = get_node("Node2D/pants")

onready var blue = get_node("Node2D/blue")
onready var pink = get_node("Node2D/pink")
onready var rainbow = get_node("Node2D/rainbow")

onready var clothes = [blue, pink, rainbow]
onready var allclothes = [dog, glasses, pants, blue, pink, rainbow]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	if GameManager.dogPet:
		dog()
	if GameManager.sun:
		glasses()
	if GameManager.pant:
		pants()
	if GameManager.rain:
		rainbow()
	if GameManager.heart:
		pink()
	if GameManager.blue:
		blue()

func dog():
	dog.visible = !dog.visible
	GameManager.dogPet = !GameManager.dogPet

func glasses():
	glasses.visible = !glasses.visible
	GameManager.sun = !GameManager.sun
	
func pants():
	pants.visible = !pants.visible
	GameManager.pant = !GameManager.pant
	
func rainbow():
	for c in clothes:
		c.hide()
	
	GameManager.heart = false
	GameManager.blue = false
	rainbow.show()
	GameManager.rain = true

func pink():
	for c in clothes:
		c.hide()
	
	GameManager.rain = false
	GameManager.blue = false
	pink.show()
	GameManager.heart = true
	
func blue():
	for c in clothes:
		c.hide()
	
	GameManager.rain = false
	GameManager.heart = false
	blue.show()
	GameManager.blue = true
	


func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)
	

func _on_EnemyDetector_body_entered(body: Node) -> void:
	queue_free()

func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	ChangeDirection()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.get_action_strength("jump") and is_on_floor() else 1.0
	)
	

func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
	) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	
	if new_velocity.y < 0:
		if not Input.get_action_strength("jump"):
			new_velocity.y += 20.0
		else:
			new_velocity.y -= 5.0
	
	#fdjsdfk
	
	return new_velocity

func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out: = linear_velocity
	out.y = -impulse

	return out

#dfdsfjnkfds

func ChangeDirection():
	if Input.get_action_strength("move_right"):
		get_node( "playerskin" ).set_flip_h( true )
		for c in allclothes:
			c.set_flip_h(true)
	elif Input.get_action_strength("move_left"):
		get_node( "playerskin" ).set_flip_h( false )
		for c in allclothes:
			c.set_flip_h(false)

	
# DETECTS WHICH BUILDING PLAYER CAN ENTER

# detects the person entering
func _on_buildingDetector_area_shape_entered(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
	print(area.get_name())
	
	if ["RightDoor", "Bank", "School", "Jobs", "Home", "BankTeller", "LeftDoor", "Insurance", "Store", "LowPayingJob", "MedPayingJob", "HighPayingJob", "StoreInt"].has(area.get_name()):
		location = area.get_name()
		$enter.show()
	
	if [].has(area.get_name()):
		location = area.get_name()
	
		
	

# detects the person exiting
func _on_buildingDetector_area_shape_exited(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
	location = null
	$enter.hide()

# detects key pressed
func _input(ev):
	if Input.is_key_pressed(KEY_SPACE):
		if location == "Bank":
			get_tree().change_scene("res://building_interior/bank/BankInt.tscn")
		elif location == "School":
			get_tree().change_scene("res://building_interior/school/school.tscn")
		elif location == "Store":
			get_tree().change_scene("res://building_interior/store/storeInterior.tscn")
		elif location == "Home":
			get_tree().change_scene("res://building_interior/house/houseInt.tscn")
		elif location == "Jobs":
			get_tree().change_scene("res://building_interior/jobs/jobs.tscn")
		elif location == "Insurance":
			get_tree().change_scene("res://building_interior/insurance/insuranceint.tscn")

