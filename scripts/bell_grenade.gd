class_name BellGrenade
extends RigidBody3D

@export var bell : PackedScene = preload("res://projectiles/bell.tscn")
@export var roll_time := 0.2
@export var body_collision_layer := 4

@onready var despawn_on_timer = $DespawnOnTimer

func _on_body_entered(body):
	if body.collision_layer & body_collision_layer:
		await get_tree().create_timer(roll_time).timeout
		freeze = true
		despawn_on_timer.start()

		var b = bell.instantiate()
		get_tree().root.add_child(b)
		b.global_position = global_position + Vector3.UP * 100

