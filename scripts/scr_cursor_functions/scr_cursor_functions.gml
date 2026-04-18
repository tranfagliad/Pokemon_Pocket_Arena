
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
