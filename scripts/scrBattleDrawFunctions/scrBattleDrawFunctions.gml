
function DrawUnitInfoCards ()
{
    var _hoveredUnit = noone;
    var _cell = map[# objBattleCursor.mapX, objBattleCursor.mapY];
    
    if (_cell != undefined && _cell.unit != noone) { _hoveredUnit = _cell.unit; }
    
    if (selectedUnit != noone)
    {
        if (_hoveredUnit != noone && _hoveredUnit.team != selectedUnit.team)
        {
            DrawSingleUnitCard(selectedUnit);
            DrawSingleUnitCard(_hoveredUnit);
        }
        else if (_hoveredUnit != noone) { DrawSingleUnitCard(_hoveredUnit); }
        else { DrawSingleUnitCard(selectedUnit); }
    }
    else { DrawSingleUnitCard(_hoveredUnit); }
}


function DrawMenus ()
{
	switch (battleState)
	{
		case BattleStatePlayerTurnUnitMenu:
			DrawUnitMenu();
			break;
	
		case BattleStatePlayerTurnPostMoveUnitMenu:
			DrawPostMoveUnitMenu();
			break;
	
		case BattleStatePlayerTurnAttackConfirmation:
			DrawAttackConfirmationMenu();
			DrawUnitsComparison(whoseTurn);
			break;
		default: break;
	}
}



// Helper Functions

function DrawSingleUnitCard (_unit)
{
    if (_unit == noone || !instance_exists(_unit)) { return; }
    
    var _drawX = 0;
    var _drawY = VIEWPORT_HEIGHT - INFO_CARD_HEIGHT - INFO_CARD_MARGIN;
    var _cardColor = DEFAULT_DRAW_COLOR;
    
    #region draw card background
        
        if (_unit.team == Team.ONE)
        {
            _drawX = 0;
            _cardColor = c_blue;
        }
        else if (_unit.team == Team.TWO)
        {
            _drawX = VIEWPORT_WIDTH - INFO_CARD_WIDTH;
            _cardColor = c_red;
        }
        
        draw_set_colour(_cardColor);
        draw_set_alpha(INFO_CARD_ALPHA);
        draw_rectangle(_drawX, _drawY, _drawX + INFO_CARD_WIDTH, _drawY + INFO_CARD_HEIGHT, false);
        draw_set_colour(DEFAULT_DRAW_COLOR);
        draw_set_alpha(DEFAULT_DRAW_ALPHA);
            
    #endregion
    
    #region draw details
            
        draw_sprite(sprUnitDisplayBgr, 0, _drawX, _drawY);
        draw_sprite(sprPlaceholderDisplay, 0, _drawX, _drawY);
            
        draw_set_font(fntConsolas12);
        draw_text(_drawX + 130, _drawY, _unit.name);
        
        draw_text(_drawX + 130, _drawY + 20, "Lvl: " + string(_unit.level));
        draw_text(_drawX + 130, _drawY + 40, "HP: " + string(_unit.currentHp) + " / " + string(_unit.maxHp));
        draw_text(_drawX + 130, _drawY + 60, "Atk: " + string(_unit.attackStat));
        draw_text(_drawX + 220, _drawY + 60, "Def: " + string(_unit.defenseStat));
        
        draw_sprite_ext(sprType, _unit.activeType, _drawX, _drawY + 130, 0.6, 0.6, 0, DEFAULT_DRAW_COLOR, DEFAULT_DRAW_ALPHA);
        
        draw_text(_drawX + 130, _drawY + 90, "Move: " + string(_unit.moveDistance));
        draw_sprite_ext(sprRange, _unit.moveRange, _drawX + 130, _drawY + 110, 0.8, 0.8, 0, DEFAULT_DRAW_COLOR, DEFAULT_DRAW_ALPHA);
        
        draw_text(_drawX + 220, _drawY + 90, "Attack: " + string(_unit.attackDistance));
        draw_sprite_ext(sprRange, _unit.attackRange, _drawX + 220, _drawY + 110, 0.8, 0.8, 0, DEFAULT_DRAW_COLOR, DEFAULT_DRAW_ALPHA);
        
    #endregion
}

function DrawUnitMenu ()
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

function DrawPostMoveUnitMenu ()
{
	var _drawX = (VIEWPORT_WIDTH / 2) - (UNIT_OPTION_BOX_WIDTH / 2);
	var _drawY = (VIEWPORT_HEIGHT / 2) + (UNIT_OPTION_BOX_HEIGHT / 2);
	
	draw_set_colour(DEFAULT_DRAW_COLOR);
	draw_sprite_stretched(sprNineSliceUI, 0, _drawX, _drawY, UNIT_OPTION_BOX_WIDTH, UNIT_OPTION_BOX_HEIGHT);
	
	draw_set_font(fntConsolas20);
	draw_set_colour(c_black);
	
	for (var _i = 0; _i < array_length(unitOptionsPostMove); _i++)
	{
		var _optionStr = (_i == unitOptionsIndex) ? "->" + unitOptionsPostMove[_i] : unitOptionsPostMove[_i];
		draw_text(_drawX + 10, (30 * _i) + _drawY + 5, _optionStr);
	}
	
	draw_set_font(fntConsolas12);
	draw_set_colour(DEFAULT_DRAW_COLOR);
}

function DrawRanges ()
{
	for (var _col = 0; _col < mapWidth; _col++)
	{
		for (var _row = 0; _row < mapHeight; _row++)
		{
			var _cell = map[# _col, _row];
			if (_cell.canMove || _cell.canAttack)
			{
				var _drawX = (_col * CELL_SIZE) + CENTER_CELL;
				var _drawY = (_row * CELL_SIZE) + CENTER_CELL;
				
				if (_cell.canMove) { draw_sprite(sprMoveTile, 0, _drawX, _drawY); }
				if (_cell.canAttack) { draw_sprite(sprAttackTile, 0, _drawX, _drawY); }
			}
		}
	}
}

function DrawAttackConfirmationMenu ()
{
	var _menuWidth = UNIT_OPTION_BOX_WIDTH + 80;
	var _drawX = (VIEWPORT_WIDTH / 2) - (_menuWidth / 2);
	var _drawY = (VIEWPORT_HEIGHT / 2) + (UNIT_OPTION_BOX_HEIGHT / 2);
	
	draw_set_colour(DEFAULT_DRAW_COLOR);
	draw_sprite_stretched(sprNineSliceUI, 0, _drawX, _drawY, _menuWidth, UNIT_OPTION_BOX_HEIGHT);
	
	draw_set_font(fntConsolas20);
	draw_set_colour(c_black);
	
	draw_text(_drawX + 10, _drawY + 5, "Attack Target?");
	for (var _i = 0; _i < array_length(attackConfirmationOptions); _i++)
	{
		var _optionStr = (_i == unitOptionsIndex) ? "->" + attackConfirmationOptions[_i] : attackConfirmationOptions[_i];
		draw_text(_drawX + 10, (30 * _i) + _drawY + 40, _optionStr);
	}
}

function DrawUnitsComparison (_whoseTurn)
{
	var _boxWidth  = UNITS_COMPARISON_BOX_WIDTH;
	var _boxHeight = UNITS_COMPARISON_BOX_HEIGHT;
	var _boxBottomMargin = UNITS_COMPARISON_BOX_BOTTOM_MARGIN;
	
	var _drawX = (VIEWPORT_WIDTH / 2) - (_boxWidth / 2);
	var _drawY = VIEWPORT_HEIGHT - _boxHeight - _boxBottomMargin;
	
	var _boxColor = c_blue;
	if (_whoseTurn == Team.TWO) { _boxColor = c_red; }
	
	draw_set_colour(_boxColor);
	draw_set_alpha(INFO_CARD_ALPHA);
	
	draw_rectangle(_drawX, _drawY, _drawX+_boxWidth, _drawY+_boxHeight, false);
	
	draw_set_colour(DEFAULT_DRAW_COLOR);
	draw_set_alpha(DEFAULT_DRAW_ALPHA);
	
	draw_text(_drawX, _drawY, string(damage));
}

function DrawSystemMenu ()
{
	
	
}