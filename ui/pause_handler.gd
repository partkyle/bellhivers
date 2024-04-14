extends Node


func _ready():
	EventBus.open_main_menu.connect(pause)
	EventBus.game_over.connect(func(_cause): pause())

	EventBus.game_started.connect(unpause)

func pause():
	get_tree().paused = true

func unpause():
	get_tree().paused = false
