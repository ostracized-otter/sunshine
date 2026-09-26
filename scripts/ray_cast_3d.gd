extends RayCast3D
var cam : Camera3D
@export var pcam : Camera3D
@export var player : CharacterBody3D
@onready var Prompt = $CanvasLayer/Prompt
@export var prompt = Prompt

var ingame = 0
var last_animation: String
var hovering = 0
var delay = 0


func _ready():
	# Set default scene camera 
	cam = player.mac.cam
	
	
func _physics_process(_delta):
	Prompt.text = ""
	# Most of this just checks for stuff like doors and other interactive 
	# Stuff and teleports or whatever it is specified
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
			if Input.is_action_pressed("interact"):
				get_tree().change_scene_to_file("res://areas/h1.tscn")
		if detected is barrier:
			hover()
			if Input.is_action_pressed("interact"):
				get_tree().change_scene_to_file("res://areas/h2.tscn")
		if detected is button:
			hover()
			if Input.is_action_pressed("interact"):
				if delay == 0:
					# 'Save' the game (you just lost the game)
					var spath = "user://sav.json"
					var sav = {
						"remamining_brain_cells": 8,
						}
					print(sav)
					var file = FileAccess.open(spath, FileAccess.WRITE)
					var json_string = JSON.stringify(sav)
					file.store_line(json_string)
					delay = 1
					await get_tree().create_timer(1.0).timeout
					delay = 0
					
				
			
				
		# Switch the camera to the pinball machine
		if detected is Mac:

			if Input.is_action_pressed("interact"):
				cam.make_current()
				ingame = 1
				$CanvasLayer/TextureRect/AnimationPlayer.play("hoverback")
				
				
				
			hover()
			
		
	else:
		hoverback()
	# Change camera back to player
	if Input.is_action_pressed("quit"):
		pcam.make_current()
		ingame = 0
	
# Next 2 fuctions check if player is looking at something they can 
# Interact with and show an indicator that they can interact
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
	
