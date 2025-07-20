extends Node2D

@export var damage : float = 2.0
@export var speed : float = 200.0  # Pixels per second

const LIFESPAN = 5.0
var time_left = LIFESPAN

func _process(delta: float) -> void:
	time_left -= delta
	if time_left <= 0:
		queue_free()
	# Move forward in the direction of the node's rotation
	position += Vector2.RIGHT.rotated(rotation) * speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.hit(damage)
		$Sprite2D.hide()
		$player.set_deferred("monitoring", false)
		$end.emitting = true
		await get_tree().create_timer(1.0).timeout
		queue_free()
	


func _on_tilemap_body_entered(body: Node2D) -> void:
	if body.is_in_group("tilemap"):
		$Sprite2D.hide()
		$tilemap.set_deferred("monitoring", false)
		$end.emitting = true
		await get_tree().create_timer(1.0).timeout
		queue_free()
