extends MainMenu

@onready var stats_container = $ColorRect/StatsContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	EventBus.open_pause_menu.connect(open_pause_menu)
	EventBus.game_resumed.connect(game_resumed)


func open_pause_menu():
	stats_container.update_stats()
	show()

func game_resumed():
	hide()


func _on_resume_pressed():
	EventBus.game_resumed.emit()
