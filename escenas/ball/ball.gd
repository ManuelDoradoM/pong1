extends CharacterBody2D

var speed = 0
var PlaI = 0

func _ready():
	
	#Velocidad y direccion inicial de la pelota
	speed = 500
	velocity.y = -1 / sqrt(2)
	velocity.x= 0
	
	if randi() % 2 == 0:
		velocity.x = 1 / sqrt(2)
	else:
		velocity.x = -1 / sqrt(2)
		
	velocity *= speed
	
func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity * delta)
	var angulo = 0
	if collision_info:
		#Si colisiona con el nodo Player
		if collision_info.get_collider_id() == PlaI:
			var PlaX = instance_from_id(PlaI).call("posX")
			
			angulo = (position.x - PlaX) / 180
			var vectorD = collision_info.get_normal().rotated(angulo)
			velocity = vectorD * speed
		else:
			velocity = velocity.bounce(collision_info.get_normal()).normalized() * speed
