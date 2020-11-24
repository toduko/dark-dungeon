extends "res://Heroes/player.gd"

var ATTACK_FORCE = 5

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
	body.hp -= ATTACK_FORCE
	print(body.hp)
	if body.hp <= 0:
		body.queue_free()
