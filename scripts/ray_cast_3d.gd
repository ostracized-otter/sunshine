extends RayCast3D

@onready var Prompt = $Prompt
@export var prompt = Prompt
func _ready():
	pass
	
func _physics_process(_delta):
	Prompt.text = ""
	if is_colliding():
		var detected = get_collider()
		
		if detected is Interact:
			Prompt.text = detected.get_prompt()
			
			if Input.is_action_just_pressed(detected.prompt_action):
				detected.interact(owner)
		
	
