extends Node

var power : float
var crystals : int 
var power_bar : Node
var player : Node
var crystal_count  : Node
const MAX_POWER := 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	power = MAX_POWER

func hit(damage):
	power -= damage
	player.hit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	power_bar.value = power
	crystal_count.text = str(crystals)

func reset():
	power = MAX_POWER
	crystals = 5
	power_bar = get_node("/root/main/power")
	player = get_node("/root/main/window/viewport/game/player")
	crystal_count = get_node("/root/main/crystals/Label")
