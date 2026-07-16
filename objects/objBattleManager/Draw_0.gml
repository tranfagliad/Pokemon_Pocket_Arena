
#region debugging

	if (global.showDebugUI)
	{
		draw_set_font(fntConsolas8);
		
		for (var _row = 0; _row < mapWidth; _row++)
		{
			for (var _col = 0; _col < mapHeight; _col++)
			{
				var _cell =  ds_grid_get(map, _row, _col);
				
				var _cellHasTerrain = _cell.terrain != noone;
				var _cellHasUnit = _cell.unit != noone;
			
				var _str = "T: {";
				_str += (_cellHasTerrain) ? "*}\nU: {" : "}\nU: {";
				_str += (_cellHasUnit) ? "*}\ncM: {" : "}\ncM: {";
				_str += (_cell.canMove) ? "*}\ncA: {" : "}\ncA: {";
				_str += (_cell.canAttack) ? "*}" : "}";
			
				draw_text(_row*CELL_SIZE, _col*CELL_SIZE, _str);
			}
		}
		
		draw_set_font(fntConsolas12);
	}

#endregion

#region draw move and attack tiles

	if (battleState == BattleStatePlayerTurnUnitMove)
	{
		drawMoveRange();
	}
	
#endregion
