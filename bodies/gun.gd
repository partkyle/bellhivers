class_name Gun
extends Node3D

@export var gunshot_sound_scn := preload('res://sfx/gunshot_sound.tscn')

@onready var muzzle = $Node/muzzle


func play_gunshot():
	var gunshot_sound = gunshot_sound_scn.instantiate()
	get_tree().root.add_child(gunshot_sound)
	gunshot_sound.global_position = muzzle.global_position
