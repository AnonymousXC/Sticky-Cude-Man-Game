extends Node2D



func _process(delta: float) -> void:
	position = get_global_mouse_position()
	if Input.is_action_pressed("capture_key"):
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if Input.is_action_pressed("capture_escape_key"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

