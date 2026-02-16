// Draw the full info card of a unit during battle
function draw_info_card (_unit, _fade_alpha)
{
	if (!instance_exists(_unit)) { return; }
	
	var _info = _unit.stats;
	var _team = _unit.team;
	
	// Draw on the left or right of the screen depending on team
	var _card_x = (_team == TEAM_ONE) ? 0 : (display_get_gui_width() - INFO_CARD_WIDTH);
	var _card_y = display_get_gui_height() - INFO_CARD_HEIGHT;
	
	// Draw the background
	draw_info_card_background(_card_x, _card_y, _team, _fade_alpha);
    
    // Reset color and alpha
    draw_set_alpha(_fade_alpha);
    draw_set_color(c_white);
	
	// Display Sprite
	draw_sprite(spr_unit_display_frame, 0, _card_x, _card_y + 30);
	// TODO: Draw the info sprite
	
	// Name
	draw_set_font(fnt_unit_name);
	draw_text(_card_x, _card_y, _info.name);
	
	// Level
	draw_set_font(fnt_unit_info);
	draw_text(_card_x+150, _card_y+10, "Lvl: "+string(_info.level));
	
	// Healthbar
	draw_info_card_healthbar(_info.curr_hp, _info.max_hp, _card_x, _card_y+180);
	
	// Reset font and alpha
	draw_set_alpha(1);
	draw_set_font(-1);
}



// Draws the background shape of the info card
function draw_info_card_background(_card_x, _card_y, _team, _fade_alpha)
{
    var _radius = 20;
    var _bg_color = (_team == TEAM_ONE) ? c_blue : c_red;

    static ui_surf = -1;
    if (!surface_exists(ui_surf)) {
        ui_surf = surface_create(INFO_CARD_WIDTH, INFO_CARD_HEIGHT);
    }

    surface_set_target(ui_surf);
    draw_clear_alpha(c_black, 0);
    draw_set_color(_bg_color);
    draw_set_alpha(1.0);
    
    draw_roundrect_ext(0, 0, INFO_CARD_WIDTH, INFO_CARD_HEIGHT, _radius, _radius, false);
    draw_rectangle(0, INFO_CARD_HEIGHT - _radius, _radius, INFO_CARD_HEIGHT, false);
    draw_rectangle(INFO_CARD_WIDTH - _radius, INFO_CARD_HEIGHT - _radius, INFO_CARD_WIDTH, INFO_CARD_HEIGHT, false);
    
    if (_team == TEAM_ONE) { draw_rectangle(0, 0, _radius, _radius, false); }
    else { draw_rectangle(INFO_CARD_WIDTH - _radius, 0, INFO_CARD_WIDTH, _radius, false); }
    surface_reset_target();
    
    draw_set_alpha(0.7 * _fade_alpha);
    draw_surface(ui_surf, _card_x, _card_y);
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
