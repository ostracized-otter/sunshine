extends RigidBody3D



func _on_body_entered(body: Node) -> void:
   
	if is_in_group("balla"):
		print("g")
	
