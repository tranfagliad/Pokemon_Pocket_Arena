// Get movement inputs
var _x_move = obj_battle_arena_input_manager.move_x;
var _y_move = obj_battle_arena_input_manager.move_y;



// Cursor Movement Vector
if (_x_move != 0 || _y_move != 0)
{
    var _direction = point_direction(0, 0, _x_move, _y_move);
    var _magnitude = min(1, point_distance(0, 0, _x_move, _y_move));
    
    x += lengthdir_x(cursor_speed * _magnitude, _direction);
    y += lengthdir_y(cursor_speed * _magnitude, _direction);
}



// Prevent the cursor from leaving the room
x = clamp(x, CENTER_TILE, room_width - CENTER_TILE);
y = clamp(y, CENTER_TILE, room_height - CENTER_TILE);
