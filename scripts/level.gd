class_name Level
extends Node3D

signal level_complete()

func _on_hive_controller_all_hives_gone():
	level_complete.emit()
