class_name Level
extends Node3D

var current_floor := 1

func destroy():
	queue_free()
