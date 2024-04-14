class_name LevelController
extends Node3D

@export var player_scn : PackedScene = preload('res://bodies/player.tscn')
@export var level_scn : PackedScene = preload('res://scenes/level.tscn')
@export var drop_per_floor := 20
@export var player_initial_position := Vector3(0, 20, 0)

var current_player : Player

var current_floor = 0
var current_level : Level

# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug('connecting to game_started')
	EventBus.game_started.connect(game_started)

func game_started():
	print_debug('game started')
	if current_level:
		current_level.free()
		current_level = null

	if current_player:
		printerr('Player already exists! This should not have happend. What did you do!??!')
		current_player.free()
		current_player = null

	current_floor = 0
	create_level()

	current_player = player_scn.instantiate()
	current_player.game_start_position = player_initial_position
	get_tree().root.add_child.call_deferred(current_player)

func create_level():
	var level = level_scn.instantiate()
	add_child(level)
	level.global_position = global_position + Vector3.DOWN * drop_per_floor * current_floor

	current_floor += 1

	print_debug(' on floor ', current_floor)

	if current_level:
		current_level.destroy()

	current_level = level
	current_level.connect('level_complete', create_level)

