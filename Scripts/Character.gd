extends KinematicBody2D

onready var ray = get_node("RayCast2D")
var speed_grapple = 1
var last_roto = 2000
var movement
onready var global = get_node("/root/Main")
var collision_point 
var line_roto = 0
var can_fire =true
var granade = preload("res://Scenes/Granade.tscn")
var dis = 0

func _ready() -> void:
	if global.character_type == "Square":
		$Sprite.visible = true
		$Triangle.visible = false
		$Circle.visible = false
	if global.character_type == "Triangle":
		$Triangle.visible = true
		$Sprite.visible = false
		$Circle.visible = false
	if global.character_type == "Circle":
		$Circle.visible = true
		$Triangle.visible = false
		$Sprite.visible = false


func _process(delta: float) -> void:
	_grappling_hook()
	_gun_switch()
	_rotation_guns()
	_granade_shoot()
	$Triangle.modulate = global.color
	$Sprite.modulate = global.color
	$Circle.modulate = global.color

	if global.grapple_state == false: 
		position += Vector2.RIGHT.rotated(rotation) * 500 * delta
		move_and_slide(Vector2())

	if global.grapple_state == false and Input.is_action_pressed("ui_up"): 
		position += Vector2.UP.rotated(rotation) * 1800 * delta
		move_and_slide(Vector2())

	if global.grapple_state == false:
		position += Vector2.DOWN.rotated(rotation) * 800 * delta
		move_and_slide(Vector2())
	if global.health < 0:
		global.health = 0


func _grappling_hook():
	if global.grapple_state == true:
		collision_point = ray.get_collision_point()
		if Input.is_action_just_released("mouse_click") and global.hook_state == true:
			last_roto = rad2deg(position.angle_to_point(get_global_mouse_position()))
		ray.rotation_degrees = last_roto
		movement = position.direction_to(collision_point) * speed_grapple
		movement = move_and_slide(movement)
		dis = position.distance_to(collision_point)
		speed_grapple = dis * 4
		if Input.is_action_pressed("mouse_click") and global.hook_state == true:
			$Line2D.visible = true
		elif Input.is_action_just_released("mouse_click"):
			yield(get_tree().create_timer(1) ,"timeout")
			$Line2D.visible = false
		if Input.is_action_pressed("mouse_click"):
			line_roto = rad2deg(position.angle_to_point(get_global_mouse_position())) + 180
		$Line2D.rotation_degrees = line_roto 
	if global.grapple_state == false:
		$Line2D.visible = false


func _gun_switch():
	if global.grapple_state == true:
		$Sprite2.visible = true
	else:
		$Sprite2.visible = false
	if global.gun_state == true:
		$Gun.visible = true
	else:
		$Gun.visible = false






func _rotation_guns():
	$Gun.rotation_degrees = rad2deg(position.angle_to_point(get_global_mouse_position())) + 180
	$Sprite2.rotation_degrees = rad2deg(position.angle_to_point(get_global_mouse_position())) + 180
	$Node2D.look_at(get_global_mouse_position())





func _granade_shoot():
	if Input.is_action_pressed("mouse_click") and can_fire == true and global.granade_state == true:
		var bullet_instance = granade.instance()
		bullet_instance.position = $Node2D.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(100,1000).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(1),"timeout")
		can_fire = true



func _on_Area2D_body_entered(body: Node) -> void:
	global.health = global.health - 3
