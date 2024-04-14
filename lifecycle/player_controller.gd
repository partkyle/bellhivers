extends Node3D

var player_scn := preload('res://bodies/player.tscn')

var current_player : Player

# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.game_started.connect(spawn_player)


func spawn_player():
	if current_player != null:
		printerr('Player already exists! This should not have happend. What did you do!??!')
		current_player.queue_free()

	current_player = player_scn.instantiate()
	add_child(current_player)
