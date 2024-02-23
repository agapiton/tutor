extends Node2D



func _ready():
	$Label2.text=str(GlobalVars.score)


func _on_button_pressed():
	get_tree().call_deferred("change_scene_to_file","res://mainmenu.tscn")
