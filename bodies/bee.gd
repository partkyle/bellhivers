extends CharacterBody3D

const EPSILON = 0.01

@export var speed := 4.0

var target : Node3D


func _physics_process(delta):
	if target:
		var direction = target.global_position - global_position
		if direction.length() > EPSILON:
			look_at(target.global_position + direction.normalized())
			velocity = direction.normalized() * speed
		else:
			velocity = Vector3.ZERO
	else:
		velocity = Vector3.ZERO

	move_and_slide()


func hit():
	queue_free()

func bell_smash():
	queue_free()

func _on_player_locator_body_entered(body):
	target = body


func _on_player_locator_body_exited(body):
	target = null
