
function CursorStateFree ()
{
	#region cursor movement
	
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
			
			x = clamp(x, CENTER_CELL, room_width - CENTER_CELL);
			y = clamp(y, CENTER_CELL, room_height - CENTER_CELL);
		
			mapX = x div CELL_SIZE;
			mapY = y div CELL_SIZE;
	    }
		
	#endregion
}



function CursorStatePaused () { /* Do Nothing */ }
