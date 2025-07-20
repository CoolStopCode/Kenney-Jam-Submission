extends StaticBody2D

const ROTATE_SPEED = 0.5
var game_node : Node

var bullet_speed = 800.0
var bullet_damage = 6.0
var shoot_cooldown = 0.4  # seconds between shots
var shoot_timer = 0.0
var Tankrange = 1200

var in_range := false

func _process(delta: float) -> void:
	$top.rotation += ROTATE_SPEED * delta
	
	var distance = sqrt(
	pow(global_position.x - Global.player.global_position.x, 2) +
	pow(global_position.y - Global.player.global_position.y, 2)
	)

	if distance <= Tankrange:
		in_range = true
	else:
		in_range = false
	
	shoot_timer -= delta
	if shoot_timer <= 0.0:
		if in_range:
			game_node = Global.game
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
