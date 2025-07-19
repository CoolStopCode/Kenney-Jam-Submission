extends CharacterBody2D

const MOVE_SPEED = 30000
const ROTATE_SPEED = 20
const POWER_USAGE = 2.0 # how much power is used per second

func direction_to_vector(theta):
	return Vector2(cos(theta), sin(theta))

func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Global.power <= 0:
		return

	if Input.is_action_pressed("Forward"):
		velocity = direction_to_vector($sprite.rotation)
		Global.power -= POWER_USAGE * delta
	if Input.is_action_pressed("Reverse"):
		velocity = -direction_to_vector($sprite.rotation)
		Global.power -= POWER_USAGE * delta
	
	if Input.is_action_pressed("Forward") or Input.is_action_pressed("Reverse"):
		$trail.emitting = true
		$dust.emitting = true
		$dust.rotation = $sprite.rotation
	else:
		$trail.emitting = false
		$dust.emitting = false
	# If you want key turning
	
	#if Input.is_action_pressed("Left"):
	#	rotation += -rotatespeed * delta
	#	Power -= 0.1
	#if Input.is_action_pressed("right"):
	#	rotation += rotatespeed * delta
	#	Power -= 0.1
	#$Camera2D.rotation = -rotation
	
	var global_mouse = get_global_mouse_position()
	var target_angle = (global_mouse - global_position).angle()
	$sprite.rotation = lerp_angle($sprite.rotation, target_angle, ROTATE_SPEED * delta)

	
	velocity = velocity.normalized() * MOVE_SPEED  * delta
	move_and_slide()
