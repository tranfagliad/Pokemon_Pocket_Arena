
function BattleStatePlayerTurnFree ()
{
	#region select unit
	
		if (objInputManager.pressed.select)
	    {
			var _cell = map[# objBattleCursor.mapX, objBattleCursor.mapY];
		
			if (_cell != undefined && _cell.unit != noone && _cell.unit.team == whoseTurn)
			{
				selectedUnit = _cell.unit;
				
				objBattleCursor.cursorState = CursorStateFrozen;
				battleState = BattleStatePlayerTurnUnitMenu;
			}
		}
	
	#endregion
}



function BattleStatePlayerTurnUnitMenu ()
{
	#region unit menu navigation
		
		if (objInputManager.pressed.down)
		{
			unitOptionsIndex++;
            if (unitOptionsIndex > UnitOptions.CANCEL) { unitOptionsIndex = UnitOptions.MOVE; }
		}
		
		if (objInputManager.pressed.up)
        {
            unitOptionsIndex--;
            if (unitOptionsIndex < UnitOptions.MOVE) unitOptionsIndex = UnitOptions.CANCEL;
        }
		
	#endregion
	
	#region unit menu selection
	
		if (objInputManager.pressed.select)
		{
			switch (unitOptionsIndex)
			{
				case UnitOptions.MOVE:
					objBattleCursor.cursorState = CursorStateFree;
					battleState = BattleStatePlayerTurnUnitMove;
					ShowMoveRange(selectedUnit);
					break;
					
				case UnitOptions.ATTACK:
					objBattleCursor.cursorState = CursorStateFree;
					battleState = BattleStatePlayerTurnUnitAttack;
					ShowAttackRange(objBattleCursor.mapX, objBattleCursor.mapY, selectedUnit);
					break;
					
				case UnitOptions.CANCEL:
					UnselectUnit();
					break;
				default: break;
			}
		}
	
	#endregion
	
	#region cancel button - unselect unit
	
		if (objInputManager.pressed.cancel) { UnselectUnit(); }
	
	#endregion
}



function BattleStatePlayerTurnUnitMove ()
{
	#region show attack preview
		
		var _targetX = objBattleCursor.mapX;
		var _targetY = objBattleCursor.mapY;
		var _targetCell = map[# _targetX, _targetY];
		var _unitCellX = selectedUnit.x div CELL_SIZE;
		var _unitCellY = selectedUnit.y div CELL_SIZE;
	
		ClearAttackFlags(map);
		if (_targetCell.canMove || (_targetX == _unitCellX && _targetY == _unitCellY)) { ShowAttackRange(_targetX, _targetY, selectedUnit); }
	
	#endregion
	
	#region confirm move position
	
		if (objInputManager.pressed.select)
		{
			if (_targetCell != undefined && _targetCell.canMove)
			{
				unitOriginalMapX = _unitCellX;
                unitOriginalMapY = _unitCellY;
                unitTargetMapX = _targetX;
                unitTargetMapY = _targetY;
				
				map[# _unitCellX, _unitCellY].unit = noone;
                _targetCell.unit = selectedUnit;
				
				objBattleCursor.cursorState = CursorStateFrozen;
				
				battleStateNext = BattleStatePlayerTurnPostMoveUnitMenu;
				battleState = BattleStateUnitMoving;
				
				ClearMapFlags(map);
			}
		}
	
	#endregion
	
	#region cancel button - go back to unit options
	
		if (objInputManager.pressed.cancel)
		{
			ClearMapFlags(map);
			BackToUnitOptions();
		}
	
	#endregion
}


function BattleStateUnitMoving ()
{
	var _moveSpeed = UNIT_MOVE_SPEED;
	var _targetX = (unitTargetMapX * CELL_SIZE) + CENTER_CELL;
    var _targetY = (unitTargetMapY * CELL_SIZE) + CENTER_CELL;
	var _distance = point_distance(selectedUnit.x, selectedUnit.y, _targetX, _targetY);
	
	if (_distance > _moveSpeed)
	{
		var _direction = point_direction(selectedUnit.x, selectedUnit.y, _targetX, _targetY);
		selectedUnit.x += lengthdir_x(_moveSpeed, _direction);
		selectedUnit.y += lengthdir_y(_moveSpeed, _direction);
	}
	else
	{
		selectedUnit.x = _targetX;
        selectedUnit.y = _targetY;
		
		unitTargetMapX = RESET_CELL_COORDINATE;
		unitTargetMapY = RESET_CELL_COORDINATE;
		
		UnitOptionsIndex = UnitOptionsPostMove.ATTACK;
		battleState = battleStateNext;
	}
}


function BattleStatePlayerTurnUnitAttack ()
{
	#region cancel button - go back to unit options
	
		if (objInputManager.pressed.cancel)
		{
			ClearAttackFlags(map);
			BackToUnitOptions();
		}
	
	#endregion
}


function BattleStatePlayerTurnPostMoveUnitMenu ()
{
	#region post-move menu navigation
	
		if (objInputManager.pressed.down)
		{
			unitOptionsIndex++;
			if (unitOptionsIndex > UnitOptionsPostMove.END) { unitOptionsIndex = UnitOptionsPostMove.ATTACK; }
		}
		
		if (objInputManager.pressed.up)
		{
			unitOptionsIndex--;
			if (unitOptionsIndex < UnitOptionsPostMove.ATTACK) { unitOptionsIndex = UnitOptionsPostMove.END; }
		}
	
	#endregion
	
	
	
	
	#region cancel button - go back to original coordinates
	
		if (objInputManager.pressed.cancel) { UndoUnitMove(); }
	
	#endregion
}







// Helper Functions

function UnselectUnit ()
{
	selectedUnit = noone;
	unitOptionsIndex = UnitOptions.MOVE;
	
	objBattleCursor.cursorState = CursorStateFree;
	battleState = BattleStatePlayerTurnFree;
}

function BackToUnitOptions ()
{
	objBattleCursor.x = selectedUnit.x;
	objBattleCursor.y = selectedUnit.y;
	objBattleCursor.mapX = objBattleCursor.x div CELL_SIZE;
    objBattleCursor.mapY = objBattleCursor.y div CELL_SIZE;
			
	objBattleCursor.cursorState = CursorStateFrozen;
	battleState = BattleStatePlayerTurnUnitMenu;
}

function UndoUnitMove ()
{
	
}
