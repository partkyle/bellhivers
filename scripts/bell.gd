extends RigidBody3D


@export var roll_time := 3
@export var body_collision_layer := 4 + 8

@onready var sfx_timer = $SFXTimer
@onready var despawn_on_timer = $DespawnOnTimer
@onready var audio_stream_player_3d = $AudioStreamPlayer3D



func _on_body_entered(body):
	if not freeze:
		play_bell()

		if body.has_method('bell_smash'):
			body.bell_smash()

	if body.collision_layer & body_collision_layer:
		await get_tree().create_timer(roll_time).timeout
		freeze = true
		despawn_on_timer.start()


func play_bell():
	if sfx_timer.is_stopped():
		sfx_timer.start()
		audio_stream_player_3d.play()

