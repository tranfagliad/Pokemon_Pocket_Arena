// Find the active gamepad
if (active_gp == -1)
{
    for (var i = 0; i < 8; i++;)
	{
        if (gamepad_is_connected(i))
		{
            active_gp = i;
            gamepad_set_axis_deadzone(i, deadzone);
            break;
        }
    }
}



// Keyboard Input
var _hmove = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _vmove = keyboard_check(ord("S")) - keyboard_check(ord("W"));



// Controller Input
if (active_gp != -1) {
    if (!gamepad_is_connected(active_gp)) {
        active_gp = -1; // Reset if unplugged
    } else {
        var _gp_h = gamepad_axis_value(active_gp, gp_axislh);
        var _gp_v = gamepad_axis_value(active_gp, gp_axislv);

        // Override if stick is moved
        if (abs(_gp_h) > deadzone) _hmove = _gp_h;
        if (abs(_gp_v) > deadzone) _vmove = _gp_v;
    }
}



// Normalize and apply speed
if (_hmove != 0 || _vmove != 0)
{
    var _dir = point_direction(0, 0, _hmove, _vmove);
    var _mag = min(1, point_distance(0, 0, _hmove, _vmove));
    
    x += lengthdir_x(cursor_speed * _mag, _dir);
    y += lengthdir_y(cursor_speed * _mag, _dir);
}



// Prevent the cursor from leaving the room
x = clamp(x, half_cursor_size, room_width - half_cursor_size);
y = clamp(y, half_cursor_size, room_height - half_cursor_size);
