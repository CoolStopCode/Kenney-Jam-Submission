extends Node2D

var crystal = load("res://game/crystal.tscn")
var top_left = Vector2(-8000, -5200)
var bottom_right = Vector2(9600, 6200)
var amount = randi_range(100, 200)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()  # Ensure randomness each run
	for i in amount:
		var rand_pos = Vector2(
			randf_range(top_left.x, bottom_right.x),
			randf_range(top_left.y, bottom_right.y)
		)
		spawn_crystal(rand_pos)

func spawn_crystal(pos: Vector2):
	var instance = crystal.instantiate()
	instance.position = pos
	add_child(instance)
