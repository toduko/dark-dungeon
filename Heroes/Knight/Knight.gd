extends KinematicBody2D

export var MOVEMENT_SPEED = 100
export var MAX_ATTACK_CD = 25

var isAttacking = false
var attack_cd = 0

var direction = 1


func _ready():
	self.position.x = 300
	self.position.y = 400


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
	
	if attack_pressed:
		walking = false
		attack_cd = MAX_ATTACK_CD
		velocity = Vector2.ZERO
		$AnimatedSprite.play("attack")
		isAttacking = true
		$Attack_collision/Sword_collision.disabled = false
	
	if walking:
		$AnimatedSprite.play("walk")
	elif attack_cd > 0:
		attack_cd -= 1
	else:
		$AnimatedSprite.play("idle")
		
	velocity = move_and_slide(velocity * MOVEMENT_SPEED)

func _on_AnimatedSprite_animation_finished():
		if $AnimatedSprite.animation == "attack":
			$Attack_collision/Sword_collision.disabled = true
			print("attack finished")
