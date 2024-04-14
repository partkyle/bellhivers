extends Control

func _ready():
	hide()
	EventBus.open_main_menu.connect(open_main_menu)
	EventBus.open_pause_menu.connect(open_pause_menu)
	EventBus.game_resumed.connect(game_resumed)
	EventBus.game_started.connect(game_started)
	EventBus.game_over.connect(game_over)


func open_main_menu():
	hide()

func open_pause_menu():
	hide()

func game_resumed():
	show()

func game_started():
	show()

func game_over(_cause: GameOver.Cause):
	print('in game game over')
	hide()

func _input(event):
	if visible and event.is_action_pressed('main_menu'):
		EventBus.open_pause_menu.emit()
		accept_event()
