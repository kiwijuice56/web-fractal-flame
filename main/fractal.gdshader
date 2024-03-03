shader_type canvas_item;

uniform float aspect_ratio = 1.0;

void fragment() {
	// setup coordinates
	vec2 c = UV;
	c -= vec2(0.5, 0.5);
	c.x *= aspect_ratio;
	
	// function after function!
	c.x = sin(c.x);
	c.y = sin(c.y);
	
	vec2 t = c;
	c.x = c.x / (c.x * c.x + c.y * c.y) + TIME;
	c.y = c.y / (t.x * t.x + t.y * t.y) + TIME;
	
	c.x = sin(c.x);
	c.y = sin(c.y);
	
	
	for (int i = 0; i < 3; i++) {
		c.x = c.x * c.x + 2.0 * c.y * c.x + c.y * c.y;
	}
	
	c.y = c.y * c.y - 2.0 * c.y * c.x + c.x * c.x;
	t = c;
	c.x = c.x / (c.x * c.x + c.y * c.y);
	c.y = c.y / (t.x * t.x + t.y * t.y);
	COLOR.rgb = vec3(c.x, c.y * c.x, c.y);
}
