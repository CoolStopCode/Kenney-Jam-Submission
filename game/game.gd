extends Node2D

var bullet = load("res://game/bullet.tscn")

func create_bullet(speed, damage, pos, rot):
	var instance = bullet.instantiate()
	instance.position = pos
	instance.rotation = rot
	instance.speed = speed
	instance.damage = damage
	$bullets.add_child(instance)
