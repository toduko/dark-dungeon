extends Control


func _ready():
	pass # Replace with function body.


func _on_Knight_pressed():
	var knight_scene = load("res://Heroes/Knight/Knight.tscn")
	var knight = knight_scene.instance()
	knight.position.x = 400
	knight.position.y = 300
	get_tree().get_root().call_deferred("add_child", knight)
	
	get_tree().change_scene("res://MainScene.tscn")


func _on_Wizard_pressed():
	var wizard_scene = load("res://Heroes/Wizard/Wizard.tscn")
	var wizard = wizard_scene.instance()
	wizard.position.x = 400
	wizard.position.y = 300
	get_tree().get_root().call_deferred("add_child", wizard)
	
	get_tree().change_scene("res://MainScene.tscn")


func _on_Exit_pressed():
	get_tree().quit()
