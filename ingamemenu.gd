extends CanvasLayer

func _ready():
	$".".get_child(0).hide()
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		$".".get_child(0).show()


func _on_continue_pressed():
	$".".get_child(0).hide()


func _on_backtomenu_pressed():
	get_tree().call_deferred("change_scene_to_file","res://mainmenu.tscn")
