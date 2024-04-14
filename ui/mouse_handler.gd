extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.game_started.connect(game_started)
	EventBus.game_over.connect(game_over)


func game_started():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func game_over():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
