// Draw Title
draw_set_font(fntConsolas32);
draw_set_halign(fa_center);
draw_text(1280 / 2, 40, "Select Opponent");




// Draw the opponents
var _center_x = VIEWPORT_WIDTH / 2;
var _center_y = VIEWPORT_HEIGHT / 2;
var _base_spacing = 200; 

for (var _i = -3; _i <= 3; _i++)
{
    var _opponent_id = (round(visualIndex) + _i + totalOpponents * 2) % totalOpponents;
    var _visual_offset = _i - (visualIndex - round(visualIndex));
    
    var _distance_from_center = abs(_visual_offset) / 3;
    _distance_from_center = clamp(_distance_from_center, 0, 1);
    
    var _draw_x = _center_x + (sign(_visual_offset) * power(abs(_visual_offset), 0.95) * _base_spacing);
    var _draw_y = _center_y;
    
    var _scale = lerp(2.5, 1.2, _distance_from_center);
    
    var _color_value = lerp(255, 10, _distance_from_center);
    var _blend_color = make_color_rgb(_color_value, _color_value, _color_value);
    
    draw_sprite_ext(sprTrainerMugshotBgr, 0, _draw_x, _draw_y, _scale, _scale, 0, _blend_color, 1);
    draw_sprite_ext(sprTrainerMugshots, _opponent_id, _draw_x, _draw_y, _scale, _scale, 0, _blend_color, 1);
}


draw_text(1280 / 2, _center_y+100, trainerData[selectedIndex].name);
draw_text(1280 / 2, _center_y + 185, "Arena: " + arenaData[trainerData[selectedIndex].arena].name);

draw_set_halign(fa_left);
draw_set_font(fntConsolas12);
