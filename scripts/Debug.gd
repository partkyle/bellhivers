extends Node3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.pressed:
			get_tree().quit()
		if event.keycode == KEY_F1 and event.pressed:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE if Input.mouse_mode else Input.MOUSE_MODE_CAPTURED )
