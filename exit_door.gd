extends Node2D
@export var next_scene : String
@export var needkey : bool=false


func _on_animexit_body_entered(body):
	if body.name != "player":
		return
	$AnimatedSprite2D.show()
	$AnimatedSprite2D.play("default")
	$"End(idle)".hide()


func _on_gonextscene_body_entered(body):
		if body.name != "player":
			return
		if needkey:
			if body.has_key==true:
				body.has_key=false
				GlobalVars.last_level=next_scene
				GlobalVars.save_game()
				get_tree().call_deferred("change_scene_to_file",next_scene)
			else:
				var tween1 = get_tree().create_tween()
				tween1.tween_property($AnimatedSprite2D,"self_modulate:a",0.0,0.75)
				tween1.tween_property($AnimatedSprite2D,"self_modulate:a",1.0,0.75)
		else:
			body.has_key=false
			GlobalVars.last_level=next_scene
			GlobalVars.save_game()
			get_tree().call_deferred("change_scene_to_file",next_scene)

func _on_animexit_body_exited(body):
	if body.name != "player":
		return
	$AnimatedSprite2D.hide()
	$"End(idle)".show()
