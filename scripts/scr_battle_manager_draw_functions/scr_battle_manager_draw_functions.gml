
function draw_unit_info_card(_unit)
{
    var _card_x = (_unit.team == Team.ONE) ? 0 : (VIEW_WIDTH - INFO_CARD_WIDTH);
    var _card_y = VIEW_HEIGHT - INFO_CARD_HEIGHT;
    var _card_color = (_unit.team == Team.ONE) ? c_blue : c_red;
    
    var _display_x = (_unit.team == Team.ONE) ? _card_x + 2 : VIEW_WIDTH - (DISPLAY_SPRITE_SIZE + 2);
    var _display_y = _card_y + 2;
    
    var _stats_x = (_unit.team == Team.ONE) ? DISPLAY_SPRITE_SIZE + 10 : _card_x + 10;
    var _stats_y = _card_y + 6;
	
	var _type_x = _display_x + 5;
	var _type_y = _card_y + DISPLAY_SPRITE_SIZE + 15;
    
    var _hp_percentage = _unit.current_hp / _unit.max_hp;
    var _hp_color = _hp_percentage > 0.6 ? c_green : (_hp_percentage > 0.25 ? c_yellow : c_red);
	
	var _move_range_x = (_unit.team == Team.ONE) ? _card_x + 142 : _card_x + 17;
	var _attack_range_x = (_unit.team == Team.ONE) ? _card_x + 272 : _card_x + 147;
	var _range_y = _card_y + 165;
	

    // Draw Card Background
    draw_set_colour(_card_color);
    draw_set_alpha(INFO_CARD_ALPHA);
    draw_rectangle(_card_x, _card_y, _card_x + INFO_CARD_WIDTH, VIEW_HEIGHT, false);

    // Draw Display Sprite
    draw_set_alpha(DEFAULT_DRAW_ALPHA);
    draw_set_colour(DEFAULT_DRAW_COLOR);
	// TESTING ----------------------------------------------------------------------------
    draw_sprite(spr_unit_display_frame, 0, _display_x, _display_y);
	draw_sprite(global.test_sprite_img, image_index*0.4, _display_x, _display_y);
	//draw_sprite(spr_placeholder_display_sprite, 0, _display_x, _display_y);
	// TESTING ----------------------------------------------------------------------------
    

    // Draw Name
    draw_set_font(fnt_unit_name);
    draw_text(_stats_x, _stats_y, _unit.name);

    // Draw Level
    draw_set_halign(fa_right);
    draw_text(_stats_x + 250, _stats_y, "Lvl: " + string(_unit.level));

    // HP Bar
    draw_set_font(DEFAULT_FONT);
    draw_set_colour(c_black);
    draw_rectangle(_stats_x, _stats_y + 35, _stats_x + 250, _stats_y + 65, false);
    draw_set_colour(_hp_color);
    var _bar_width = 250 * _hp_percentage;
    draw_rectangle(_stats_x, _stats_y + 35, _stats_x + _bar_width, _stats_y + 65, false);
	draw_set_colour(c_black);
    draw_rectangle(_stats_x, _stats_y + 35, _stats_x + 250, _stats_y + 65, true);
    draw_set_colour(DEFAULT_DRAW_COLOR);
    draw_text(_stats_x + 240, _stats_y + 38, string(_unit.current_hp) + "/" + string(_unit.max_hp));
	
	// Atk and Def Stats
    draw_set_halign(fa_left);
	draw_set_font(fnt_unit_name);
	draw_text(_stats_x+20, _stats_y+85, "Atk: "+string(_unit.attack_stat));
	draw_text(_stats_x+145, _stats_y+85, "Def: "+string(_unit.defense_stat));
	
	// Draw Type
	draw_sprite_ext(spr_type, _unit.active_type, _type_x, _type_y, TYPE_SPRITE_SCALE, TYPE_SPRITE_SCALE, DEFAULT_DRAW_ROTATION, DEFAULT_DRAW_COLOR, DEFAULT_DRAW_ALPHA);

	// Draw Ranges
	draw_text(_move_range_x+10, _range_y-30, "Move");
	draw_sprite_ext(spr_range, _unit.move_range, _move_range_x, _range_y, RANGE_SPRITE_SCALE, RANGE_SPRITE_SCALE, DEFAULT_DRAW_ROTATION, DEFAULT_DRAW_COLOR, DEFAULT_DRAW_ALPHA);
	draw_text(_move_range_x+85, _range_y+22, string(_unit.move_distance));
	
	draw_text(_move_range_x+137, _range_y-30, "Attack");
	draw_sprite_ext(spr_range, _unit.attack_range, _attack_range_x, _range_y, RANGE_SPRITE_SCALE, RANGE_SPRITE_SCALE, DEFAULT_DRAW_ROTATION, DEFAULT_DRAW_COLOR, DEFAULT_DRAW_ALPHA);
	draw_text(_attack_range_x+85, _range_y+22, string(_unit.attack_distance));
}
