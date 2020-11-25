extends "res://Heroes/player.gd"

var MAX_HEALTH = 10
var health = MAX_HEALTH

func _ready():
	MOVEMENT_SPEED = 100
	MAX_ATTACK_CD = 20
	
func handle_attack(attack_pressed):
	if attack_pressed:
		attack_cd = MAX_ATTACK_CD
		$AnimatedSprite.play("attack")
