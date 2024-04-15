extends Control

@onready var killed_by_label = $ColorRect/MenuWrapper/Messages/KilledByLabel
@onready var subtext_label = $ColorRect/MenuWrapper/Messages/SubtextLabel
@onready var stats_container = $ColorRect/StatsContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	EventBus.game_started.connect(game_started)
	EventBus.game_over.connect(game_over)

func game_started():
	hide()

func game_over(cause: GameOver.Cause):
	killed_by_label.text = GameOver.cause_to_text(cause)
	subtext_label.text = GameOver.cause_to_text_funny(cause)
	stats_container.update_stats()
	show()



func _on_main_menu_button_pressed():
	EventBus.open_main_menu.emit()
	hide()


func _on_start_new_game_pressed():
	EventBus.game_started.emit()
