extends Node2D

onready var global = get_node("/root/Main")
var location = Vector2.ZERO
onready var scene = preload("res://Scenes/Coin.tscn")


func _process(delta: float) -> void:
	if global.can_coin_insta == true:
		location.x = global.coll_point_x
		location.y = global.coll_point_y
		var insta = scene.instance()
		insta.position = location
		add_child(insta)
