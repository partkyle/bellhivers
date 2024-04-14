extends CharacterBody3D

const EPSILON = 0.1

@export var speed := 4.0
@export var patrol_range := Vector2(-5, 5)
@export var notify_community_delay := 1.0

@onready var bee_model = $bee_model
@onready var patrol_timer = $PatrolTimer
@onready var enemy_community = $enemy_community
@onready var aggro_alert = $AggroAlert

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


func hit(attacker: Node3D):
	bee_model.destroy()
	for e in enemy_community.get_overlapping_bodies():
		e.acquire_target(attacker)
	queue_free()

func bell_smash():
	bee_model.destroy()
	queue_free()

func _on_player_locator_body_entered(body):
	patrol_timer.stop()
	acquire_target(body)

func acquire_target(t: Node3D):
	target = t
	aggro_alert.play()

func _on_player_locator_body_exited(body):
	target = null


func set_patrol_position():
	patrol_position = initial_position + Vector3(randf_range(patrol_range.x, patrol_range.y),
												 randf_range(patrol_range.x, patrol_range.y),
												 randf_range(patrol_range.x, patrol_range.y))

func _on_patrol_timer_timeout():
	set_patrol_position()


func _on_player_damage_body_entered(body):
	if body.has_method('hit_by_bee'):
		body.hit_by_bee()
