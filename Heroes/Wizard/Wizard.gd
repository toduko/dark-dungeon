extends "res://Heroes/player.gd"

var MAX_HEALTH = 10
var pixel_attack_scene = load("res://Heroes/Wizard/Wizard_pixel.tscn")

func _ready():
	MOVEMENT_SPEED = 100
	MAX_ATTACK_CD = 20
	health = MAX_HEALTH
	
func handle_attack(attack_pressed):
	if attack_pressed:
		attack_cd = MAX_ATTACK_CD
		$AnimatedSprite.play("attack")
		var pixel_attack = pixel_attack_scene.instance()
		pixel_attack.position.x = 500
		pixel_attack.position.y = 300
		get_tree().get_root().call_deferred("add_child", pixel_attack)
