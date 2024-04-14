extends Node


func _ready():
	EventBus.game_started.connect(capture_mouse)
	EventBus.game_resumed.connect(capture_mouse)
	EventBus.open_main_menu.connect(enable_mouse)
	EventBus.open_pause_menu.connect(enable_mouse)
	EventBus.game_over.connect(game_over)

func capture_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func enable_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func game_over(_cause: GameOver.Cause):
	enable_mouse()
