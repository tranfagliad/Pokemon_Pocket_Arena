
function drawUnitInfoCard ()
{
	var _cell = map[# objBattleCursor.mapX, objBattleCursor.mapY];
	if (_cell.unit != noone)
	{
		var _unit = _cell.unit;
		var _drawX = 0;
		var _drawY = VIEWPORT_HEIGHT - INFO_CARD_HEIGHT - INFO_CARD_MARGIN;
		var _cardColor = DEFAULT_DRAW_COLOR;
			
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
			draw_sprite(sprPlaceholderDisplay, 0, _drawX, _drawY);
				
			draw_set_font(fntConsolas12);
			draw_text(_drawX+130, _drawY, _unit.name);
			
		#endregion
	}
}


function drawUnitMenu ()
{
	var _drawX = (VIEWPORT_WIDTH / 2) - (UNIT_OPTION_BOX_WIDTH / 2);
	var _drawY = (VIEWPORT_HEIGHT / 2) + (UNIT_OPTION_BOX_HEIGHT / 2);
		
	draw_set_colour(DEFAULT_DRAW_COLOR);
	draw_sprite_stretched(sprNineSliceUI, 0, _drawX, _drawY, UNIT_OPTION_BOX_WIDTH, UNIT_OPTION_BOX_HEIGHT);
		
	draw_set_font(fntConsolas20);
	draw_set_colour(c_black);
	
	for (var _i = 0; _i < array_length(unitOptions); _i++)
	{
		var _optionStr = (_i == unitOptionsIndex) ? "->"+unitOptions[_i] : unitOptions[_i];
		draw_text(_drawX+10, 30*_i+_drawY+5, _optionStr);
	}
	
	draw_set_font(fntConsolas12);
	draw_set_colour(DEFAULT_DRAW_COLOR);
}
