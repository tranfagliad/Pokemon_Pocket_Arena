



function draw_info_card (_unit) {
	if (!instance_exists(_unit)) { return; }
	
	var _info = _unit.stats;
	var _team = _unit.team;
	
	var _card_width = 240;
	var _card_height = 120;
	var _radius = 20;
	
	// Draw on the left or right of the screen depending on team
	var _card_x = (_team == TEAM_ONE) ? 0 : (display_get_gui_width() - _card_width);
	var _card_y = display_get_gui_height() - _card_height;
	
	// Determine background color depending on team
	var _bg_color = (_team == 0) ? c_blue : c_red;
	
	// Create a Surface for the background
    static ui_surf = -1;
    if (!surface_exists(ui_surf)) {
        ui_surf = surface_create(_card_width, _card_height);
    }

    // Draw the background
    surface_set_target(ui_surf);
    draw_clear_alpha(c_black, 0);
    draw_set_color(_bg_color);
    draw_set_alpha(1.0);
    draw_roundrect_ext(0, 0, _card_width, _card_height, _radius, _radius, false);
    draw_rectangle(0, _card_height - _radius, _radius, _card_height, false);
    draw_rectangle(_card_width - _radius, _card_height - _radius, _card_width, _card_height, false);
    if (_team == TEAM_ONE) { draw_rectangle(0, 0, _radius, _radius, false); }
	else { draw_rectangle(_card_width - _radius, 0, _card_width, _radius, false); }
    surface_reset_target();
    draw_set_alpha(0.7);
    draw_surface(ui_surf, _card_x, _card_y);
    
    // Reset color and alpha
    draw_set_alpha(1.0);
    draw_set_color(c_white);
	
	// Info Sprite
	// TODO: Draw the info sprite
	
	// Name
	draw_set_font(fnt_unit_name);
	draw_text(_card_x, _card_y, _info.name);
	
	
	
	
	
}




