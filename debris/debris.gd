extends RigidBody3D

@export var despawn_time := 1.0
@onready var despawn_on_timer = $DespawnOnTimer

func _ready():
	despawn_on_timer.despawn_time = despawn_time
	despawn_on_timer.start()
