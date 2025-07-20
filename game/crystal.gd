extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		
		collect()

func collect():
	Global.crystals += 1
	Global.score += 2
	$sprite.hide()
	monitoring = false
	$GPUParticles2D.emitting = true
	await get_tree().create_timer(1.0).timeout
	queue_free()
