extends "res://Heroes/player.gd"

var MAX_HEALTH = 10

func _ready():
	MOVEMENT_SPEED = 100
	MAX_ATTACK_CD = 50
	ATTACK_DAMAGE = 5
	health = MAX_HEALTH

func _physics_process(delta):
	if attack_cd > 0:
		$Attack_collision/Sword_collision.disabled = true
		attack_cd -= 1

func handle_attack(attack_pressed):
	if attack_pressed and attack_cd == 0:
		attack_cd = MAX_ATTACK_CD
		$AnimatedSprite.play("attack")
		$Attack_collision/Sword_collision.disabled = false


func _on_Attack_collision_body_entered(body):
	body.health -= ATTACK_DAMAGE
	if body.health <= 0:
		body.queue_free()
