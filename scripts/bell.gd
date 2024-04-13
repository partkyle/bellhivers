extends RigidBody3D


@export var roll_time := 3
@export var body_collision_layer := 4 + 8

@onready var bell_sound_scn = preload('res://sfx/bell_sound.tscn')
@onready var sfx_timer = $SFXTimer


func _on_body_entered(body):
	if not freeze:
		play_bell()

		if body.has_method('bell_smash'):
			body.bell_smash()

	if body.collision_layer & body_collision_layer:
		await get_tree().create_timer(roll_time).timeout
		freeze = true


func play_bell():
	if sfx_timer.is_stopped():
		sfx_timer.start()
		var snd = bell_sound_scn.instantiate()
		get_tree().root.add_child(snd)
		snd.global_position = global_position
