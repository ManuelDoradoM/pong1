extends Node2D

const CENTER = Vector2(640, 360)

var nivel = 1
var bloquesIniciales = 10
var bloques = bloquesIniciales
var bloquesActuales = bloques

func _ready():
	
	var block = load("res://escenas/block/block.tscn")
	var vBlock = []
	
	#Creacion de los bloques
	for i in range(bloques):
		vBlock.push_back(block.instantiate())
		add_child(vBlock[i])
		vBlock[i].fieldId = get_instance_id()
		vBlock[i].position.x = 80 + i * 120
		vBlock[i].position.y = 60
	
	#Creacion del nodo ball y id del nodo Player para que el nodo ball lo reconozca
	var ball = load("res://escenas/ball/ball.tscn")
	add_child(ball.instantiate())
	$ball.PlaI = $Player.get_instance_id()


func _process(delta):
	if bloquesActuales > bloques:
		bloquesActuales = bloques
		$ball.speed += 20
	if bloques == -bloquesIniciales:
		print("Ganaste")

#Cuando la pelota cae
func _on_bot_wall_body_entered(body):
	$Player.position.x = CENTER.x
	$Player.position.y = 700
	
	$ball.position = CENTER
	$ball.call("_ready")
