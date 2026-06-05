extends CanvasLayer

var player = null 
func _on_static_body_3d_2_interacted(body: Variant) -> void:
	$DialogueBox.start()
	body.set_physics_process(false)
	body.set_process_input(false)
	player = body
	
	


func _on_dialogue_box_dialogue_ended() -> void:
	player.set_physics_process(true)
	player.set_process_input(false)
	player = null


func _on_static_body_3d_3_interacted(body: Variant) -> void:
	pass
