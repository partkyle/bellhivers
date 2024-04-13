extends Node3D

@export var bee : PackedScene
@export var spawnTimer := 1.0
@export var enemy_container : Node3D
@export var face_target : Node3D
@export var bee_count := 50
@export var spawn_radius := Vector2(-5, 5)

@onready var spawn_timer = $SpawnTimer

var count = 0

func _ready():
	spawn_timer.wait_time = spawnTimer
	if not enemy_container:
		enemy_container = self

func _process(delta):
	if face_target:
		look_at(face_target.global_position)

func _spawn():
	var b = bee.instantiate()
	enemy_container.add_child(b)
	b.global_position = global_position + Vector3(randf_range(spawn_radius.x, spawn_radius.y), 0, randf_range(spawn_radius.x, spawn_radius.y))
	b.transform.basis = transform.basis

func _on_spawn_timer_timeout():
	if count < bee_count:
		count += 1
		_spawn()

func bell_smash():
	queue_free()
