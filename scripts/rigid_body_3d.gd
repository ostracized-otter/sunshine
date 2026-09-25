extends RigidBody3D






func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == self:
		#test one (spawn above flipper)
		position = Vector3(1.508, 1.522, 0.521)
		#real one
		#position = Vector3(1.825, 1.522, 0.006)
		
