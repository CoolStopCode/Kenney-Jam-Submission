extends Control

@onready var StartButton = $TextureButton
@onready var StartButtonTXT = $TextureButton/Sprite2D
var SBhovered:bool = false

func _process(_delta: float) -> void:
	if StartButton.is_hovered() and !SBhovered:
		SBhovered = true
		for i in int(8):
			StartButtonTXT.scale += Vector2(0.02,0.02)
			await get_tree().process_frame
	elif !StartButton.is_hovered() and SBhovered:
		SBhovered = false
		for i in int(8):
			StartButtonTXT.scale -= Vector2(0.02,0.02)
			await get_tree().process_frame


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main/main.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
