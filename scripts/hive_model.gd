extends Node3D


@export var debris_scn := preload('res://debris/debris.tscn')

@onready var node = $Node

func destroy():
	for mesh in node.get_children():
		print(mesh.global_position)
		var b = debris_scn.instantiate()
		get_tree().root.add_child(b)
		b.global_position = mesh.global_position
		mesh.reparent(b)
		b.apply_central_force(Vector3(randf_range(-1000, 1000),randf_range(-1000, 1000),randf_range(-1000, 1000)))
