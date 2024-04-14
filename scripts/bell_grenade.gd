class_name BellGrenade
extends RigidBody3D

@export var bell_scn : PackedScene = preload("res://projectiles/bell.tscn")
@export var beam_scn : PackedScene = preload("res://effects/summoning_beam.tscn")
@export var roll_time := 0.2
@export var body_collision_layer := 4
@export var bell_height_range := Vector2(100, 120)

@onready var despawn_on_timer = $DespawnOnTimer

func _on_body_entered(body):
	if body.collision_layer & body_collision_layer:
		await get_tree().create_timer(roll_time).timeout
		freeze = true
		despawn_on_timer.start()

		var beam := beam_scn.instantiate()
		get_tree().root.add_child(beam)
		beam.global_position = global_position

		var bell := bell_scn.instantiate()
		get_tree().root.add_child(bell)
		bell.global_position = global_position + Vector3.UP * randf_range(bell_height_range.x, bell_height_range.y)

