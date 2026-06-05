extends RayCast3D
#@onready var playercam = $Node3D/CharacterBody3D/Pivot/Camera3D
#@onready var maccam = $maccam
var cam : Camera3D
@export var pcam : Camera3D
@export var player : CharacterBody3D
@onready var Prompt = $CanvasLayer/Prompt
@export var prompt = Prompt

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
		if detected is Mac:
			#get_tree().change_scene_to_file("res://3d objects/mac.tscn")
			#start game
			#pcam.make_current()
			if Input.is_action_pressed("interact"):
				cam.make_current()
				
			hover()
			
		
	else:
		hoverback()
		
func hover():
	if hovering == 0:
		$CanvasLayer/TextureRect/AnimationPlayer.play("hover")
		hovering += 1
	elif hovering == 1:
		pass
	
func hoverback():
	if hovering == 1:
		$CanvasLayer/TextureRect/AnimationPlayer.play("hoverback")
		hovering -= 1
	elif hovering == 1:
		pass
	
	
	
			
			#if not $CanvasLayer/TextureRect/AnimationPlayer.current_animation == "hover" and not last_animation == "hover":
				#
				#$CanvasLayer/TextureRect/AnimationPlayer.play("hover")
				#last_animation = $CanvasLayer/TextureRect/AnimationPlayer.current_animation
				#if Input.is_action_just_pressed(detected.prompt_action):
					#detected.interact(owner)
		#elif not $CanvasLayer/TextureRect/AnimationPlayer.current_animation == "hoverback" and not last_animation == "hoverback":
			#$CanvasLayer/TextureRect/AnimationPlayer.play("hoverback")
			#last_animation = $CanvasLayer/TextureRect/AnimationPlayer.current_animation
	#elif not $CanvasLayer/TextureRect/AnimationPlayer.current_animation == "hoverback" and not last_animation == "hoverback":
		#$CanvasLayer/TextureRect/AnimationPlayer.play("hoverback")
		#last_animation = $CanvasLayer/TextureRect/AnimationPlayer.current_animation
	
