extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		
		collect()

func collect():
	Global.crystals += 1
	$sprite.hide()
	monitoring = false
	$GPUParticles2D.emitting = true
	await get_tree().create_timer(1.0).timeout
	queue_free()
