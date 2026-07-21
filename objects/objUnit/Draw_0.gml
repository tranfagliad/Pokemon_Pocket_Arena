
if (team == Team.ONE) { draw_sprite(sprUnitTeamOne, 0, x, y); }
else { draw_sprite(sprUnitTeamTwo, 0, x, y); }

var _blendColor = merge_color(c_dkgray, c_white, colorBlend);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, _blendColor, image_alpha);
