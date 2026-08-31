extends Node3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		body.apply_impulse(Vector3(0,0,30))
		print("bazinga")
	
