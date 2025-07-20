extends Control

@onready var StartButton = $TextureButton
@onready var StartButtonTXT = $TextureButton/Label
var SBhovered:bool = false

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main/main.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
