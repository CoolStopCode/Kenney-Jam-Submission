extends Area2D

var Player = null

func _physics_process(delta: float) -> void:
	if Player != null:
		Player.Power += 0.5

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player = body

func _on_body_exited(body: Node2D) -> void:
	if body == Player:
		Player = null
