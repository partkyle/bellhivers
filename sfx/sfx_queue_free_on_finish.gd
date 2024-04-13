extends AudioStreamPlayer3D

func _ready():
	connect('finished', queue_free)
