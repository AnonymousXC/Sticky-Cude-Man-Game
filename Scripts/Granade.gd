extends RigidBody2D

var granade = load("res://Scenes/Granade.tscn")
var granade_speed = 5000
var granade_rate = 0.1
var can_fire = true
onready var global = get_node("/root/Main")
var granade_sound = true 


func _on_Area2D2_body_entered(body: Node) -> void:
	if granade_sound == true:
		$AudioStreamPlayer2D.playing = true
	else:
		$AudioStreamPlayer2D.playing = false

	$Particles2D.emitting = true
	yield(get_tree().create_timer(3), "timeout")
	queue_free()


func _on_Granade_body_entered(body: Node) -> void:
	if granade_sound == true:
		$AudioStreamPlayer2D.playing = true
	else:
		$AudioStreamPlayer2D.playing = false

	$Particles2D.emitting = true
	yield(get_tree().create_timer(3), "timeout")
	queue_free()



func _physics_process(delta):
	if global.granade_state == true:
		$Sprite.visible = true
		$Particles2D.visible = true
	else:
		$Sprite.visible = false
		$Particles2D.visible = false
		queue_free()


