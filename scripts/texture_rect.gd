extends TextureRect

# Script for showing indicator that interaction is possible

# Destination and origin places for indicator
@export var slide_in_position := Vector2(200, 200) 
@onready var hidden_position := Vector2(200, -500)

func _ready() -> void:
	position = hidden_position
	slide_onscreen()

func slide_onscreen() -> void:
	# Msove indicator onscreen
	var tween := create_tween()
	tween.tween_property(self, "position", slide_in_position, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
