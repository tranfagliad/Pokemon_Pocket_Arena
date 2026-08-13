
function CursorStateFree ()
{
    //if (hasChangedLocation) { show_debug_message("Cursor changed location!"); }
    hasChangedLocation = false;
    
    #region detect input
    
        var _move_x = objInputManager.held.right - objInputManager.held.left;
        var _move_y = objInputManager.held.down - objInputManager.held.up;

        if (objInputManager.using_gamepad)
        {
            if (abs(objInputManager.left_analog_x) > objInputManager.gamepad_deadzone) { _move_x = objInputManager.left_analog_x; }
            if (abs(objInputManager.left_analog_y) > objInputManager.gamepad_deadzone) { _move_y = objInputManager.left_analog_y; }
        }
    
    #endregion
	
    #region cursor movement & speed
	
		var _isMoving = (_move_x != 0 || _move_y != 0);
        if (_isMoving)
        {
			//show_debug_message("Cursor is moving...");
			
            if (objInputManager.held.sprint) { cursorSpeed = global.cursorSprintSpeed; } 
            else { cursorSpeed = global.cursorNormalSpeed; }

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
    
    #region grid bounds & target cell check
    
        var _tempMapX = x div CELL_SIZE;
        var _tempMapY = y div CELL_SIZE;

        var _cell = objBattleManager.map[# _tempMapX, _tempMapY];
        var _targetX = (_tempMapX * CELL_SIZE) + CENTER_CELL;
        var _targetY = (_tempMapY * CELL_SIZE) + CENTER_CELL;
        
        var _isSnapping = (x != _targetX || y != _targetY);
        
    #endregion
    
    #region cursor snap
		
        if (_isMoving || _isSnapping)
        {
            if (_cell != undefined && (_cell.unit != noone || _cell.canMove || _cell.canAttack))
            {
                x = lerp(x, _targetX, global.cursorSnapStrength);
                y = lerp(y, _targetY, global.cursorSnapStrength);
                
                if (abs(x - _targetX) < 0.1) { x = _targetX; }
                if (abs(y - _targetY) < 0.1) { y = _targetY; }
            }
            
            x = clamp(x, CENTER_CELL, room_width - CENTER_CELL);
            y = clamp(y, CENTER_CELL, room_height - CENTER_CELL);
        }

    #endregion
    
    #region update tile coordinates & toggle has moved flag
		
        var _newMapX = x div CELL_SIZE;
        var _newMapY = y div CELL_SIZE;
        if (_newMapX != mapX || _newMapY != mapY)
        {
            mapX = _newMapX;
            mapY = _newMapY;
            hasChangedLocation = true;
        }
		
    #endregion
}


function CursorStateFrozen ()
{
    hasChangedLocation = false;
    
    #region cursor snap
		
		if (objBattleManager.selectedUnit != noone && objBattleManager.attackTargetUnit == noone)
		{
			x = objBattleManager.selectedUnit.x;
			y = objBattleManager.selectedUnit.y;
			mapX = x div CELL_SIZE;
			mapY = y div CELL_SIZE;
		}
		else
		{
			x = (mapX * CELL_SIZE) + CENTER_CELL;
			y = (mapY * CELL_SIZE) + CENTER_CELL;
		}
		
    #endregion
}


function CursorStatePaused () { /* Do Nothing */ }


// TODO: CursorStateWaitForAI (?)



// Helper Functions

function CursorToFreeState ()
{
	objBattleCursor.cursorState = CursorStateFree;
	objBattleCursor.image_speed = 1;
}

function CursorToFrozenState ()
{
	objBattleCursor.cursorState = CursorStateFrozen;
	objBattleCursor.image_index = 0;
	objBattleCursor.image_speed = 0;
}

function CursorPause ()
{
	objBattleCursor.cursorState = CursorStatePaused;
	objBattleCursor.image_index = 0;
	objBattleCursor.image_speed = 0;
	objBattleCursor.visible = false;
}

function CursorUnpause ()
{
	objBattleCursor.cursorState = CursorStateFree;
	objBattleCursor.image_speed = 1;
	objBattleCursor.visible = true;
}
