class_name HivesController
extends Node3D

signal all_hives_gone()

@export var hive_scn : PackedScene = preload('res://bodies/hive.tscn')
@export var hive_spawn_range := Vector2(-20, 20)

@onready var enemy_container = $"../EnemyContainer"

var hives_to_spanwn := 3
var hives_left := 0

func _ready():
	for i in hives_to_spanwn:
		var hive = hive_scn.instantiate()
		hive.enemy_container = enemy_container
		add_child(hive)
		hive.transform.origin = Vector3(randf_range(hive_spawn_range.x, hive_spawn_range.y), 0, randf_range(hive_spawn_range.x, hive_spawn_range.y))

func _on_child_entered_tree(node):
	hives_left += 1

func _on_child_exiting_tree(node):
	hives_left -= 1

	if hives_left <= 0:
		all_hives_gone.emit()
