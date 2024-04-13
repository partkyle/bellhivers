class_name HivesController
extends Node3D

signal all_hives_gone()

var hives_left := 0

func _on_child_entered_tree(node):
	hives_left += 1

func _on_child_exiting_tree(node):
	hives_left -= 1

	if hives_left <= 0:
		all_hives_gone.emit()
