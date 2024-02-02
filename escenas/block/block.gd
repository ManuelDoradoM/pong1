extends StaticBody2D

var fieldId = 0

#Cuando la pelota sale del area2d del bloque este se elimina
func _on_area_2d_body_exited(body):
	instance_from_id(fieldId).bloques = instance_from_id(fieldId).bloques - 1
	queue_free()
