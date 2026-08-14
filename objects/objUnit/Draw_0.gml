
// Draw shadow
if (team == Team.ONE) { draw_sprite_ext(shadowAnimation, image_index, x, y, image_xscale, image_yscale, image_angle, c_blue, SHADOW_ALPHA); }
else { draw_sprite_ext(shadowAnimation, image_index, x, y, image_xscale, image_yscale, image_angle, c_red, SHADOW_ALPHA); }

// Draw sprite
var _blendColor = merge_color(c_dkgray, c_white, colorBlend);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, _blendColor, image_alpha);
