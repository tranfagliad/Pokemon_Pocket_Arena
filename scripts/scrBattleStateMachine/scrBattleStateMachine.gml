
function BattleStatePlayerTurnFree ()
{
	#region select unit
	
		if (objInputManager.pressed.select)
	    {
			var _cell = map[# objBattleCursor.mapX, objBattleCursor.mapY];
		
			if (_cell != undefined && _cell.unit != noone && _cell.unit.team == whoseTurn && _cell.unit.isEnabled)
			{
				selectedUnit = _cell.unit;
				
				objBattleCursor.cursorState = CursorStateFrozen;
				battleState = BattleStatePlayerTurnUnitMenu;
			}
		}
		
	#endregion
	
	#region press start - go to system menu
	
		if (objInputManager.pressed.start)
		{
			objBattleCursor.cursorState = CursorStateFrozen;
			battleState = BattleStateSystemMenu;
		}
	
	#endregion
}


function BattleStatePlayerTurnUnitMenu ()
{
	#region menu navigation
		
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
				objBattleCursor.visible = false;
				
				battleStateTemp = BattleStatePlayerTurnPostMoveUnitMenu;
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
		
		objBattleCursor.visible = true;
		
		unitOptionsIndex = UnitOptionsPostMove.ATTACK;
		battleState = battleStateTemp;
		battleStateTemp = noone;
	}
}


function BattleStatePlayerTurnUnitAttack ()
{
	#region confirm target
	
		if (objInputManager.pressed.select) { GoToAttackConfirmation(); }
	
	#endregion
	
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
	#region menu navigation
	
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
	
	#region unit menu selection
	
		if (objInputManager.pressed.select)
		{
			switch (unitOptionsIndex)
			{
				case UnitOptionsPostMove.ATTACK:
					objBattleCursor.cursorState = CursorStateFree;
					battleState = BattleStatePlayerTurnPostMoveUnitAttack;
					var _unitMapX = selectedUnit.x div CELL_SIZE;
					var _unitMapY = selectedUnit.y div CELL_SIZE;
					ShowAttackRange(_unitMapX, _unitMapY, selectedUnit);
					break;
				
				case UnitOptionsPostMove.GO_BACK:
					UndoUnitMove();
					break;
				
				case UnitOptionsPostMove.END:
					selectedUnit.isEnabled = false;
					UnselectUnit();
					break;
				default: break;
			}
		}
	
	#endregion
	
	#region cancel button - go back to original coordinates
	
		if (objInputManager.pressed.cancel) { UndoUnitMove(); }
	
	#endregion
}


function BattleStatePlayerTurnPostMoveUnitAttack ()
{
	#region confirm target
	
		if (objInputManager.pressed.select) { GoToAttackConfirmation(); }
	
	#endregion
	
	#region cancel button - go back to unit options
	
		if (objInputManager.pressed.cancel)
		{
			ClearAttackFlags(map);
			BackToPostMoveUnitOptions();
		}
	
	#endregion
}


function BattleStatePlayerTurnAttackConfirmation ()
{
	#region menu navigation
	
		if (objInputManager.pressed.down)
		{
			unitOptionsIndex++;
			if (unitOptionsIndex > AttackConfirmationOptions.CANCEL) { unitOptionsIndex = AttackConfirmationOptions.CONFIRM; }
		}
		
		if (objInputManager.pressed.up)
		{
			unitOptionsIndex--;
			if (unitOptionsIndex < AttackConfirmationOptions.CONFIRM) { unitOptionsIndex = AttackConfirmationOptions.CANCEL; }
		}
	
	#endregion
	
	#region attack target
	
		if (objInputManager.pressed.select)
		{
			switch (unitOptionsIndex)
			{
				case AttackConfirmationOptions.CONFIRM:
				
					break;
				
				case AttackConfirmationOptions.CANCEL:
					BackFromAttackConfirmation();
					break;
				default: break;
			}
		}
	
	#endregion
	
	#region cancel button - go back to selecting a target
	
		if (objInputManager.pressed.cancel) { BackFromAttackConfirmation(); }
	
	#endregion
}


function BattleStateSystemMenu ()
{
	if (objInputManager.pressed.cancel)
	{
		objBattleCursor.cursorState = CursorStateFree;
		objBattleManager.battleState = BattleStatePlayerTurnFree;
	}
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

function BackToPostMoveUnitOptions ()
{
	objBattleCursor.x = selectedUnit.x;
	objBattleCursor.y = selectedUnit.y;
	objBattleCursor.mapX = objBattleCursor.x div CELL_SIZE;
    objBattleCursor.mapY = objBattleCursor.y div CELL_SIZE;
	
	objBattleCursor.cursorState = CursorStateFrozen;
	battleState = BattleStatePlayerTurnPostMoveUnitMenu;
}

function UndoUnitMove ()
{
	var _currentX = selectedUnit.x div CELL_SIZE;
	var _currentY = selectedUnit.y div CELL_SIZE;
	
	map[# _currentX, _currentY].unit = noone;
	map[# unitOriginalMapX, unitOriginalMapY].unit = selectedUnit;
	
	selectedUnit.x = (unitOriginalMapX * CELL_SIZE) + CENTER_CELL;
	selectedUnit.y = (unitOriginalMapY * CELL_SIZE) + CENTER_CELL;
	
	objBattleCursor.x = selectedUnit.x;
	objBattleCursor.y = selectedUnit.y;
	objBattleCursor.mapX = unitOriginalMapX;
	objBattleCursor.mapY = unitOriginalMapY;
	
	unitOriginalMapX = RESET_CELL_COORDINATE;
	unitOriginalMapY = RESET_CELL_COORDINATE;
	
	unitOptionsIndex = UnitOptions.MOVE;
	objBattleCursor.cursorState = CursorStateFree;
	ShowMoveRange(selectedUnit);
	battleState = BattleStatePlayerTurnUnitMove;
}

function GoToAttackConfirmation ()
{
	var _cell = map[# objBattleCursor.mapX, objBattleCursor.mapY];
	if (_cell != undefined && _cell.canAttack && _cell.unit != noone && _cell.unit.team != whoseTurn)
	{
		attackTargetUnit = _cell.unit;
		battleStateTemp = battleState;
		unitOptionsIndex = AttackConfirmationOptions.CONFIRM;
		objBattleCursor.cursorState = CursorStateFrozen;
		battleState = BattleStatePlayerTurnAttackConfirmation;
	}
}

function BackFromAttackConfirmation ()
{
	attackTargetUnit = noone;
	if (battleStateTemp == BattleStatePlayerTurnUnitAttack) { unitOptionsIndex = UnitOptions.ATTACK; }
	else if (battleStateTemp == BattleStatePlayerTurnPostMoveUnitAttack) { unitOptionsIndex = UnitOptionsPostMove.ATTACK; }
	objBattleCursor.cursorState = CursorStateFree;
	battleState = battleStateTemp;
	battleStateTemp = noone;
}
