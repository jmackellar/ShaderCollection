local light = love.graphics.newShader[[
	extern Image map;
	extern number w;
	extern number screenwidth;
	extern number screenheight;
	extern number lightpow;
	//Effect
	vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
   	vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
   	vec4 mp = Texel(map, vec2(1 * 0.005, 0));
   	vec4 mc = Texel(map, vec2(1 * 0.005, 1));
   	vec4 colorr = vec4(0,0,0,0);
   	vec2 info = vec2(0, (pixel.r + pixel.g + pixel.b) * 0.33);
   	for (number i = 0; i < w; i++){
   		mp = Texel(map, vec2(i * 0.005, 0));
   		mc = Texel(map, vec2(i * 0.005, 1));
   		info.x = (mp.b * ((mp.b * 510) + 1)) * pow(sqrt(pow(((mp.r * screenwidth) - 300) - screen_coords.x, 2) + pow(((mp.g * screenheight) - 300) - screen_coords.y, 2)) / lightpow, 2);
   		colorr.x = max(-min(max(info.x * info.y, mc.r), pixel.r * 0.99) + pixel.r, colorr.x * 1);
   		colorr.y = max(-min(max(info.x * info.y, mc.g), pixel.g * 0.99) + pixel.g, colorr.y * 1);
   		colorr.z = max(-min(max(info.x * info.y, mc.b), pixel.b * 1.1) + pixel.b, colorr.z * 1);
   	}
    pixel.rgb = colorr.xyz;
   	return pixel;
 	}
]]