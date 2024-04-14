extends Node

@export var despawn_time := 5.0
@export var sink_time := 5.0
@export var height := 1.0
@export var autostart := false

@onready var timer = $Timer

func start():
	timer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = despawn_time
	if autostart:
		timer.start()

func _on_timer_timeout():
	var tween := get_tree().create_tween()
	tween.tween_method(sink, 0.0, 1.0, sink_time).connect('finished', func(): get_parent().queue_free())


func sink(value: float):
	get_parent().global_position.y -= value * height
