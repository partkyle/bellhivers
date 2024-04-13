extends Label

@export var thing : HivesController


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Hives Left: %d" % thing.hives_left
