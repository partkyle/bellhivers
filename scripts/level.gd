class_name Level
extends Node3D

var current_floor := 1
var initial_position : Vector3

func _ready():
	global_position = initial_position
