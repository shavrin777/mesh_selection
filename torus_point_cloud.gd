@tool
extends MeshInstance3D

@export var update = false

# Called when the node enters the scene tree for the first time.

var arr = ArrayMesh.new()
var parent_mesh

func _ready() -> void:
	gen_mesh()
	pass # Replace with function body.

func gen_mesh() -> void:
	parent_mesh = get_parent().mesh.get_mesh_arrays()
	arr = ArrayMesh.new()
	var colors = PackedColorArray()
	
	for i in range(parent_mesh[Mesh.ARRAY_VERTEX].size()):
		colors.append(Color(1,1,1))
	parent_mesh[Mesh.ARRAY_COLOR] = colors
	
	arr.add_surface_from_arrays(Mesh.PRIMITIVE_POINTS, parent_mesh)
	mesh = arr
	
func select(selected: PackedInt32Array) -> void:
	arr.clear_surfaces()
	for i in range(parent_mesh[Mesh.ARRAY_COLOR].size()):
		parent_mesh[Mesh.ARRAY_COLOR][i] = Color(1,1,1)
	for i in selected:
		parent_mesh[Mesh.ARRAY_COLOR][i] = Color(0,1,0)
	arr.add_surface_from_arrays(Mesh.PRIMITIVE_POINTS, parent_mesh)
	mesh = arr
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (update):
		update = false
		gen_mesh()
	pass
