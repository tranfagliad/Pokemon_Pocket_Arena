if (instance_exists(obj_battle_arena_cursor))
{
    x = lerp(x, obj_battle_arena_cursor.x, follow_speed);
    y = lerp(y, obj_battle_arena_cursor.y, follow_speed);
    
    var _view_x = x - (camera_width / 2);
    var _view_y = y - (camera_height / 2);
    
    camera_set_view_pos(view_camera[0], floor(_view_x), floor(_view_y));
}