extends CharacterBody3D

const EPSILON = 0.1

@export var speed := 4.0
@export var patrol_range := Vector2(-5, 5)

@onready var bee_model = $bee_model
@onready var patrol_timer = $PatrolTimer

var initial_position : Vector3
var patrol_position : Vector3

var target : Node3D

func setup(_basis : Basis, _global_position : Vector3):
	basis = _basis
	global_position = _global_position
	initial_position = _global_position
	set_patrol_position()


func desired_movement_position():
	if target:
		return target.global_position
	else:
		return patrol_position

func _physics_process(delta):
	var direction = desired_movement_position() - global_position
	if direction.length() > EPSILON:
		velocity = direction.normalized() * speed
		look_at(global_position + velocity)
	else:
		velocity = Vector3.ZERO

	move_and_slide()


func hit():
	destroy()

func bell_smash():
	queue_free()

func _on_player_locator_body_entered(body):
	patrol_timer.stop()
	target = body


func _on_player_locator_body_exited(body):
	target = null


func destroy():
	bee_model.destroy()
	queue_free()


func set_patrol_position():
	patrol_position = initial_position + Vector3(randf_range(patrol_range.x, patrol_range.y),
												 randf_range(patrol_range.x, patrol_range.y),
												 randf_range(patrol_range.x, patrol_range.y))

func _on_patrol_timer_timeout():
	set_patrol_position()
