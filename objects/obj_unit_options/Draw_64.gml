
draw_sprite_stretched(sprite_index, 0, OPTIONS_BOX_X, OPTIONS_BOX_Y, OPTIONS_BOX_WIDTH, options_box_height);

draw_set_colour(c_black);
for (var _i = 0; _i < array_length(options); _i++)
{
	var _option_arrow = (_i == current_option_id) ? "> " : "";
	draw_text(OPTIONS_BOX_X+12, _i*23+OPTIONS_BOX_Y, _option_arrow+options[_i]);
}
draw_set_colour(c_white);
