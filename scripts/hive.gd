extends Node3D

@export var bee : PackedScene
@export var spawnTimer := 1.0
@export var enemy_container : Node3D

@onready var spawn_timer = $SpawnTimer

func _ready():
	spawn_timer.wait_time = spawnTimer
	if not enemy_container:
		enemy_container = self

func _spawn():
	var b = bee.instantiate()
	enemy_container.add_child(b)
	b.transform.origin = Vector3.ZERO
	b.transform.basis = Basis.IDENTITY

func _on_spawn_timer_timeout():
	_spawn()
