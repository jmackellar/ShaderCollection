local replaceColor = love.graphics.newShader[[
	// Replaces any white pixels with passed r,g,b color values
	extern number r;
	extern number g;
	extern number b;
	//Effect
	vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
	vec4 pixel = Texel(texture, texture_coords );
	if (pixel.r == 1 && pixel.g == 1 && pixel.b == 1){
		pixel.r = r;
		pixel.g = g;
		pixel.b = b;
	}
	return pixel;
}
]]