extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.game_started.connect(capture_mouse)

	EventBus.open_main_menu.connect(enable_mouse)
	EventBus.game_over.connect(enable_mouse)

func capture_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func enable_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
