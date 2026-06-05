extends TextureRect

# Define target position
@export var slide_in_position := Vector2(200, 200) 
# Define starting position (hidden offscreen, e.g., above)
@onready var hidden_position := Vector2(200, -500)

func _ready() -> void:
	# Start offscreen
	position = hidden_position
	# Play the slide-in animation
	slide_onscreen()

func slide_onscreen() -> void:
	var tween := create_tween()
	# Tween the position property
	tween.tween_property(self, "position", slide_in_position, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
