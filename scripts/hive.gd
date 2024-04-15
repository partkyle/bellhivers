extends Node3D

@export var bee : PackedScene
@export var spawnTimer := 1.0
@export var bee_count := 50
@export var spawn_radius := Vector2(-5, 5)
@export var spawn_radius_vertical := Vector2(0, 5)


@onready var spawn_timer = $SpawnTimer
@onready var hive_model = $hive_model

var enemy_container : Node
var face_target : Player

var count = 0

func _ready():
	spawn_timer.wait_time = spawnTimer

func _process(_delta):
	if not face_target:
		face_target = get_tree().get_first_node_in_group("player")

	if face_target:
		look_at(face_target.global_position)
		# hacky, but this is at least not weird looking
		rotation.x = 0
		rotation.z = 0


func _spawn():
	var b = bee.instantiate()
	enemy_container.add_child(b)
	b.setup(transform.basis,
			global_position + Vector3(randf_range(spawn_radius.x, spawn_radius.y),
												  randf_range(spawn_radius_vertical.x, spawn_radius_vertical.y),
												  randf_range(spawn_radius.x, spawn_radius.y)))

func _on_spawn_timer_timeout():
	if count < bee_count:
		count += 1
		_spawn()


func destroy():
	Stats.hives_destroyed += 1
	get_parent().bell_destroyed()
	hive_model.destroy()
	queue_free()
