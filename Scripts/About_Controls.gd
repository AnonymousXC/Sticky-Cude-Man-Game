extends Control




func _on_Button_pressed() -> void:
	get_tree().change_scene_to(load("res://Scenes/Start.tscn"))
