shader_type spatial;
render_mode cull_disabled;

uniform vec3 color : source_color = vec3(1.0);
uniform sampler2D noise_texture;
uniform float time_scale : hint_range(-10.0, 10.0, 0.1) = 0.1;
uniform float alpha_scale : hint_range(0.0, 10.0, 0.1) = 1.0;
uniform int use_vertex = 0;

varying vec2 v;

void vertex() {
	// Called for every vertex the material is visible on.
	v = VERTEX.xy;
}

void fragment() {
	// Called for every pixel the material is visible on.
	float noise_val = texture(noise_texture, (v * float(use_vertex) + UV * float(1-use_vertex) + TIME * time_scale) ).r;
	ALBEDO = color * noise_val;
	ALPHA = step(noise_val * alpha_scale, 1.0);
}

//void light() {
//}
