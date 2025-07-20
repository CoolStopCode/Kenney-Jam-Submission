extends CharacterBody2D

const MOVE_SPEED = 30000
const BODY_ROTATE_SPEED = 20
const TRACKS_ROTATE_SPEED = 7
const POWER_USAGE = 0.8 # how much power is used per second

const DASH_TIME = 0.5
const DASH_SPEED = 100000
const DASH_POWER_COST = 3.0
var dash_time_left : float
var dashing = true

var dead := false
func direction_to_vector(theta):
	return Vector2(cos(theta), sin(theta))

func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Global.power <= 0:
		dead = true
		$trail.emitting = false
		$dust.emitting = false
		modulate = Color(0.3, 0.3, 0.3)
		get_node("/root/main").game_over()
		return

	if Input.is_action_pressed("Forward"):
		velocity = direction_to_vector($body.rotation).normalized() * MOVE_SPEED  * delta
		Global.power -= POWER_USAGE * delta
	if Input.is_action_pressed("Reverse"):
		velocity = -direction_to_vector($body.rotation).normalized() * MOVE_SPEED  * delta
		Global.power -= POWER_USAGE * delta
	if Input.is_action_just_pressed("dash"):
		Global.power -= DASH_POWER_COST
		dash_time_left = DASH_TIME
		dashing = true
	
	if dashing:
		modulate = Color8(255, 100, 100)
		velocity = direction_to_vector($tracks.rotation).normalized() * DASH_SPEED * delta
		dash_time_left -= delta
		if dash_time_left <= 0.0:
			modulate = Color(0.8, 0.8, 0.8)
			dashing = false

	if Input.is_action_pressed("Forward") or Input.is_action_pressed("Reverse"):
		$trail.emitting = true
		$dust.emitting = true
		$dust.rotation = $body.rotation
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
	$body.rotation = lerp_angle($body.rotation, target_angle, BODY_ROTATE_SPEED * delta)
	$tracks.rotation = lerp_angle($tracks.rotation, target_angle, TRACKS_ROTATE_SPEED * delta)

	
	move_and_slide()

func hit():
	if not dead:
		get_node("/root/main/window/viewport/game/player/camera").shake(0.2, 5.0)
		modulate = Color(1.0, 0.6, 0.6)
		await get_tree().create_timer(0.2).timeout
		modulate = Color(0.8, 0.8, 0.8)
	
	
	
