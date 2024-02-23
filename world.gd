extends Node2D


# Called when the node enters the scene tree for the first time.

func _process(delta):
	$ParallaxBackground/ParallaxLayer2.motion_offset.x+=5*delta
