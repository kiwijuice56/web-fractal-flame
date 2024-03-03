shader_type canvas_item;

uniform float aspect_ratio = 1.0;

vec2 sinusoidal(vec2 c, float offset) {
	c.x = sin(c.x + offset);
	c.y = sin(c.y + offset);
	
	return c;
}

vec2 spherical(vec2 c, float offset) {
	vec2 t = c;
	c.x = c.x / (c.x * c.x + c.y * c.y) + offset;
	c.y = c.y / (t.x * t.x + t.y * t.y) + offset;
	
	return c;
}

vec2 julia(vec2 c, vec2 p) {
	int i = 0;
	for (; i < 16; i++) {
		if (c.x * c.x + c.y * c.y > 4.0) {
			break;
		}
		float t = c.x * c.x - c.y * c.y + p.x;
		c.y = 2.0 * c.x * c.y + p.y;
		c.x = t;
	}
	
	float modulus = sqrt(c.x * c.x + c.y * c.y);
	float mu = max(0, (float(i) - log(log(modulus)) / log(2.0))) / 16.0;
	
	return c * vec2(mu);
}

void fragment() {
	// Setup the coordinate system.
	vec2 c = UV;
	c -= vec2(0.5, 0.5);
	c.x *= aspect_ratio;
	
	// Apply functions randomly.
	c = sinusoidal(c, 0.0);
	c += julia(c, 0.6 * vec2(sin(TIME * 0.1), cos(TIME * 0.1)));
	c = spherical(c, TIME);
	c = sinusoidal(c, TIME);
	c = spherical(c, 0.0);
	
	// Turn the final coordinate into a color.
	COLOR.rgb = vec3(c.x, c.y + c.x, c.y);
}
