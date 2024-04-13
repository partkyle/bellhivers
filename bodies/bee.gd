extends Node3D

const EPSILON = 0.01

@export var speed := 4.0

var target : Node3D


func _process(delta):
	if target:
		var direction =  target.global_position - global_position
		if direction.length() > EPSILON:
			look_at(target.global_position + direction.normalized())
			global_position += direction.normalized() * speed * delta


func _on_player_locator_body_entered(body):
	target = body


func _on_player_locator_body_exited(body):
	target = null
