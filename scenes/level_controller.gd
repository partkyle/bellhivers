class_name LevelController
extends Node3D

var player_scn : PackedScene = preload('res://bodies/player.tscn')
var level_scn : PackedScene = preload('res://scenes/level.tscn')
@export var drop_per_floor := 20
@export var player_initial_position := Vector3(0, 20, 0)

var current_player : Player

var current_floor = 0
var current_level : Level

# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.game_started.connect(game_started)
	EventBus.level_complete.connect(next_level)

func game_started():
	if current_level:
		current_level.free()
		current_level = null

	if current_player:
		current_player.free()
		current_player = null

	current_floor = 0
	next_level()

	current_player = player_scn.instantiate()
	current_player.game_start_position = player_initial_position
	get_tree().root.add_child.call_deferred(current_player)

func next_level():
	var level = level_scn.instantiate()
	level.current_floor = current_floor
	level.initial_position = global_position + Vector3.DOWN * drop_per_floor * current_floor
	add_child.call_deferred(level)

	current_floor += 1

	if current_level:
		current_level.queue_free()

	current_level = level
