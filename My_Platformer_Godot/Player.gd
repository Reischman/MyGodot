extends KinematicBody2D

const Speed = 60
const Gravity = 10
const Jump_Power = -250
const Floor = Vector2(0,-1)

var velocity = Vector2()
var on_ground = false

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = Speed
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -Speed
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	else:
		velocity.x = 0
		if on_ground ==true:
			$AnimatedSprite.play("idile")

	if Input.is_action_pressed("ui_up"):
		if on_ground ==true:
			velocity.y = Jump_Power
			on_ground = false
		 

	
	velocity.y = velocity.y + Gravity
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
		if velocity.y < 0:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("fall")
	
	
	velocity = move_and_slide(velocity ,Floor) 