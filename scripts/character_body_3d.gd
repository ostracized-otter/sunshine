extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var mac: StaticBody3D
@onready var Pivot := $Pivot
@onready var Camera := $Pivot/Camera3D
@onready var Raycast = $Pivot/Camera3D/RayCast3D
@onready var VBoxContainer1 := $VBoxContainer
@onready var VBoxContainer2 := $VBoxContainer2


func _unhandled_input(event: InputEvent) -> void:
	# Grab and un-grab mouse based on input
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		# Hide menu
		VBoxContainer1.visible = false
		VBoxContainer2.visible = false
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		# Show menu
		VBoxContainer1.visible = true
		VBoxContainer2.visible = true
		
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			Pivot.rotate_y(-event.relative.x * 0.01)
			Camera.rotate_x(-event.relative.y * 0.01)
			Camera.rotation.x = clamp(Camera.rotation.x, deg_to_rad(-90), deg_to_rad(60))
 

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Input for walking etc
	var input_dir := Input.get_vector("a", "d", "w", "s")
	var direction = (Pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _on_button_pressed() -> void:
	get_tree().quit()
