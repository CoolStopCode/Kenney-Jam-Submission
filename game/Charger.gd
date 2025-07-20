extends Area2D

var Player:bool = false
var can_buy = false

func _process(_delta: float) -> void:
	if Player and Global.crystals >= Global.charge_cost:
		can_buy = true
		$outline.show()
	else:
		can_buy = false
		$outline.hide()
	
	if Player:
		$display.show()
		$display/Label.text = str(Global.charge_cost)
	else:
		$display.hide()
	
	
	if Input.is_action_just_pressed("confirm") and can_buy:
		Global.crystals -= Global.charge_cost
		Global.charge_cost *= Global.charge_multiplier
		Global.power = Global.MAX_POWER
		Global.score += 10
		$sparks.emitting = true
		get_node("/root/main/window/viewport/game/player/camera").shake(0.6, 20.0)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Player = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Player = false
