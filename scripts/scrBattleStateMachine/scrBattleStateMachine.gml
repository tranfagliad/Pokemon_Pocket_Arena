
function BattleStatePlayerTurnFree ()
{
	#region select unit
	
		if (objInputManager.pressed.select) { GoToUnitMenu(); }
		
	#endregion
	
	#region press start - go to system menu
	
		if (objInputManager.pressed.start) { GoToSystemMenu(); }
	
	#endregion
}


function BattleStateSystemMenu ()
{
	#region menu navigation
		
		MenuNavigation();
		
	#endregion
	
	if (objInputManager.pressed.select)
	{
		var _selectedOption = menuOptions[menuIndex];
		switch (_selectedOption)
		{
			case MENU_OPTION_END_TURN:
				break;
			
			case MENU_OPTION_TYPE_CHART:
				break;
			
			case MENU_OPTION_SETTINGS:
				break;
			
			case MENU_OPTION_HELP:
				break;
			
			case MENU_OPTION_SURRENDER:
				break;
			
			case MENU_OPTION_CANCEL:
				BackFromSystemMenu();
				break;
			default: break;
		}
	}
	
	#region cancel button - back to free state
		
		if (objInputManager.pressed.cancel) { BackFromSystemMenu(); }
		
	#endregion
}


function BattleStatePlayerTurnUnitMenu ()
{
	#region menu navigation
		
		MenuNavigation();
		
	#endregion
	
	#region unit menu selection
	
		if (objInputManager.pressed.select)
		{
			var _selectedOption = menuOptions[menuIndex];
			switch (_selectedOption)
			{
				case MENU_OPTION_MOVE:
					GoToUnitMove();
					break;
					
				case MENU_OPTION_ATTACK:
					GoToUnitAttack();
					break;
					
				case MENU_OPTION_CANCEL:
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
	#region update facing and attack tiles when cursor moves to a new tile
	
		if (objBattleCursor.hasChangedLocation)
		{
			UpdateUnitFacingToCursor();
			UpdateAttackTiles();
		}
	
	#endregion
	
	#region confirm move position
	
		if (objInputManager.pressed.select) { GoToUnitMoving(); }
	
	#endregion
	
	#region cancel button - go back to unit options
	
		if (objInputManager.pressed.cancel) { BackToUnitMenu(); }
	
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
	else   // Move animation ends
	{
		selectedUnit.x = _targetX;
        selectedUnit.y = _targetY;
		unitTargetMapX = RESET_CELL_COORDINATE;
		unitTargetMapY = RESET_CELL_COORDINATE;
		
		selectedUnit.sprite_index = selectedUnit.idleSprite;
		selectedUnit.image_speed = IDLE_IMAGE_SPEED;
		selectedUnit.image_index = 0;
		objBattleCursor.visible = true;
		
		array_push(menuOptions, MENU_OPTION_ATTACK);
		array_push(menuOptions, MENU_OPTION_GO_BACK);
		array_push(menuOptions, MENU_OPTION_END);
		menuIndex = 0;
		
		battleState = battleStateTemp;
		battleStateTemp = noone;
	}
}


function BattleStatePlayerTurnUnitAttack ()
{
	#region update facing
		
		if (objBattleCursor.hasChangedLocation) { UpdateUnitFacingToCursor(); }
		
	#endregion
	
	#region confirm target
	
		if (objInputManager.pressed.select) { GoToAttackConfirmation(); }
	
	#endregion
	
	#region cancel button - go back to unit options
	
		if (objInputManager.pressed.cancel) { BackToUnitMenu(); }
	
	#endregion
}


function BattleStatePlayerTurnAttackConfirmation ()
{
	#region menu navigation
		
		MenuNavigation();
		
	#endregion
	
	#region confirm attack target
	
		if (objInputManager.pressed.select)
		{
			var _selectedOption = menuOptions[menuIndex];
			switch (_selectedOption)
			{
				case MENU_OPTION_CONFIRM:
					GoToUnitAttacking();
					break;
				
				case MENU_OPTION_CANCEL:
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


function BattleStatePlayerTurnPostMoveUnitMenu ()
{
	#region menu navigation
	
		MenuNavigation();
	
	#endregion
	
	#region unit menu selection
	
		if (objInputManager.pressed.select)
		{
			var _selectedOption = menuOptions[menuIndex];
			switch (_selectedOption)
			{
				case MENU_OPTION_ATTACK:
					GoToPostMoveUnitAttack();
					break;
				
				case MENU_OPTION_GO_BACK:
					UndoUnitMove();
					break;
				
				case MENU_OPTION_END:
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
	#region update facing
		
		if (objBattleCursor.hasChangedLocation) { UpdateUnitFacingToCursor(); }
		
	#endregion
	
	#region confirm target
	
		if (objInputManager.pressed.select) { GoToAttackConfirmation(); }
	
	#endregion
	
	#region cancel button - go back to unit options
	
		if (objInputManager.pressed.cancel) { BackToPostMoveUnitMenu(); }
	
	#endregion
}


function BattleStateUnitAttacking ()
{
	#region calculate animation frames
		
		var _attackFramesPerDir = selectedUnit.image_number / UNIT_DIRECTIONS;
		var _attackStartFrame = selectedUnit.facingDirection * _attackFramesPerDir;
		
		var _attackEndFrame = _attackStartFrame + _attackFramesPerDir;
		var _attackFinished = (selectedUnit.image_index >= _attackEndFrame - selectedUnit.image_speed);
		
		// Impact usually happens about halfway through the attack animation
		var _impactFrame = _attackStartFrame + (_attackFramesPerDir * 0.5);
		
	#endregion
	
	#region attack animation and target is hit
	
		if (!unitHasHit && selectedUnit.image_index >= _impactFrame)   // Attack connects
		{
			attackTargetUnit.currentHp -= damageInfo.amount;
			unitHasHit = true;
			
			MoveBattleCursor(attackTargetUnit.x, attackTargetUnit.y);
			
			ShowFloatingDamageText(damageInfo);
			PlayDamageSfx(damageInfo.type);
			DamageScreenShake(damageInfo.type);
			
			// Trigger target's hurt animation
			attackTargetUnit.facingDirection = (selectedUnit.facingDirection + (UNIT_DIRECTIONS / 2)) % UNIT_DIRECTIONS;
			var _targetFramesPerDir = attackTargetUnit.image_number / UNIT_DIRECTIONS;
			var _targetStartFrame = attackTargetUnit.facingDirection * _targetFramesPerDir;
			attackTargetUnit.sprite_index = attackTargetUnit.hurtSprite;
			attackTargetUnit.image_speed  = HURT_IMAGE_SPEED;
			attackTargetUnit.image_index  = _targetStartFrame;
		}
	
	#endregion
	
	#region attacking has finished - reset flags, cursor, disable unit, and unselect unit
		
		if (_attackFinished)
	    {
			// Reset attacker sprite and disable the unit
			selectedUnit.sprite_index = selectedUnit.idleSprite;
	        selectedUnit.image_speed  = IDLE_IMAGE_SPEED;
	        //selectedUnit.isEnabled    = false;
			
			// Reset target sprite
			attackTargetUnit.sprite_index = attackTargetUnit.idleSprite;
	        attackTargetUnit.image_speed  = IDLE_IMAGE_SPEED;
			
			MoveBattleCursor(selectedUnit.x, selectedUnit.y);
	        objBattleCursor.visible = true;
			
			attackTargetUnit = noone;
	        damageInfo = noone;
			unitHasHit = false;
			UnselectUnit();
		}
		
	#endregion
}



// Helper Functions

function MenuNavigation ()
{
	if (objInputManager.pressed.down)
	{
		menuIndex++;
        if (menuIndex >= array_length(menuOptions)) { menuIndex = 0; }
	}
		
	if (objInputManager.pressed.up)
    {
		menuIndex--;
        if (menuIndex < 0) menuIndex = array_length(menuOptions)-1;
    }
}

function ClearMenu ()
{
	array_delete(menuOptions, 0, array_length(menuOptions));
	menuIndex = -1;
}

function UnselectUnit ()
{
	selectedUnit = noone;
	ClearMenu();
	CursorToFreeState();
	battleState = BattleStatePlayerTurnFree;
}

function GoToSystemMenu ()
{
	array_push(menuOptions, MENU_OPTION_END_TURN);
	array_push(menuOptions, MENU_OPTION_TYPE_CHART);
	array_push(menuOptions, MENU_OPTION_SETTINGS);
	array_push(menuOptions, MENU_OPTION_HELP);
	array_push(menuOptions, MENU_OPTION_SURRENDER);
	array_push(menuOptions, MENU_OPTION_CANCEL);
	menuIndex = 0;
			
	CursorPause();
	battleState = BattleStateSystemMenu;
}

function BackFromSystemMenu ()
{
	ClearMenu();
	CursorUnpause();
	objBattleManager.battleState = BattleStatePlayerTurnFree;
}

function GoToUnitMenu ()
{
	var _cell = map[# objBattleCursor.mapX, objBattleCursor.mapY];
	if (_cell != undefined && _cell.unit != noone && _cell.unit.team == whoseTurn && _cell.unit.isEnabled)
	{
		selectedUnit = _cell.unit;
				
		array_push(menuOptions, MENU_OPTION_MOVE);
		array_push(menuOptions, MENU_OPTION_ATTACK);
		array_push(menuOptions, MENU_OPTION_CANCEL);
		menuIndex = 0;
				
		CursorToFrozenState();
		battleState = BattleStatePlayerTurnUnitMenu;
	}
}

function BackToUnitMenu ()
{
	ClearMapFlags(map);
	selectedUnit.facingDirection = Direction.SOUTH;
	MoveBattleCursor(selectedUnit.x, selectedUnit.y);
	CursorToFrozenState();
	battleState = BattleStatePlayerTurnUnitMenu;
}

function GoToUnitMove ()
{
	CursorToFreeState();
	battleState = BattleStatePlayerTurnUnitMove;
	ShowMoveRange(selectedUnit);
	ShowAttackRange(objBattleCursor.mapX, objBattleCursor.mapY, selectedUnit);
	// Do not change the menu options and index
}

function GoToUnitAttack ()
{
	CursorToFreeState();
	battleState = BattleStatePlayerTurnUnitAttack;
	ShowAttackRange(objBattleCursor.mapX, objBattleCursor.mapY, selectedUnit);
	// Do not change the menu options and index
}

function UpdateAttackTiles ()
{
	ClearAttackFlags(map);
	
	var _targetX = objBattleCursor.mapX;
	var _targetY = objBattleCursor.mapY;
	var _targetCell = map[# _targetX, _targetY];
	var _unitCellX = selectedUnit.x div CELL_SIZE;
	var _unitCellY = selectedUnit.y div CELL_SIZE;
	
	if (_targetCell.canMove || (_targetX == _unitCellX && _targetY == _unitCellY)) { ShowAttackRange(_targetX, _targetY, selectedUnit); }
}

function GoToUnitMoving ()
{
	var _targetX = objBattleCursor.mapX;
	var _targetY = objBattleCursor.mapY;
	var _targetCell = map[# _targetX, _targetY];
	
	if (_targetCell != undefined && _targetCell.canMove)
	{
		var _unitCellX = selectedUnit.x div CELL_SIZE;
		var _unitCellY = selectedUnit.y div CELL_SIZE;
		
		unitOriginalMapX = _unitCellX;
		unitOriginalMapY = _unitCellY;
		unitTargetMapX = _targetX;
		unitTargetMapY = _targetY;
		
		map[# _unitCellX, _unitCellY].unit = noone;
		_targetCell.unit = selectedUnit;
		
		CursorToFrozenState();
		objBattleCursor.visible = false;
		battleStateTemp = BattleStatePlayerTurnPostMoveUnitMenu;
		battleState = BattleStateUnitMoving;
		
		ClearMenu();
		ClearMapFlags(map);
		selectedUnit.sprite_index = selectedUnit.walkSprite;
		selectedUnit.image_speed = WALK_IMAGE_SPEED;
		selectedUnit.image_index = 0;
	}
}

function UndoUnitMove ()
{
	var _currentX = selectedUnit.x div CELL_SIZE;
	var _currentY = selectedUnit.y div CELL_SIZE;
	
	map[# _currentX, _currentY].unit = noone;
	map[# unitOriginalMapX, unitOriginalMapY].unit = selectedUnit;
	
	selectedUnit.x = (unitOriginalMapX * CELL_SIZE) + CENTER_CELL;
	selectedUnit.y = (unitOriginalMapY * CELL_SIZE) + CENTER_CELL;
	selectedUnit.facingDirection = Direction.SOUTH;
	selectedUnit.sprite_index = selectedUnit.idleSprite;
	
	objBattleCursor.x = selectedUnit.x;
	objBattleCursor.y = selectedUnit.y;
	objBattleCursor.mapX = unitOriginalMapX;
	objBattleCursor.mapY = unitOriginalMapY;
	
	unitOriginalMapX = RESET_CELL_COORDINATE;
	unitOriginalMapY = RESET_CELL_COORDINATE;
	
	ClearMenu();
	array_push(menuOptions, MENU_OPTION_MOVE);
	array_push(menuOptions, MENU_OPTION_ATTACK);
	array_push(menuOptions, MENU_OPTION_CANCEL);
	menuIndex = 0;
	
	CursorToFreeState();
	ShowMoveRange(selectedUnit);
	ShowAttackRange(objBattleCursor.mapX, objBattleCursor.mapY, selectedUnit);
	battleState = BattleStatePlayerTurnUnitMove;
}

function GoToAttackConfirmation ()
{
	var _cell = map[# objBattleCursor.mapX, objBattleCursor.mapY];
	if (_cell != undefined && _cell.canAttack && _cell.unit != noone && _cell.unit.team != whoseTurn)
	{
		attackTargetUnit = _cell.unit;
		battleStateTemp = battleState;
		
		ClearMenu();
		array_push(menuOptions, MENU_OPTION_CONFIRM);
		array_push(menuOptions, MENU_OPTION_CANCEL);
		menuIndex = 0;
		
		damageInfo = GetDamageInfo(selectedUnit, attackTargetUnit);
		CursorToFrozenState();
		battleState = BattleStatePlayerTurnAttackConfirmation;
	}
}

function BackFromAttackConfirmation ()
{
	ClearMenu();
	if (battleStateTemp == BattleStatePlayerTurnUnitAttack)
	{
		array_push(menuOptions, MENU_OPTION_MOVE);
		array_push(menuOptions, MENU_OPTION_ATTACK);
		array_push(menuOptions, MENU_OPTION_CANCEL);
		menuIndex = 1;
	}
	else if (battleStateTemp == BattleStatePlayerTurnPostMoveUnitAttack)
	{
		array_push(menuOptions, MENU_OPTION_ATTACK);
		array_push(menuOptions, MENU_OPTION_GO_BACK);
		array_push(menuOptions, MENU_OPTION_END);
		menuIndex = 0;
	}
	
	CursorToFreeState();
	attackTargetUnit = noone;
	battleState = battleStateTemp;
	battleStateTemp = noone;
	damageInfo = noone;
}

function GoToUnitAttacking ()
{
	CursorToFrozenState();
	objBattleCursor.visible = false;
	ClearAttackFlags(map);
	ClearMenu();
					
	selectedUnit.sprite_index = selectedUnit.attackSprite;
	selectedUnit.image_speed = ATTACK_IMAGE_SPEED;
					
	var _framesPerDir = selectedUnit.image_number / UNIT_DIRECTIONS;
	var _attackStartFrame = selectedUnit.facingDirection * _framesPerDir;
	selectedUnit.image_index = _attackStartFrame;
					
	MoveBattleCursor(selectedUnit.x, selectedUnit.y);
	battleState = BattleStateUnitAttacking;
}

function GoToPostMoveUnitAttack ()
{
	CursorToFreeState();
	battleState = BattleStatePlayerTurnPostMoveUnitAttack;
	var _unitMapX = selectedUnit.x div CELL_SIZE;
	var _unitMapY = selectedUnit.y div CELL_SIZE;
	ShowAttackRange(_unitMapX, _unitMapY, selectedUnit);
}

function BackToPostMoveUnitMenu ()
{
	ClearAttackFlags(map);
	selectedUnit.facingDirection = Direction.SOUTH;
	MoveBattleCursor(selectedUnit.x, selectedUnit.y);
	CursorToFrozenState();
	battleState = BattleStatePlayerTurnPostMoveUnitMenu;
}
