extends StaticBody3D

class_name Mac

signal interacted(body)

@export var prompt_message = "Interact"
@export var prompt_action = "interact"
@export var cam: Camera3D


func get_prompt():
	var _key_name = ""
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			_key_name = OS.get_keycode_string(action.keycode)
	return prompt_message + ""


func interact(body):
	emit_signal("interacted", body)


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		$RigidBody3D2.linear_velocity.x = -20
		
	
#func _on_flipper_hit(body: Node3D) -> void:
	#if body is RigidBody3D and Input.is_action_pressed("ui_left"):
		#
		#print("Hit")
		#body.apply_impulse(Vector3(-0.6,0,0))
	
		
		#var tween = get_tree().create_tween()
		#tween.tween_property($Node3D, "rotation", Vector3(0, deg_to_rad(-60), 0), 0.02)
	#if Input.is_action_just_released("ui_left"):
		#var tween = get_tree().create_tween()
		#tween.tween_property($Node3D, "rotation", Vector3(0, deg_to_rad(20), 0), 0.1)
