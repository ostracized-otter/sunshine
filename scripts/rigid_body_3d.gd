extends RigidBody3D






func _on_area_3d_body_entered(body: Node3D) -> void:
	# Puts ball back in launcher if hit down hole
	if body == self:
		# Test one (spawn above flipper)
		# A position = Vector3(1.508, 1.522, 0.521)
		# Real one
		position = Vector3(1.825, 1.522, 0.006)
		
