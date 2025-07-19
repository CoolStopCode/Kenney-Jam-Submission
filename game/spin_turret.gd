extends StaticBody2D

const ROTATE_SPEED = 0.5
@export var game_node : Node

var bullet_speed = 400.0
var bullet_damage = 5.0
var shoot_cooldown = 0.7  # seconds between shots
var shoot_timer = 0.0

func _process(delta: float) -> void:
	$top.rotation += ROTATE_SPEED * delta
	
	shoot_timer -= delta
	if shoot_timer <= 0.0:
		shoot()
		shoot_timer = shoot_cooldown

func shoot():
	game_node.create_bullet(bullet_speed, bullet_damage, position, $top.rotation + PI / 2)
	game_node.create_bullet(bullet_speed, bullet_damage, position, $top.rotation - PI / 2)
	$top.scale.y = 1.0
	$top/muzzle.show()
	await get_tree().create_timer(0.1).timeout
	$top/muzzle.hide()
	$top.scale.y = 1.5
