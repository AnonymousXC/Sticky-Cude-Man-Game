extends Control

onready var global = get_node("/root/Main")
var player_data : float


func _ready() -> void:
	global.health = 100
	global.score = 0

func _on_Gun_pressed() -> void:
	global.gun_state = true
	global.grapple_state = false
	global.granade_state = false


func _on_Grappling_pressed() -> void:
	global.gun_state = false
	global.grapple_state = true
	global.granade_state = false

func _on_Granade_pressed() -> void:
	global.gun_state = false
	global.grapple_state = false
	global.granade_state = true

func _process(delta: float) -> void:
	$ProgressBar.value = global.health
	if global.health < 1 :
		global.life_state = true
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Panel/Label.text = "Kills : " + str(global.score)
	$Sprite/Label.text = str(global.coins)
