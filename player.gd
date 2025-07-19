extends CharacterBody2D

var speed = 100000
var rotatespeed = 0.6

var Power = 1000

func direction_to_vector(theta):
	return Vector2(cos(theta), sin(theta))

func _ready() -> void:
	$Camera2D/ProgressBar.max_value = Power

func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Power <= 0:
		return
	$Camera2D/ProgressBar.value = Power

	if Input.is_action_pressed("Forward"):
		velocity = direction_to_vector(rotation)
		Power -= 0.1
	if Input.is_action_pressed("Reverse"):
		velocity = -direction_to_vector(rotation)
		Power -= 0.1

	# If you want key turning
	
	#if Input.is_action_pressed("Left"):
	#	rotation += -rotatespeed * delta
	#	Power -= 0.1
	#if Input.is_action_pressed("right"):
	#	rotation += rotatespeed * delta
	#	Power -= 0.1
	#$Camera2D.rotation = -rotation
	
	var global_mouse = get_global_mouse_position()
	var local_mouse = to_local(global_mouse)
	rotation = local_mouse.angle()
	
	velocity = velocity.normalized() * speed * delta
	move_and_slide()
