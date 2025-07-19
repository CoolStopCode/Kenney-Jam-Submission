extends Node2D

@export var damage : float = 2.0
@export var speed : float = 200.0  # Pixels per second

func _process(delta: float) -> void:
	# Move forward in the direction of the node's rotation
	position += Vector2.RIGHT.rotated(rotation) * speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.hit(damage)
		$Sprite2D.hide()
		$Area2D.monitoring = false
		$end.emitting = true
		await get_tree().create_timer(1.0).timeout
		queue_free()
