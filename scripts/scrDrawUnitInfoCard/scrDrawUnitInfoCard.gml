
function drawUnitInfoCard ()
{
	if (instance_exists(objBattleCursor))
	{
		var _mapX = objBattleCursor.mapX;
		var _mapY = objBattleCursor.mapY;
	
		var _cell = map[# _mapX, _mapY];
		if (_cell != undefined && _cell.unit != noone)
		{
			var _unit = _cell.unit;
			var _drawX = 0;
			var _drawY = VIEWPORT_HEIGHT - INFO_CARD_HEIGHT - INFO_CARD_MARGIN;
			var _cardColor = c_black;
			
			#region draw card background
			
				if (_unit.team == Team.ONE)
				{
					_cardColor = c_blue;
				}
				else if (_unit.team == Team.TWO)
				{
					_drawX = VIEWPORT_WIDTH - INFO_CARD_WIDTH;
					_cardColor = c_red;
				}
			
				draw_set_colour(_cardColor);
				draw_set_alpha(INFO_CARD_ALPHA);
				draw_rectangle(_drawX, _drawY, _drawX+INFO_CARD_WIDTH, _drawY+INFO_CARD_HEIGHT, false);
				draw_set_colour(DEFAULT_DRAW_COLOR);
				draw_set_alpha(DEFAULT_DRAW_ALPHA);
				
			#endregion
			
			#region draw details
				
				draw_sprite(sprUnitDisplayBgr, 0, _drawX, _drawY);
				
				draw_set_font(fntConsolas12);
				draw_text(_drawX+130, _drawY, _unit.name);
			
			#endregion
		}
	}
}
