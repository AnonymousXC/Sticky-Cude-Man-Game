extends Sprite


var bullet = preload("res://Scenes/Enemy_Bullet.tscn")
var bullet_speed = 5000
var fire_rate = .5
var can_fire = true
onready var global = get_node("/root/Main")


func _ready() -> void:
	set_physics_process(false)


func _physics_process(delta):
	if  can_fire == true and global.firer == true:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $Bullet_Position.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed,0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true



func _on_VisibilityNotifier2D_screen_entered() -> void:
	set_physics_process(true)
