extends KinematicBody2D

var MAX_HP = 10
var health = MAX_HP
var ATTACK_DAMAGE = 5
var velocity = Vector2.ZERO

func _ready():
	pass

func _on_Attack_area_body_entered(body):
	body.health -= ATTACK_DAMAGE
	print(body.health)
	if body.health <= 0:
		body.queue_free()
