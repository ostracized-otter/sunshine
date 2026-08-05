extends Node3D
class_name barrier
signal interacted(body)

@export var prompt_message = "Interact"
@export var prompt_action = "interact"

func get_prompt():
	var _key_name = ""
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			_key_name = OS.get_keycode_string(action.keycode)
	return prompt_message + ""
	

func interact(body):
	emit_signal("interacted", body)
