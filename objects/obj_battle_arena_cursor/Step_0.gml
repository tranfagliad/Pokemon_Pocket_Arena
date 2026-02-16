// Get movement inputs
var _x_move = obj_battle_arena_input_manager.move_x;
var _y_move = obj_battle_arena_input_manager.move_y;



// Calculate the grid tile the cursor is currently over
var _grid_x = floor(x / TILE_SIZE);
var _grid_y = floor(y / TILE_SIZE);

// Look for a unit at the current grid location
unit_hovered = noone;
with (obj_battle_arena_unit)
{
    if (grid_x == _grid_x && grid_y == _grid_y)
	{
        other.unit_hovered = id;
    }
}




// Cursor Snap when hovering over a unit
var _current_speed = cursor_speed;
if (unit_hovered != noone) {
    // Apply snap
    _current_speed = cursor_speed * cursor_snap;
    
    // If input is very low, slowly pull cursor to tile center
    if (abs(_x_move) < 0.2 && abs(_y_move) < 0.2)
	{
        x = lerp(x, (_grid_x * TILE_SIZE) + CENTER_TILE, 0.15);
        y = lerp(y, (_grid_y * TILE_SIZE) + CENTER_TILE, 0.15);
    }
}



// Cursor Movement Vector
if (_x_move != 0 || _y_move != 0)
{
    var _direction = point_direction(0, 0, _x_move, _y_move);
    var _magnitude = min(1, point_distance(0, 0, _x_move, _y_move));
    
    x += lengthdir_x(_current_speed * _magnitude, _direction);
    y += lengthdir_y(_current_speed * _magnitude, _direction);
}



// Prevent the cursor from leaving the room
x = clamp(x, CENTER_TILE, room_width - CENTER_TILE);
y = clamp(y, CENTER_TILE, room_height - CENTER_TILE);
