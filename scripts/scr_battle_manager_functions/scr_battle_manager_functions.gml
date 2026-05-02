
function create_and_register_unit (_unit_info, _team_list, _map)
{
	// Create and initialize the unit
	var _unit = instance_create_layer(0, 0, UNITS_LAYER, obj_unit);
	_unit.team = _unit_info.team;
	_unit.cell_x = _unit_info.cell_x;
	_unit.cell_y = _unit_info.cell_y;
	_unit.current_hp = _unit_info.current_hp;
	_unit.active_type = _unit_info.active_type;
	_unit.move_range = _unit_info.move_range;
	_unit.move_distance = _unit_info.move_distance;
	_unit.attack_range = _unit_info.attack_range;
	_unit.attack_distance = _unit_info.attack_distance;
	_unit.sprite_index = (_unit_info.team == Team.ONE) ? spr_placeholder_unit_blue : spr_placeholder_unit_red;
	_unit.x = (_unit.cell_x * CELL_SIZE) + CENTER_CELL;
	_unit.y = (_unit.cell_y * CELL_SIZE) + CENTER_CELL;
	_unit.name = _unit_info.name;
	
	// Register the unit
	ds_list_add(_team_list, _unit);
	ds_grid_set(_map, _unit.cell_x, _unit.cell_y, { terrain: ds_grid_get(_map, _unit.cell_x, _unit.cell_y).terrain, unit: _unit });
}



function get_current_cell (_map, _cursor_cell_x, _cursor_cell_y)
{
	return ds_grid_get(_map, _cursor_cell_x, _cursor_cell_y);
}



function print_map (_map)
{
	var _map_string = "";
	for (var _row = 0; _row < ds_grid_height(_map); _row++)
	{
		var _row_values = "";
		for (var _column = 0; _column < ds_grid_width(_map); _column++)
		{
			var _cell = ds_grid_get(_map, _column, _row);
			if (_cell.unit == noone) { _row_values += ". " }
			else if (_cell.unit.team == Team.ONE) { _row_values += "O " }
			else { _row_values += "X " }
		}
		_map_string += _row_values + "\n";
	}
	show_debug_message(_map_string);
}



function print_team (_team)
{
	for (var _i = 0; _i < ds_list_size(_team); _i++)
	{
		show_debug_message(unit_to_string(ds_list_find_value(_team, _i)));
	}
	show_debug_message("");
}



function map_to_json(_map)
{
	var _width = ds_grid_width(_map);
    var _height = ds_grid_height(_map);
	
	var _cells = [];
	
	for (var _row = 0; _row < _height; _row++)
	{
		for (var _column = 0; _column < _width; _column++)
		{
            var _cell_data = ds_grid_get(_map, _column, _row);
            if (!is_struct(_cell_data)) {
                _cell_data = {
                    terrain: {},
                    unit: {}
                };
            }
            
            var _output_cell = {
                row: _row,
                column: _column,
                terrain: variable_struct_exists(_cell_data, "terrain") ? _cell_data.terrain : {},
                unit:    variable_struct_exists(_cell_data, "unit")    ? _cell_data.unit    : {}
            };
            
            array_push(_cells, _output_cell);
        }
    }
	
	var _map_data = {
        width: _width,
        height: _height,
        cells: _cells
    };
	
	var _json_string = json_stringify(_map_data);
	return _json_string;
}
