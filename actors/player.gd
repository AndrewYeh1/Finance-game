extends Actor

export var stomp_impulse: = 1000.0

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
	elif Input.get_action_strength("move_left"):
		get_node( "playerskin" ).set_flip_h( false )

	
# DETECTS WHICH BUILDING PLAYER CAN ENTER

func _on_bankDetector_area_shape_entered(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
	print("bank")

func _on_schoolDetector_area_shape_entered(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
	print("school")
