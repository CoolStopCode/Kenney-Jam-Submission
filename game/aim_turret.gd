extends StaticBody2D

@export var game_node : Node

var bullet_speed = 400.0
var bullet_damage = 5.0
var shoot_cooldown = 0.5  # seconds between shots
var shoot_timer = 0.0
var range = 900

var in_range := false

func _process(delta: float) -> void:
	var distance = sqrt(
	pow(global_position.x - Global.player.global_position.x, 2) +
	pow(global_position.y - Global.player.global_position.y, 2)
	)

	if distance <= range:
		in_range = true
	else:
		in_range = false
	
	shoot_timer -= delta
	if shoot_timer <= 0.0:
		if in_range:
			game_node = Global.game
			var dir = (Global.player.global_position - $top.global_position).angle()
			$top.rotation = dir - deg_to_rad(90)
			shoot()
		shoot_timer = shoot_cooldown

func shoot():
	game_node.create_bullet(bullet_speed, bullet_damage, position, $top.rotation + PI / 2)
	$top/top.scale.y = 1.0
	$top/top/muzzle.show()
	await get_tree().create_timer(0.1).timeout
	$top/top/muzzle.hide()
	$top/top.scale.y = 1.5
