extends Node3D

var space_state

func count_points() -> void:
	var corners = []
	for point in $"Control/Line2D".points:
		corners.append(point * $"Control/Line2D".transform.get_scale() +  $"Control/Line2D".position)
	var camVec3 = get_viewport().get_camera_3d().get_transform().origin
	var i = 0
	var mesh_pos: Vector3 = $Torus.global_position
	var mesh_vertices: PackedVector3Array = $Torus.mesh.get_mesh_arrays()[0]
	var mesh_normals: PackedVector3Array  = $Torus.mesh.get_mesh_arrays()[1]
	var sel: PackedInt32Array
	
	for j in range(mesh_vertices.size()):
		mesh_vertices[j] += mesh_pos
	for normal: Vector3 in mesh_normals:
		if (normal.dot(camVec3) > 0):
			if (Geometry2D.is_point_in_polygon(get_viewport().get_camera_3d().unproject_position(mesh_vertices[i]),corners)):
				var query = PhysicsRayQueryParameters3D.create(mesh_vertices[i], camVec3)
				query.collide_with_areas = true
				query.hit_from_inside = true
				var result = space_state.intersect_ray(query)
				if result.is_empty():
					sel.append(i)
		i += 1
	$Torus/TorusPointCloud.select(sel)
	$"Control/Label".set_text(str(sel.size()))


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	space_state = get_world_3d().direct_space_state
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	count_points()
