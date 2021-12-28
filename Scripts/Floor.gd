extends StaticBody2D

onready var global = get_node("/root/Main")




func _on_Area2D_area_entered(area: Area2D) -> void:
	global.hook_state = true

func _on_Area2D_area_exited(area: Area2D) -> void:
	global.hook_state = false
