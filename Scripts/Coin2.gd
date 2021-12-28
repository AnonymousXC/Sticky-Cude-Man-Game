extends RigidBody2D

onready var global = get_node("/root/Main")
var total_coins = 0
var save_path = "user://coins55.txt"
var data 
var player_data : float 
var all_coins : float

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("hero"):
		global.coins = global.coins + 1
		queue_free()



func _ready() -> void:
	var file2 = File.new()
	var error2 = file2.open(save_path , File.READ)
	if error2 == OK:
		player_data = file2.get_float()
		file2.close()

	var added_coins =  global.coins  + player_data 
	all_coins  = added_coins

	var file = File.new()
	var error = file.open(save_path , File.WRITE)
	if error == OK:
		file.store_float(all_coins)
		file.close()

