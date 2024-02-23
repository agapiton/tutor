extends CanvasLayer

func _ready():
	$".".get_child(0).hide()

func _process(delta):
	if Input.is_action_just_pressed("fd"):
		die_menu_show()


func _on_respawn_pressed():
	$".".get_child(0).hide()
	GlobalVars.score=0
	get_tree().reload_current_scene()

func die_menu_show():
	$WaitTimer.start()
	
	$".".get_child(0).show()
func _on_gotomenu_pressed():
	
	get_tree().call_deferred("change_scene_to_file","res://mainmenu.tscn")


func _on_wait_timer_timeout():
	_on_respawn_pressed()
