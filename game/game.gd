extends Node2D

var bullet = load("res://game/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_bullet(speed, damage, pos, rot):
	var instance = bullet.instantiate()
	instance.position = pos
	instance.rotation = rot
	instance.speed = speed
	instance.damage = damage
	$bullets.add_child(instance)
