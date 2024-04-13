class_name Bullet
extends Area3D

var speed := 1


func _physics_process(delta):
	global_position += -transform.basis.z * speed * delta


func _on_body_entered(body):
	body.queue_free()
	queue_free()


func _on_free_timer_timeout():
	queue_free()
