class_name BellGrenade
extends RigidBody3D

@export var roll_time := 0.2
@export var body_collision_layer := 4

func _on_body_entered(body):
	if body.collision_layer & body_collision_layer:
		await get_tree().create_timer(roll_time).timeout
		freeze = true

