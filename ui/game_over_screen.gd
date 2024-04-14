extends Control

@onready var subtext_label = $ColorRect/MenuWrapper/Messages/SubtextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	EventBus.game_started.connect(game_started)
	EventBus.game_over.connect(game_over)

func game_started():
	hide()

func game_over(cause: GameOver.Cause):
	subtext_label.text = GameOver.cause_to_text(cause)
	show()


func _on_main_menu_button_pressed():
	EventBus.open_main_menu.emit()
	hide()


func _on_start_new_game_pressed():
	EventBus.game_started.emit()
