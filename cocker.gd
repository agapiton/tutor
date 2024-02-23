extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var span=false
var ddm=false
var direction
var spawn_position : Vector2
var danger:bool=true
var target
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animm : AnimatedSprite2D=$AnimatedSprite2D


func _ready():
	spawn_position=position
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if target:
		var targetposition = get_parent().get_node("player")
		if targetposition.position.x>$".".position.x and !ddm:
			direction=1
		else:
			direction=-1
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if !ddm:
		move_and_slide()
	update_animation()
func update_animation():
	if ddm and !span:
		animm.play("hit")
	elif ddm and span:
		animm.play("spawn")
	else:
		if velocity.x and velocity.y==0:
			animm.play("run")
		if velocity.x==0 and velocity.y==0:
			animm.play("idle")
		if velocity.y<0:
			animm.play("jump")
		elif velocity.y>0:
			animm.play("fall")
		if velocity.x<0:
			animm.flip_h =true
		if velocity.x>0:
			animm.flip_h =false

func deathm():
	ddm=true
	danger=false
	$CollisionShape2D.set_deferred("disabled",true)
	$Timer.start()



	


func _on_area_2d_body_entered(body):
	if body.name=="player":
		deathm()



	


func _on_timer_timeout():
	position=spawn_position
	span=true
	$tsp.start()
	danger=true



func _on_pdet_body_entered(body):
	if body.name=="player":
		target=body



func _on_pdet_body_exited(body):
	if body.name=="player":
		target=null


func _on_tsp_timeout():
	$CollisionShape2D.set_deferred("disabled",false)
	span=false
	ddm=false


func _on_pldam_body_entered(body):
	if danger and body.name=="player":
		body.death()
