extends CharacterBody2D

var tilemapcam: TileMap
const SPEED = 120.0
const JUMP_VELOCITY = -400.0
var dd = false
var has_key: bool=false
@export var dj: bool=false
@export var has_dj=false
var timer=true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim :AnimatedSprite2D = $AnimatedSprite2D
@onready var cam = $Camera2D as Camera2D
func _ready() -> void:
	tilemapcam=get_parent().find_child("TileMap")
	var r=tilemapcam.get_used_rect()
	var vp=tilemapcam.get_viewport_rect()
	var qs=tilemapcam.cell_quadrant_size
	cam.limit_left=r.position.x * qs
	cam.limit_right=r.end.x*qs
	cam.limit_top=r.position.y*qs-60
	cam.limit_bottom=r.end.y*qs
func _physics_process(delta):
	if is_on_floor() and has_dj:
		dj=true
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and !dd:
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("ui_accept") and !is_on_floor() and !dd and dj:
		$Timer.start()
		timer=false
		velocity.y = JUMP_VELOCITY
		dj=false
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction and !dd:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	update_animation()
	move_and_slide()
func update_animation():
	if dd:
		anim.play("hit")
	else:
		if velocity.x and velocity.y==0:
			anim.play("run")
		if velocity.x==0 and velocity.y==0:
			anim.play("idle")
		if velocity.y and timer:
			if velocity.y<0:
				anim.play("jump")
			elif velocity.y>0:
				anim.play("fall")
		elif velocity.y and !timer:
			anim.play("doublejump")
		if velocity.x<0:
			anim.flip_h =true
		if velocity.x>0:
			anim.flip_h = false
func death():
	$"../diemenu".die_menu_show()
	dd=true
	has_key=false


func _on_timer_timeout():
	timer=true
