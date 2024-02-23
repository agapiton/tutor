extends Area2D
var using = false
enum item_type {ITEM_FRUIT,ITEM_KEY,ITEM_BONUS}
@export var type : item_type
@export var points:int=1
var fixbody
func _ready():
	$AnimatedSprite2D.play("default")

func _on_body_entered(body):
	if body.name=="player":
		if !using:
			GlobalVars.score+=points
			using=true
			if GlobalVars.score>GlobalVars.hscore:
				GlobalVars.hscore=GlobalVars.score
		$AudioStreamPlayer.play()
		var tween1 = get_tree().create_tween()
		tween1.tween_property($AnimatedSprite2D,"self_modulate:a",0,0.75)
		
		await $AudioStreamPlayer.finished
		match type:
			item_type.ITEM_FRUIT:
				pass
			item_type.ITEM_KEY:
				body.has_key=true
			item_type.ITEM_BONUS:
				body.has_dj=true
				body.dj=true
				await get_tree().create_timer(5).timeout
				body.has_dj=false
				body.dj=false
		$".".queue_free()
