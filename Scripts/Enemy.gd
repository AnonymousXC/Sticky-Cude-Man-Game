extends KinematicBody2D

onready var character = get_node("/root/Base/Basis2/Character")
onready var global = get_node("/root/Main")


func _ready() -> void:
	set_process(true)

func _process(delta: float) -> void:
	position += Vector2.LEFT.rotated(rotation) * 400 * delta
	move_and_slide(Vector2())
	$Gun.look_at(character.position)
	global.can_coin_insta = false

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	set_process(false)
	global.coll_point_x = position.x
	global.coll_point_y = position.y
	if body.is_in_group("bullet"):
		global.can_coin_insta = true
		global.score += 1
		global.highscore += 1
		queue_free()



func _on_Area2D_area_entered(area: Area2D) -> void:
	set_process(false)
	global.coll_point_x = position.x
	global.coll_point_y = position.y
	if area.is_in_group("bullet"):
		global.can_coin_insta = true
		global.score += 1
		global.highscore += 1
		queue_free()
