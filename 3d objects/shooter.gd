extends Node3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	# Shoots ball to start game
	if body is RigidBody3D:
		body.apply_impulse(Vector3(randf_range(-1,-1.5),0,0))
		print("b")
	
