extends Node3D

@export var debris_scn := preload('res://debris/debris.tscn')

@onready var meshes = [
	$Node/bee/head,
	$Node/bee/body/abdomen,
	$Node/bee/body/thorax,
	$Node/bee/body/stringer,
	$Node/bee/wings/left_wing,
	$Node/bee/wings/right_wing,
	$Node/bee/legs/right_legs/right_front_leg,
	$Node/bee/legs/right_legs/right_middle_leg,
	$Node/bee/legs/right_legs/right_back_leg,
	$Node/bee/legs/left_legs/left_front_leg,
	$Node/bee/legs/left_legs/left_middle_leg,
	$Node/bee/legs/left_legs/left_back_leg,
]

func destroy():
	for mesh in meshes:
		print(mesh.global_position)
		var b = debris_scn.instantiate()
		get_tree().root.add_child(b)
		b.global_position = mesh.global_position
		mesh.reparent(b)
		b.apply_central_force(Vector3(randf_range(-1000, 1000),randf_range(-1000, 1000),randf_range(-1000, 1000)))
