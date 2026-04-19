
// Calculates a cursor (x, y) position
function calculate_cursor_position (_coordinate_value)
{
	// When calling, use x or y for _coordinate value
	return clamp(_coordinate_value, CENTER_CELL, MAP_WIDTH*CELL_SIZE-CENTER_CELL);
}



// Calculates a cell coordinate based on the cursor position given
function calculate_cell_coordinate (_coordinate_value)
{
	// When calling, use x or y for _coordinate value
	return clamp(floor(_coordinate_value / CELL_SIZE), 0, MAP_WIDTH-1);
}



// Given the map cell coordinates, calculate the center of the cell in {x, y}
function get_cell_center (_cell_x, _cell_y)
{
	return {
		x : (_cell_x * CELL_SIZE) + CENTER_CELL,
		y : (_cell_y * CELL_SIZE) + CENTER_CELL
	};
}
