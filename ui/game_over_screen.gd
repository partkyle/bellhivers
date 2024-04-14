extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	EventBus.game_started.connect(game_started)
	EventBus.game_over.connect(game_over)

func game_started():
	hide()

func game_over():
	show()


func _on_main_menu_button_pressed():
	EventBus.open_main_menu.emit()
	hide()


func _on_hive_again_button_pressed():
	EventBus.game_started.emit()
