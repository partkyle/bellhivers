class_name LevelWrapper
extends Node3D

@export var level_scn : PackedScene = preload('res://scenes/level.tscn')
@export var drop_per_floor := 10

var current_floor = 0
var current_level : Level

# Called when the node enters the scene tree for the first time.
func _ready():
	create_level()

func create_level():
	var level = level_scn.instantiate()
	add_child(level)
	level.global_position = global_position + Vector3.DOWN * drop_per_floor * current_floor

	current_floor += 1

	print(current_floor)

	if current_level:
		current_level.queue_free()

	current_level = level
	current_level.connect('level_complete', create_level)

