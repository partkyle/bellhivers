extends Node3D

@onready var fire = $Fire
@onready var fire_2 = $Fire2
@onready var bullet = $Bullet


func _ready():
	fire.one_shot = true
	fire_2.one_shot = true
	bullet.hide()

func flash():
	fire.emitting = true
	fire_2.emitting = true

	bullet.show()
	await get_tree().create_timer(0.1).timeout
	bullet.hide()
