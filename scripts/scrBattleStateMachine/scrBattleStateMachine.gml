
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
				objBattleCursor.cursorStatePrev = CursorStateFree;
				battleState = BattleStatePlayerTurnUnitMenu;
				battleStatePrev = BattleStatePlayerTurnFree;
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
					objBattleCursor.cursorStatePrev = CursorStateFrozen;
					battleState = BattleStatePlayerTurnUnitMove;
					battleStatePrev = BattleStatePlayerTurnUnitMenu;
					break;
					
				case UnitOptions.ATTACK:
					objBattleCursor.cursorState = CursorStateFree;
					objBattleCursor.cursorStatePrev = CursorStateFrozen;
					battleState = BattleStatePlayerTurnUnitAttack;
					battleStatePrev = BattleStatePlayerTurnUnitMenu;
					break;
					
				case UnitOptions.CANCEL:
					unselectUnit();
					break;
				default: break;
			}
		}
	
	#endregion
	
	#region cancel button - unselect unit
	
		if (objInputManager.pressed.cancel) { unselectUnit(); }
	
	#endregion
}



function BattleStatePlayerTurnUnitMove ()
{
	#region cancel button - go back to unit options
	
		if (objInputManager.pressed.cancel) { backToUnitOptions(); }
	
	#endregion
}



function BattleStatePlayerTurnUnitAttack ()
{
	#region cancel button - go back to unit options
	
		if (objInputManager.pressed.cancel) { backToUnitOptions(); }
	
	#endregion
}














// Helper Functions

function unselectUnit ()
{
	selectedUnit = noone;
	unitOptionsIndex = UnitOptions.MOVE;
	
	objBattleCursor.cursorState = CursorStateFree;
	objBattleCursor.cursorStatePrev = CursorStateFrozen;
	battleState = BattleStatePlayerTurnFree;
	battleStatePrev = BattleStatePlayerTurnUnitMenu;
}

function backToUnitOptions ()
{
	objBattleCursor.x = selectedUnit.x;
	objBattleCursor.y = selectedUnit.y;
	objBattleCursor.mapX = objBattleCursor.x div CELL_SIZE;
    objBattleCursor.mapY = objBattleCursor.y div CELL_SIZE;
			
	objBattleCursor.cursorState = CursorStateFrozen;
	objBattleCursor.cursorStatePrev = CursorStateFree;
	battleState = BattleStatePlayerTurnUnitMenu;
	battleStatePrev = BattleStatePlayerTurnFree;
}
