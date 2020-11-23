extends "res://Heroes/player.gd"

func _ready():
	MOVEMENT_SPEED = 100
	MAX_ATTACK_CD = 25

func handle_attack(attack_pressed):
	$Attack_collision/Sword_collision.disabled = true
	if attack_pressed:
		attack_cd = MAX_ATTACK_CD
		$AnimatedSprite.play("attack")
		$Attack_collision/Sword_collision.disabled = false
