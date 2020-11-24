extends Node2D

func spawn_skeleton():
	var random_number = RandomNumberGenerator.new()
	
	var screen_size = get_viewport().get_visible_rect().size
	
	var skeleton_scene = load("res://Enemies/Skeleton/Skelton.tscn")
	var skeleton_instance = skeleton_scene.instance()
	random_number.randomize()
	var x = random_number.randf_range(0, screen_size.x - 50)
	random_number.randomize()
	var y = random_number.randf_range(0, screen_size.y - 50)
	skeleton_instance.position.x = x
	skeleton_instance.position.y = y
	get_tree().get_root().call_deferred("add_child", skeleton_instance)

func _ready():
	for i in range(0, 5):
		spawn_skeleton()
