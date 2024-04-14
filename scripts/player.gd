class_name Player
extends CharacterBody3D

@export var bullet_scn : PackedScene = preload('res://projectiles/bullet.tscn')
@export var bell_grenade_scn : PackedScene = preload('res://projectiles/bell_grenade.tscn')
@export var speed = 5.0
@export var camera_speed := 0.001
@export var hitscan_max_distance := 1000
@export var grenade_force := 250

@onready var camera_wrapper = $CameraGunWrapper
@onready var camera = $CameraGunWrapper/Camera
@onready var gun : Gun = $CameraGunWrapper/Gun
@onready var grenade_toss_point = $GrenadeTossPoint
@onready var shot_timer = $ShotTimer
@onready var grenade_timer = $GrenadeTimer

var game_start_position : Vector3


const JUMP_VELOCITY = 4.5
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	EventBus.player_joined.emit(self)
	global_position = game_start_position

func _input(event):
	if event is InputEventMouseMotion:
		transform.basis = Basis(Vector3.UP, -event.relative.x * camera_speed) * transform.basis
		camera_wrapper.transform.basis = Basis(camera_wrapper.transform.basis.x, -event.relative.y * camera_speed) * camera_wrapper.transform.basis
		camera_wrapper.rotation.x = clamp(camera_wrapper.rotation.x, -PI / 4, PI / 4)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("fire"):
		if shot_timer.is_stopped():
			shot_timer.start()
			fire_hitscan()

	if Input.is_action_just_pressed('grenade'):
		if grenade_timer.is_stopped():
			grenade_timer.start()
			throw_grenade()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()


func throw_grenade():
	var g :RigidBody3D = bell_grenade_scn.instantiate()
	get_tree().root.add_child(g)
	g.global_position = grenade_toss_point.global_position
	g.apply_central_force(-camera_basis().z * 2 * grenade_force + camera_basis().y * grenade_force)


func camera_basis() -> Basis:
	return basis * camera_wrapper.basis

func hit_by_bee():
	EventBus.game_over.emit(GameOver.Cause.BEE)

func bell_smash():
	EventBus.game_over.emit(GameOver.Cause.BELL)

func fire_hitscan():
	gun.play_gunshot()

	var space_state = get_world_3d().direct_space_state
	# use global coordinates, not local to node
	var start = camera.global_position
	# need to take into account the player roration and the camera rotation, because they
	# combined are the way the gun is pointing
	var end = camera.global_position + (-(camera_basis()).z * hitscan_max_distance)

	var query = PhysicsRayQueryParameters3D.create(start, end)
	query.collide_with_areas = true
	query.collide_with_bodies = true
	# only collide with layer 2 "enemy"
	var result = space_state.intersect_ray(query)
	if result:
		print_debug(result)
		if result.collider and result.collider.has_method('hit'):
			result.collider.hit(self)

func fire_projectile():
	var bullet : Bullet = bullet_scn.instantiate()

	get_tree().root.add_child(bullet)
	bullet.global_position = gun.muzzle.global_position
	bullet.transform.basis = camera_wrapper.transform.basis * transform.basis
