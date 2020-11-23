extends KinematicBody2D

func skeleton_spawner():
	var random_number = RandomNumberGenerator.new()
	var skeleton_scene = load("res://Enemies/Skeleton/Skelton.tscn")

	var screen_size = get_viewport().get_visible_rect().size

	var skeleton_instance = skeleton_scene.instance()
	random_number.randomize()
	var x = random_number.randf_range(0, screen_size.x)
	random_number.randomize()
	var y = random_number.randf_range(0, screen_size.y)
	skeleton_instance.position.x = x
	skeleton_instance.position.y = y


func _ready():
	for i in range(0, 5):
		skeleton_spawner()
