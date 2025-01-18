extends Line2D

func scale_points(m: float = 1):
	for i in range(points.size()):
		points[i] *= m

func _input(_event):
	if Input.is_action_pressed("scale+"):
		scale_points(1.1)
	if Input.is_action_pressed("scale-"):
		scale_points(0.9)
		
func _process(_delta: float) -> void:
	position = get_viewport().get_mouse_position() - points[2] / 2
	pass
