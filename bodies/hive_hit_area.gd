extends StaticBody3D


func hit():
	print("HIVE can't be shot this way yet")


func bell_smash():
	get_parent().queue_free()