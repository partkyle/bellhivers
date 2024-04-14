extends Control


func _ready():
	EventBus.open_main_menu.connect(open_main_menu)


func open_main_menu():
	show()

func _on_start_game_button_pressed():
	EventBus.game_started.emit()
	hide()


func _on_exit_pressed():
	get_tree().quit()
