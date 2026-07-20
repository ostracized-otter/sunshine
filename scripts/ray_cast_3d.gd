extends RayCast3D
var cam : Camera3D
@export var pcam : Camera3D
@export var player : CharacterBody3D
@onready var Prompt = $CanvasLayer/Prompt
@export var prompt = Prompt

var ingame = 0
var last_animation: String
var hovering = 0

func _ready():
	cam = player.mac.cam
	
func _physics_process(_delta):
	Prompt.text = ""
	if is_colliding():
		var detected = get_collider()
		
		if detected is Interact:
			
			Prompt.text = detected.get_prompt()
			hover()
		if detected is test:
			hover()
			if Input.is_action_pressed("interact"):
				pass
		if detected is door:
			hover()
		if detected is Mac:

			if Input.is_action_pressed("interact"):
				cam.make_current()
				ingame = 1
				$CanvasLayer/TextureRect/AnimationPlayer.play("hoverback")
				
				
				
			hover()
			
		
	else:
		hoverback()
	if Input.is_action_pressed("quit"):
		pcam.make_current()
		ingame = 0
	
func hover():
	if hovering == 0 and ingame == 0:
		$CanvasLayer/TextureRect/AnimationPlayer.play("hover")
		hovering += 1
	elif hovering == 1:
		pass
	
func hoverback():
	if hovering == 1 and ingame == 0:
		$CanvasLayer/TextureRect/AnimationPlayer.play("hoverback")
		hovering -= 1
	elif hovering == 1:
		pass
	
