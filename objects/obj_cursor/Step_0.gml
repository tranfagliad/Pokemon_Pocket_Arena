
// Detect Inputs
var _input_x = 0;
var _input_y = 0;

// Detect directional button inputs
if (obj_input_manager.held.right) { _input_x += CURSOR_BASE_SPEED; }
if (obj_input_manager.held.left)  { _input_x -= CURSOR_BASE_SPEED; }
if (obj_input_manager.held.down)  { _input_y += CURSOR_BASE_SPEED; }
if (obj_input_manager.held.up)    { _input_y -= CURSOR_BASE_SPEED; }

// Detect left analog stick
if (abs(obj_input_manager.left_analog_x) > obj_input_manager.gamepad_deadzone ||
    abs(obj_input_manager.left_analog_y) > obj_input_manager.gamepad_deadzone) {
    _input_x += obj_input_manager.left_analog_x;
    _input_y += obj_input_manager.left_analog_y;
}



// We only need to calculate movement and update cursor position if any inputs are detected
if (_input_x != 0 || _input_y != 0)
{
	if (obj_input_manager.held.sprint) { cursor_speed = CURSOR_SPRINT_SPEED }
	else { cursor_speed = CURSOR_BASE_SPEED }
	
	// Calculate the movement vector and update x and y
	var _vector_length = point_distance(0, 0, _input_x, _input_y);
	if (_vector_length > 0)
	{
		_input_x /= _vector_length;
		_input_y /= _vector_length;
		x += _input_x * cursor_speed;
		y += _input_y * cursor_speed;
	}
	
	x = calculate_cursor_position(x);
	y = calculate_cursor_position(y);

	// Update current map cell
	cell_x = calculate_cell_coordinate(x);
	cell_y = calculate_cell_coordinate(y);
	show_debug_message("Cell: ("+string(cell_x)+", "+string(cell_y)+")");
}

// Cursor snap when hovering over a unit
if (obj_battle_manager.unit_hovered)
{
	var _target_position = get_cell_center(cell_x, cell_y);
	x = lerp(x, _target_position.x, CURSOR_SNAP_STRENGTH);
	y = lerp(y, _target_position.y, CURSOR_SNAP_STRENGTH);
}
