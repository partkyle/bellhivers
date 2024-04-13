extends CharacterBody3D

@onready var camera = $CameraGunWrapper

const SPEED = 5.0
@export var camera_speed := 0.001


func _input(event):
	if event is InputEventMouseMotion:
		transform.basis = Basis(Vector3.UP, -event.relative.x * camera_speed) * transform.basis
		camera.transform.basis = Basis(camera.transform.basis.x, -event.relative.y * camera_speed) * camera.transform.basis


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
