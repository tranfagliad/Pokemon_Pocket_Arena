
function CursorStateFree ()
{
	image_speed = 1;
	
	#region cursor movement
		
		var _xStart = x;
		var _yStart = y;
		
	    if (objInputManager.held.sprint) { cursorSpeed = global.cursorSprintSpeed; } 
	    else { cursorSpeed = global.cursorNormalSpeed; }
    
	    var _move_x = objInputManager.held.right - objInputManager.held.left;
	    var _move_y = objInputManager.held.down - objInputManager.held.up;
    
	    if (objInputManager.using_gamepad)
	    {
	        if (abs(objInputManager.left_analog_x) > objInputManager.gamepad_deadzone) { _move_x = objInputManager.left_analog_x; }
	        if (abs(objInputManager.left_analog_y) > objInputManager.gamepad_deadzone) { _move_y = objInputManager.left_analog_y; }
	    }
    
	    if (_move_x != 0 || _move_y != 0)
	    {
	        if (!objInputManager.using_gamepad || (abs(_move_x) == 1 && abs(_move_y) == 1))
	        {
	            var _dir = point_direction(0, 0, _move_x, _move_y);
	            _move_x = lengthdir_x(1, _dir);
	            _move_y = lengthdir_y(1, _dir);
	        }
        
	        x += _move_x * cursorSpeed;
	        y += _move_y * cursorSpeed;
	    }
		
	#endregion
	
	#region magnetic snap
		
		var _tempMapX = x div CELL_SIZE;
		var _tempMapY = y div CELL_SIZE;
		

		var _cell = objBattleManager.map[# _tempMapX, _tempMapY];
        
		// If there is a unit on this tile, apply a gravitational pull to the center of the tile
		if (_cell != undefined && _cell.unit != noone)
		{
			var _targetX = (_tempMapX * CELL_SIZE) + (CELL_SIZE / 2);
			var _targetY = (_tempMapY * CELL_SIZE) + (CELL_SIZE / 2);
				
			x = lerp(x, _targetX, global.cursorSnapStrength);
			y = lerp(y, _targetY, global.cursorSnapStrength);
		}

		x = clamp(x, CENTER_CELL, room_width - CENTER_CELL);
		y = clamp(y, CENTER_CELL, room_height - CENTER_CELL);
		
		if (x != _xStart || y != _yStart)
		{
			mapX = x div CELL_SIZE;
			mapY = y div CELL_SIZE;
		}
		
	#endregion
}



function CursorStateFrozen ()
{
	image_index = 0;
	image_speed = 0;
	
	#region cursor snap
		
		var _unit = objBattleManager.selectedUnit;
		x = _unit.x;
		y = _unit.y;
        
		mapX = x div CELL_SIZE;
		mapY = y div CELL_SIZE;
		
	#endregion
}
