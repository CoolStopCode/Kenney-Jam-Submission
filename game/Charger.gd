extends Area2D

var Player:bool = false

func _physics_process(delta: float) -> void:
	if Player and Global.power <= 100:
		Global.power += 4 * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player = false
