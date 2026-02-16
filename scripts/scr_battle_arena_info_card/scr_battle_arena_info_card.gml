// Draw the full info card of a unit during battle
function draw_info_card (_unit, _fade_alpha)
{
	if (!instance_exists(_unit)) { return; }
	var _info = _unit.stats;
	var _team = _unit.team;
	
	// Draw on the left or right of the screen depending on team
	var _card_x = (_team == TEAM_ONE) ? 0 : (display_get_gui_width() - INFO_CARD_WIDTH);
	var _card_y = display_get_gui_height() - INFO_CARD_HEIGHT;
	var _info_x = (_team == TEAM_ONE) ? _card_x : _card_x + 30;
	
	// Draw the background
	draw_info_card_background(_card_x, _card_y, _team, _fade_alpha);
    
    // Set color and fade alpha
    draw_set_alpha(_fade_alpha);
    draw_set_color(c_white);
	
	// Name
	draw_set_font(fnt_unit_name);
	draw_text(_info_x, _card_y, _info.name);
	
	// Display Sprite
	draw_sprite(spr_unit_display_frame, 0, _info_x, _card_y + 30);
	// TODO: Draw the info sprite
	
	// Healthbar
	draw_info_card_healthbar(_info.curr_hp, _info.max_hp, _info_x, _card_y+190);
	
	// Level & Stats
	draw_set_font(fnt_unit_info);
	draw_text(_info_x+150, _card_y+10, "Lvl: "+string(_info.level));
	draw_text(_info_x+150, _card_y+30, "Atk: "+string(_info.attack));
	draw_text(_info_x+150, _card_y+50, "Def: "+string(_info.defense));
	
	// Types
	draw_sprite_ext(spr_type, _info.type_1, _info_x+150, _card_y+80, 0.5, 0.5, 0, c_white, _fade_alpha);
	draw_sprite_ext(spr_type, _info.type_2, _info_x+260, _card_y+80, 0.5, 0.5, 0, c_white, _fade_alpha);
	
	// Movement Range
	draw_text(_info_x+150, _card_y+110, "Move");
	draw_sprite_ext(spr_range, _info.movement_type, _info_x+150, _card_y+130, 0.5, 0.5, 0, c_white, _fade_alpha);
	draw_text(_info_x+200, _card_y+140, string(_info.movement_distance));
	
	// Attack Range
	draw_text(_info_x+250, _card_y+110, "Attack");
	draw_sprite_ext(spr_range, _info.attack_type, _info_x+250, _card_y+130, 0.5, 0.5, 0, c_white, _fade_alpha);
	draw_text(_info_x+300, _card_y+140, string(_info.attack_distance));
	
	// Reset font and alpha
	draw_set_alpha(1);
	draw_set_font(-1);
}



// Draws the background shape of the info card
function draw_info_card_background(_card_x, _card_y, _team, _fade_alpha)
{
    var _radius = 30;
    var _bg_color = (_team == TEAM_ONE) ? c_blue : c_red;
    
    var _draw_x = _card_x;
    var _draw_y = _card_y + _radius;
    
    if (_team == TEAM_ONE) { _draw_x -= _radius; }
	else { _draw_x += _radius; }

    draw_set_color(_bg_color);
    draw_set_alpha(0.6 * _fade_alpha);
    draw_roundrect_ext(_draw_x, _draw_y - _radius, _draw_x + INFO_CARD_WIDTH, _draw_y + INFO_CARD_HEIGHT, _radius, _radius, false);
    
	// Reset alpha
    draw_set_alpha(1.0);
}



// Draws the healthbar on the info card
function draw_info_card_healthbar (_curr_hp, _max_hp, _x, _y)
{
	var _hp_percent = clamp(_curr_hp / _max_hp, 0, 1);
	var _bar_w = 200;
	var _bar_h = 20;
	
	var _hp_color = c_white;
	if (_hp_percent > 0.5) {
		_hp_color = merge_color(c_yellow, c_lime, (_hp_percent - 0.5) * 2);
	} else {
		_hp_color = merge_color(c_red, c_yellow, _hp_percent * 2);
	}
	
	draw_set_color(c_dkgray);
	draw_rectangle(_x, _y, _x + _bar_w, _y + _bar_h, false);
	
	draw_set_color(_hp_color);
	if (_hp_percent > 0) {
		draw_rectangle(_x, _y, _x + (_bar_w * _hp_percent), _y + _bar_h, false);
	}
	
	draw_set_color(c_black);
	draw_rectangle(_x, _y, _x + _bar_w, _y + _bar_h, true);
	
	draw_set_font(fnt_unit_info);
	draw_set_color(c_white);
	var _hp_text = "HP: " + string(ceil(_curr_hp)) + " / " + string(_max_hp);
	draw_text(_x, _y + _bar_h + 5, _hp_text);
}
