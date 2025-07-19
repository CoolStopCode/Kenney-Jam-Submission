extends Camera2D

var shake_time = 0.0
var shake_strength = 0.0
var shake_decay = 0.0
var original_offset = Vector2.ZERO

func _ready() -> void:
	original_offset = offset  # Save the original offset of the camera

func _process(delta: float) -> void:
	if shake_time > 0:
		shake_time -= delta
		shake_strength = max(shake_strength - shake_decay * delta, 0)
		offset = original_offset + Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
	else:
		offset = original_offset  # Reset when shake is done

func shake(duration: float, strength: float) -> void:
	shake_time = duration
	shake_strength = strength
	shake_decay = strength / duration  # Amount to decay per second
