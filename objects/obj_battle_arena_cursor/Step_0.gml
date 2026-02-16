// Horizontal Movement
var _hmove = keyboard_check(ord("D")) - keyboard_check(ord("A"));

// Vertical Movement
var _vmove = keyboard_check(ord("S")) - keyboard_check(ord("W"));



// Calculate Movement Vector
if (_hmove != 0 || _vmove != 0)
{
    var _dir = point_direction(0, 0, _hmove, _vmove);
    x += lengthdir_x(cursor_speed, _dir);
    y += lengthdir_y(cursor_speed, _dir);
}



// Prevent the cursor from leaving the room
x = clamp(x, half_cursor_size, room_width - half_cursor_size);
y = clamp(y, half_cursor_size, room_height - half_cursor_size);
