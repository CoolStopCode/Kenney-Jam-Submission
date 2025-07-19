extends CharacterBody2D

var speed = 3000
var rotatespeed = 0.6

var Power = 1000

func _ready() -> void:
	$Camera2D/ProgressBar.max_value = Power

func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Power <= 0:
		return
	$Camera2D/ProgressBar.value = Power

	if Input.is_action_pressed("Forward"):
		velocity = $Marker2D.global_position - global_position
		Power -= 0.1
	if Input.is_action_pressed("Reverse"):
		velocity = -($Marker2D.global_position - global_position)
		Power -= 0.1
#Rotation
	if Input.is_action_pressed("Left"):
		rotation += -rotatespeed * delta
		Power -= 0.1
	if Input.is_action_pressed("right"):
		rotation += rotatespeed * delta
		Power -= 0.1
	$Camera2D.rotation = -rotation

	velocity = velocity.normalized() * speed * delta
	move_and_slide()
