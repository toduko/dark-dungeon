extends KinematicBody2D

var MOVEMENT_SPEED = 0
var MAX_ATTACK_CD = 0
var ATTACK_DAMAGE = 0
var attack_cd = 0
var direction = 1
var health = 0
var MAX_INV_TIMER = 200
var inv_timer = 0
var player_hit = false


func _ready():
	pass

func _physics_process(_delta):
	var velocity = Vector2()
	var attack_pressed = Input.is_action_pressed("attack")
	var walk_left = Input.is_action_pressed("walk_left")
	var walk_up = Input.is_action_pressed("walk_up")
	var walk_right = Input.is_action_pressed("walk_right")
	var walk_down = Input.is_action_pressed("walk_down")
	var walking = walk_down or walk_left or walk_right or walk_up
	
	if walk_left:
		velocity += Vector2(-1, 0)	
		direction = -1
	if walk_right:
		velocity += Vector2(1, 0)	
		direction = 1
	if walk_up:
		velocity += Vector2(0, -1)
	if walk_down:
		velocity += Vector2(0, 1)
		
	self.scale.x = self.scale.y * direction
	
	if attack_cd == 0:
		handle_attack(attack_pressed)
	if attack_cd > 0:
		attack_cd -= 1
		velocity = Vector2.ZERO
		walking = false
	elif walking:
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")
	
	
	if inv_timer > 0:
		inv_timer -= 1
	
	if player_hit:
		inv_timer = MAX_INV_TIMER
		player_hit = false
	
	velocity = move_and_slide(velocity * MOVEMENT_SPEED)
	

func handle_attack(attack_pressed):
	pass
