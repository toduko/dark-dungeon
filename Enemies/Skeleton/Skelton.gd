extends KinematicBody2D

var MAX_HP = 10
var health = MAX_HP
var ATTACK_DAMAGE = 5
var MOVEMENT_SPEED = 20
var target = ""
var direction = 1
var velocity = 0

func _ready():
	 pass

func _physics_process(_delta):
	target = get_parent().get_node_or_null(GlobalVars.player_type)
	if (target != null):
		var distance = target.global_position - global_position
		if distance.x < 0:
			direction = -1
		else:
			direction = 1
		velocity = distance.normalized()
		self.scale.x = self.scale.y * direction
		velocity = move_and_slide(velocity * MOVEMENT_SPEED)

func _on_Attack_area_body_entered(body):
	if body.inv_timer <= 0:
		body.health -= ATTACK_DAMAGE
		body.player_hit = true
		print("hit")
		if body.health <= 0:
			body.queue_free()
	else:
		print("not_hit")
