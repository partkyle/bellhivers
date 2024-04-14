extends MainMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	EventBus.open_pause_menu.connect(open_pause_menu)
	EventBus.game_resumed.connect(game_resumed)


func open_pause_menu():
	show()

func game_resumed():
	hide()


func _on_resume_pressed():
	EventBus.game_resumed.emit()
