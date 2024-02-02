extends CharacterBody2D

var speed = 500
func posX():
	return position.x

func _physics_process(delta):
	
	#Movimiento H
	velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -1
	
	velocity.x *= speed
	move_and_collide(velocity * delta)
	
	#/Movimiento H
