extends Control


onready var global = get_node("/root/Main")
var Start_scene = load("res://Scenes/Start.tscn")



func _on_Triangle_pressed() -> void:
	global.character_type = "Triangle"


func _on_Circle_pressed() -> void:
	global.character_type = "Circle"


func _on_SmgGun_pressed() -> void:
	global.gun_type = "Smg_Rifle"


func _on_AssualtRifle_pressed() -> void:
	global.gun_type = "Assault2_Rifle"


func _on_Exit_Button_pressed() -> void:
	get_tree().change_scene_to(Start_scene)


func _process(delta: float) -> void:
	global.color = $ColorPicker.color
	$Circle.modulate = $ColorPicker.color
	$Triangle.modulate = $ColorPicker.color

