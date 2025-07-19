extends Node

var power : float
@onready var power_bar := get_node("/root/main/power")
const MAX_POWER := 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	power = MAX_POWER


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(power)
	power_bar.value = power
