extends KinematicBody2D

export var WALK_SPEED = 300
export var MAX_SPEED = 200
export var STOPING_FORCE = 1000

var velocity = Vector2.ZERO
var isAttacking = false

var right = true


func _ready():
	self.position.x = 300
	self.position.y = 400


func _physics_process(delta):
	var attack_pressed = Input.is_action_pressed("attack")
	var walk_left = Input.is_action_pressed("walk_left")
	var walk_up = Input.is_action_pressed("walk_up")
	var walk_right = Input.is_action_pressed("walk_right")
	var walk_down = Input.is_action_pressed("walk_down")
	var walking = walk_down or walk_left or walk_right or walk_up
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	input_vector.y = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, WALK_SPEED * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, STOPING_FORCE * delta)
	
	if walking and !attack_pressed:
		if walk_right:
			if right:
				$AnimatedSprite.flip_h = false
				get_node("Hero_collision").set_scale(Vector2(1,1))
			right = false
		elif walk_left:
			if not right:
				$AnimatedSprite.flip_h = true
				get_node("Hero_collision").set_scale(Vector2(-1,1))
			right = true
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")
		
	if attack_pressed:
		$AnimatedSprite.play("attack")
		isAttacking = true
		$Attack_collision/Sword_collision.disabled = false
		
	move_and_collide(velocity * delta)

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		$Attack_collision/Sword_collision.disabled = true
