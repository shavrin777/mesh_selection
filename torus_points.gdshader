// NOTE: Shader automatically converted from Godot Engine 4.3.stable's StandardMaterial3D.

shader_type spatial;
render_mode unshaded;

//uniform vec4 albedo : source_color;
uniform float point_size : hint_range(0.1, 128.0, 0.1);

void vertex() {
	POINT_SIZE = point_size;
}

void fragment() {
	ALBEDO = COLOR.rgb;
}
