extends CanvasLayer


func _ready():
	$MarginContainer/VBoxContainer/Label.text=str(GlobalVars.score)
	$MarginContainer/VBoxContainer/Label2.text=str(GlobalVars.hscore)
func _on_button_pressed():
	get_tree().call_deferred("change_scene_to_file","res://mainmenu.tscn")
