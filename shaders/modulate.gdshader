shader_type canvas_item;

uniform sampler2D tex;
uniform vec3 modulate : source_color = vec3(1.0);

void fragment() {
	vec4 c = texture(tex, UV);
	COLOR = c * vec4(modulate, 1.0);
}
