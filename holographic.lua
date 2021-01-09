local holographic = love.graphics.newShader[[
	extern number x;
	vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
		vec4 pixel = Texel(texture, texture_coords);
		if (pixel.r == 1 && pixel.g == 1 && pixel.b == 1){
			pixel.r = min(0.75, max(0.35, sin(x + texture_coords.y) + 1.2 - (texture_coords.y - 0.1)));
			pixel.g = min(0.45, max(0.15, cos(x + texture_coords.y) + 1.2 - (texture_coords.y - 0.5)));
			pixel.b = min(1, max(0.35, sin(x + texture_coords.y) + 1.2 - (texture_coords.y - 0.75)));
		}
		return pixel;
	}
]]