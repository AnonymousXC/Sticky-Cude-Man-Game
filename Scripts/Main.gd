extends Node2D

var grappling_state = true
var hook_state = false
var gun_state = true
var grapple_state = false
var granade_state = false
var location = Vector2()
var health = 50
var life_state = false
var score = 0
var highscore = 0
var character_type = "Square"
var gun_type = "Assault_Rifle"
var firer = true
var coll_point_x = 0
var coll_point_y = 0
var can_coin_insta = false
var coins = 0
var color = Color(1,1,1,1)
var enemy_color = false

func _ready() -> void:
	score = 0
