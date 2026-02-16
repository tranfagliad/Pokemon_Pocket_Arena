// Zoom Input
if (keyboard_check_pressed(ord("O"))){ zoom_target = 1.5; }    // Zoom Out
if (keyboard_check_pressed(ord("I"))) { zoom_target = 1.0; }   // Zoom In


// Smoothly adjust camera zoom level
zoom_level = lerp(zoom_level, zoom_target, zoom_speed);
var _current_w = camera_width * zoom_level;
var _current_h = camera_height * zoom_level;
camera_set_view_size(view_camera[0], _current_w, _current_h);



// Update camera position to follow the cursor
if (instance_exists(obj_battle_arena_cursor))
{
    x = lerp(x, obj_battle_arena_cursor.x, follow_speed);
    y = lerp(y, obj_battle_arena_cursor.y, follow_speed);
    
    var _view_x = x - (_current_w / 2);
    var _view_y = y - (_current_h / 2);
    
    camera_set_view_pos(view_camera[0], floor(_view_x), floor(_view_y));
}
