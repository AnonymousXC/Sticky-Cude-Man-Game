extends KinematicBody2D

var bullet = preload("res://Scenes/Hero_Bullet.tscn")
var bullet_speed = 5000
var fire_rate = 0.2
var can_fire = true
onready var global = get_node("/root/Main")

func _physics_process(delta):
	if Input.is_action_pressed("mouse_click") and can_fire == true and global.gun_state == true:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $Node2D.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed,0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true
	if Input.is_action_pressed("shift"):
		Engine.time_scale = 0.3
	else:
		Engine.time_scale = 1

	if Input.is_action_pressed("mouse_click") and global.gun_state == true:
		$AudioStreamPlayer2D.playing = true
	else:
		$AudioStreamPlayer2D.playing = false



func _process(delta: float) -> void:
	if global.gun_type == "Assault_Rifle":
		$Gun.visible = true
		$SMG.visible = false
		$Assault.visible = false

	if global.gun_type == "Smg_Rifle":
		$Gun.visible = false
		$SMG.visible = true
		$Assault.visible = false

	if global.gun_type == "Assault2_Rifle":
		$Gun.visible = false
		$SMG.visible = false
		$Assault.visible = true
