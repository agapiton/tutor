extends CanvasLayer


func _ready():
	if GlobalVars.last_level=="":
		$MarginContainer/VBoxContainer/continuegame.visible=0
	else:
		$MarginContainer/VBoxContainer/continuegame.visible=1
	
	
func _process(delta):
	$ParallaxBackground.scroll_offset.x+=100*delta
func _on_startgame_pressed():
	GlobalVars.score=0
	GlobalVars.last_level=""
	GlobalVars.save_game()
	get_tree().call_deferred("change_scene_to_file","res://world.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_highscore_pressed():
	get_tree().call_deferred("change_scene_to_file","res://hof.tscn")


func _on_continuegame_pressed():
	get_tree().call_deferred("change_scene_to_file",GlobalVars.last_level)
