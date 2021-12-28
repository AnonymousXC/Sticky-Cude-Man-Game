extends Control

onready var global = get_node("/root/Main")

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if global.life_state == true:
		visible = true
	else:
		visible = false



func _on_Restart_pressed() -> void:
	global.life_state = false
	get_tree().reload_current_scene()
	get_tree().paused = false
	


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Shop_pressed() -> void:
	get_tree().change_scene_to(load("res://Scenes/Shop.tscn"))
