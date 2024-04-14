extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	EventBus.open_main_menu.connect(hide)
	EventBus.open_pause_menu.connect(hide)
	EventBus.game_over.connect(func(_cause): hide())

	EventBus.game_resumed.connect(show)
	EventBus.game_started.connect(show)

