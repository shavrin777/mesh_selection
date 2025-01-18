extends Polygon2D

func _input(_event):
	if Input.is_action_pressed("scale+"):
		transform = transform.scaled(Vector2(1.1,1.1))
	if Input.is_action_pressed("scale-"):
		transform = transform.scaled(Vector2(0.9,0.9))
		
func _process(_delta: float) -> void:
	position = get_viewport().get_mouse_position() - polygon[2] / 2 * transform.get_scale()
	pass
