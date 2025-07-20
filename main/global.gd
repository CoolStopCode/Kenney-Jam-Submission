extends Node

var InGame: bool = false
var power : float
var crystals : int 
var power_bar : Node
var player : Node
var crystal_count : Node
var game : Node
var cam : Node
var charge_cost : int
var score : int
var charge_multiplier = 1.5
const MAX_POWER := 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	power = MAX_POWER

func hit(damage):
	power -= damage
	player.hit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if InGame:
		power_bar.value = power
		crystal_count.text = str(crystals)

func reset():
	power = MAX_POWER
	crystals = 0
	power_bar = get_node("/root/main/power")
	player = get_node("/root/main/window/viewport/game/player")
	crystal_count = get_node("/root/main/crystals/Label")
	game = get_node("/root/main/window/viewport/game")
	cam = get_node("/root/main/window/viewport/game/player/camera")
	score = 0
	charge_cost = 2
