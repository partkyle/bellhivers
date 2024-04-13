class_name Gun
extends Node3D

@onready var muzzle = $Node/muzzle
@onready var audio_stream_player = $AudioStreamPlayer

func play_gunshot():
	audio_stream_player.play()
