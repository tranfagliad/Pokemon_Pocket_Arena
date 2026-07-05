
if (global.showDebugUI)
{
	for (var _row = 0; _row < mapWidth; _row++)
	{
		for (var _col = 0; _col < mapHeight; _col++)
		{
			var _cell_has_terrain = ds_grid_get(map, _row, _col).terrain != noone;
			var _cell_has_unit = ds_grid_get(map, _row, _col).unit != noone;
			
			var _str = "T: {";
			_str += (_cell_has_terrain) ? "*}\nU: {" : "}\nU: {";
			_str += (_cell_has_unit) ? "*}" : "}";
			
			draw_text(_row*CELL_SIZE, _col*CELL_SIZE, _str);
		}
	}
}
