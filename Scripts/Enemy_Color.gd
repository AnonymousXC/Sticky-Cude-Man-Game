extends Node2D

onready var global = get_node("/root/Main")
var color1 : float
var color2 : float
var color3 : float
var alpha : float = 1

func _ready() -> void:
	if global.enemy_color == true:
		randomize()
		color1 = rand_range(.3, 1)
		color2 = rand_range(.3, 1)
		color3 = rand_range(.3, 1)
		$Sprite.self_modulate = Color(color1 , color2 , color3 , alpha)
