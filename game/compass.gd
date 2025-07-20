extends Node2D

var closestdis:int = 1000000
var closestcharger

func _process(_delta: float) -> void:
	closestdis = 1000000
	for i in get_tree().get_nodes_in_group("Charger"):
		var pos:Vector2 = Global.player.global_position
		var dis = pos.distance_to(i.global_position)
		if dis < closestdis:
			closestdis = dis
			closestcharger = i
	
	if closestdis < 150.0:
		hide()
	else:
		show()
	var dir = (closestcharger.global_position - Global.player.global_position).normalized()
	rotation = dir.angle()
