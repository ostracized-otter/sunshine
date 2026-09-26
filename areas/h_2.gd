extends Node3D
@onready var Lights = $Node3D


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == $Node3D3:
		_light_on()


func _light_on():
	# Turns each light on based on order (after player goes through _light_on function)
	for child in Lights.get_children():
		if "visible" in child:
			await get_tree().create_timer(1.2).timeout
			child.visible = true
			print("waw")
