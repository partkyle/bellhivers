extends Node

func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.pressed:
			EventBus.open_main_menu.emit()
		if event.keycode == KEY_F1 and event.pressed:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE if Input.mouse_mode else Input.MOUSE_MODE_CAPTURED)
		if event.keycode == KEY_F2 and event.pressed:
			EventBus.game_over.emit()

