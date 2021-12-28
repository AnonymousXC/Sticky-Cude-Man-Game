extends Control


var start_scene = load("res://Scenes/Main.tscn")
onready var global = get_node("/root/Main")
var save_path = "user://coins55.txt"
var player_coin
var score_file = "user://score.txt"
var player_score
var shop_scene = load("res://Scenes/Shop.tscn")


func _on_Button_pressed() -> void:
	get_tree().change_scene_to(start_scene)


func _on_Button3_pressed() -> void:
	get_tree().quit()

func _process(delta: float) -> void:
	var file2 = File.new()
	var error2 = file2.open(save_path , File.READ)
	if error2 == OK:
		player_coin = file2.get_float()
		file2.close()

	$Label.text = str(player_coin)

	var file = File.new()
	var error = file.open(score_file , File.READ)
	if error == OK:
		player_score = file.get_float()
		file.close()
	$"Total Kills".text = "Total Kills : " + str(player_score)

	if $Label.text == "Null":
		$Label.text = "0"
	if player_score == null :
		$"Total Kills".text = "Total Kills : " + "0"

func _on_Button2_pressed() -> void:
	get_tree().change_scene_to(shop_scene)


func _on_Enemy_Color_pressed() -> void:
	global.enemy_color = true


func _on_Button4_pressed() -> void:
	get_tree().change_scene_to(load("res://Scenes/About.tscn"))
