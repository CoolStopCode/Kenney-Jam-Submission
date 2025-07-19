extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func game_over():
	$bg.show()
	$ending.show()


func _on_texture_button_pressed() -> void:
	get_tree().reload_current_scene()
