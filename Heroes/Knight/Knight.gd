extends "res://Heroes/player.gd"

var ATTACK_FORCE = 5
var MAX_HEALTH = 10
var health = MAX_HEALTH

func _ready():
	MOVEMENT_SPEED = 100
	MAX_ATTACK_CD = 25

func handle_attack(attack_pressed):
	$Attack_collision/Sword_collision.disabled = true
	if attack_pressed:
		attack_cd = MAX_ATTACK_CD
		$AnimatedSprite.play("attack")
		$Attack_collision/Sword_collision.disabled = false


func _on_Attack_collision_body_entered(body):
	body.health -= ATTACK_FORCE
	print(body.health)
	if body.health <= 0:
		body.queue_free()
