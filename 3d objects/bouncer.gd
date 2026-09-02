extends Node3D



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		body.apply_impulse(Vector3(randf_range(-0.8,-0.1),0,randf_range(-0.4,0.4)))
		
