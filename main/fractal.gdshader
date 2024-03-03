shader_type canvas_item;

uniform float aspect_ratio = 1.0;

void fragment() {
	vec2 c = UV;
	c -= vec2(0.5, 0.5);
	c.x *= aspect_ratio;
	
	c.x = sin(c.x);
	c.y = sin(c.y);
	
	vec2 t = c;
	c.x = c.x / (c.x * c.x + c.y * c.y);
	c.y = c.y / (t.x * t.x + t.y * t.y);
	
	c.x = sin(c.x + TIME);
	c.y = sin(c.y + TIME);
	
	t = c;
	c.x = c.x / (c.x * c.x + c.y * c.y);
	c.y = c.y / (t.x * t.x + t.y * t.y);
	
	COLOR.rgb = vec3(c.x + c.y, c.x, c.y);
}
