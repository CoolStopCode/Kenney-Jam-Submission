extends Area2D

var Player:bool = false
var cost : int = 5
var can_buy = false

func _process(delta: float) -> void:
	if Player and Global.crystals >= cost:
		can_buy = true
		$outline.show()
	else:
		can_buy = false
		$outline.hide()
	
	if Player:
		$display.show()
		$display/Label.text = str(cost)
	else:
		$display.hide()
	
	
	if Input.is_action_just_pressed("confirm") and can_buy:
		Global.crystals -= cost
		Global.power = Global.MAX_POWER
		$sparks.emitting = true
		get_node("/root/main/window/viewport/game/player/camera").shake(0.6, 20.0)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Player = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Player = false
