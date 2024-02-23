extends CanvasLayer


func _process(delta):
	$VBoxContainer/MarginContainer/score.text='score '+str(GlobalVars.score)
	$VBoxContainer/MarginContainer2/hscore.text='high score '+str(GlobalVars.hscore)
