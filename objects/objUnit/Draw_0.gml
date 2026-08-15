
// Draw team indicator
if (team == Team.ONE) { draw_sprite_ext(sprTeamIndicator, image_index, x, y, image_xscale, image_yscale, image_angle, c_blue, image_alpha); }
else { draw_sprite_ext(sprTeamIndicator, image_index, x, y, image_xscale, image_yscale, image_angle, c_red, image_alpha); }

// Draw shadow
draw_sprite_ext(shadowAnimation, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, SHADOW_ALPHA);

// Draw sprite
var _blendColor = merge_color(c_dkgray, c_white, colorBlend);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, _blendColor, image_alpha);
