extends Node2D

onready  var character = get_node("Character")
var location = Vector2()
var enemy_scene = preload("res://Scenes/Enemy.tscn")
onready var timer = $Timer
var enemy_spawn_time = 0.7
var score_file = "user://score.txt"
onready var global = get_node("/root/Main")
var file = File.new()
var highscore : float
var last_score : float = 0


func _ready() -> void:
	$Character.position = $hero_position.position
	load_score()
	last_score = highscore



func _process(delta: float) -> void:
	if timer.is_stopped():
		timer.start(enemy_spawn_time) 
		randomize()
		location.x = rand_range(character.position.x + 3000 , character.position.x + 6500)
		location.y = rand_range(-128 , 800)
		var enemy_insta = enemy_scene.instance()
		enemy_insta.position = location
		add_child(enemy_insta)

	save_score()
	var added_score = last_score  + global.score
	highscore = added_score

func save_score():
	file = File.new()
	file.open(score_file, File.READ)
	file.open(score_file, File.WRITE)
	file.store_float(highscore)
	file.close()




func load_score():
	if file.file_exists(score_file):
		file.open(score_file, File.READ)
		highscore = file.get_float()
		file.close()
#	else:
#		highscore = 0
