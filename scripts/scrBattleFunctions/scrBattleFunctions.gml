
// Using the unit info, create the unit, register it on a team list,
// then place it on the given map at the given (X,Y) coordinates.
function CreateUnitAndPlaceOnMap (_unitInfo, _map, _mapX, _mapY)
{
	var _unit = instance_create_layer(0, 0, UNITS_LAYER, objUnit);
	
	#region battle stats
		
		_unit.uId = _unitInfo.uId;
		_unit.team = _unitInfo.team;
		_unit.name = _unitInfo.name;
		_unit.level = _unitInfo.level;
		_unit.maxHp = _unitInfo.hp;
		_unit.currentHp = _unit.maxHp;
		_unit.activeType = _unitInfo.activeType;
		_unit.attackStat = _unitInfo.attackStat;
		_unit.defenseStat = _unitInfo.defenseStat;
		_unit.moveRange = _unitInfo.moveRange;
		_unit.moveDistance = _unitInfo.moveDistance;
		_unit.attackRange = _unitInfo.attackRange;
		_unit.attackDistance = _unitInfo.attackDistance;
		
	#endregion
	
	#region load field animations
		
		_unit.displaySprite = LoadDisplaySprite(_unit.uId);
		
		_unit.idleAnimation = LoadUnitMapAnimation(_unit.uId, IDLE_ANIMATION);
		_unit.walkAnimation = LoadUnitMapAnimation(_unit.uId, WALK_ANIMATION);
		_unit.attackAnimation = LoadUnitMapAnimation(_unit.uId, ATTACK_ANIMATION);
		_unit.hurtAnimation = LoadUnitMapAnimation(_unit.uId, HURT_ANIMATION);
		_unit.faintAnimation = LoadUnitMapAnimation(_unit.uId, FAINT_ANIMATION);
		
	#endregion
	
	#region other details
		
		_unit.sprite_index = _unit.idleAnimation.sprite;
		_unit.shadowAnimation = _unit.idleAnimation.shadow;
		_unit.image_speed = IDLE_IMAGE_SPEED;
		_unit.x = (_mapX * CELL_SIZE) + CENTER_CELL;
		_unit.y = (_mapY * CELL_SIZE) + CENTER_CELL;
		
	#endregion
	
	#region register on the team list and map
		
		var _team_list = (_unit.team == Team.ONE) ? teamOneUnits : teamTwoUnits;
		ds_list_add(_team_list, _unit);
		_map[# _mapX, _mapY].unit = _unit;
		
	#endregion
}


function ShowMoveRange (_unit)
{
	if (_unit == noone) { return; }
	
	var _unitCellX = _unit.x div CELL_SIZE;
	var _unitCellY = _unit.y div CELL_SIZE;
	var _moveDistance = _unit.moveDistance;
	
	switch (_unit.moveRange)
	{
		case Range.STRAIGHT:
			ShowStraightRange(_unitCellX, _unitCellY, _moveDistance, false, _unit.team, _unit);
			break;
		case Range.DIAGONAL:
			ShowDiagonalRange(_unitCellX, _unitCellY, _moveDistance, false, _unit.team, _unit);
			break;
		case Range.MATRIX:
			ShowMatrixRange(_unitCellX, _unitCellY, _moveDistance, false, _unit.team, _unit);
			break;
		default: break;
	}
}


function ShowAttackRange (_cellX, _cellY, _unit)
{
	if (_unit == noone) { return; }
	
	var _attackDistance = _unit.attackDistance;
	
	switch (_unit.attackRange)
	{
		case Range.STRAIGHT:
			ShowStraightRange(_cellX, _cellY, _attackDistance, true, _unit.team, _unit);
			break;
		case Range.DIAGONAL:
			ShowDiagonalRange(_cellX, _cellY, _attackDistance, true, _unit.team, _unit);
			break;
		case Range.MATRIX:
			ShowMatrixRange(_cellX, _cellY, _attackDistance, true, _unit.team, _unit);
			break;
		default: break;
	}
}


function DisableAllUnits (_team)
{
	var _unitList = (_team == Team.ONE) ? teamOneUnits : teamTwoUnits;
	var _listSize = ds_list_size(_unitList);
	for (var _i = 0; _i < _listSize; _i++) { ds_list_find_value(_unitList, _i).isEnabled = false; }
}


function EnableAllUnits (_team)
{
	var _unitList = (_team == Team.ONE) ? teamOneUnits : teamTwoUnits;
	var _listSize = ds_list_size(_unitList);
	for (var _i = 0; _i < _listSize; _i++) { ds_list_find_value(_unitList, _i).isEnabled = true; }
}


// Create the initial map
function InitializeMap ()
{
	var _map = ds_grid_create(mapWidth, mapHeight);
	for (var _x = 0; _x < mapWidth; _x++)
	{
		for (var _y = 0; _y < mapHeight; _y++)
		{
			_map[# _x, _y] = { 
				terrain: noone,
				unit: noone,
				moveable: true,
				canMove: false,
				canAttack: false
			};
		}
	}
	return _map;
}


// Destroy the entire map
function CleanUpMap ()
{
	if (ds_exists(map, ds_type_grid))
	{
	    for (var _x = 0; _x < mapWidth; _x++)
	    {
	        for (var _y = 0; _y < mapHeight; _y++)
	        {
	            map[# _x, _y] = noone;
	        }
	    }
	    ds_grid_destroy(map);
		map = noone;
	}
}


// Clear all flags
function ClearMapFlags (_map)
{
    var _count = ds_list_size(activeMoveTiles);
    for (var _i = 0; _i < _count; _i++)
    {
        var _coord = activeMoveTiles[| _i];
        var _cell = _map[# _coord.mapX, _coord.mapY];
        _cell.canMove = false;
    }
	ds_list_clear(activeMoveTiles);
    
    _count = ds_list_size(activeAttackTiles);
	for (var _i = 0; _i < _count; _i++)
	{
		var _coord = activeAttackTiles[| _i];
        var _cell = _map[# _coord.mapX, _coord.mapY];
		_cell.canAttack = false;
	}
	ds_list_clear(activeAttackTiles);
}


// Clear ONLY attack flags
function ClearAttackFlags (_map)
{
    var _count = ds_list_size(activeAttackTiles);
    for (var _i = 0; _i < _count; _i++)
    {
        var _coord = ds_list_find_value(activeAttackTiles, _i);
        var _cell = ds_grid_get(_map, _coord.mapX, _coord.mapY);
        _cell.canAttack = false;
    }
	ds_list_clear(activeAttackTiles);
}


// Updates the selected unit's direction based on cursor position
function UpdateUnitFacingToCursor ()
{
	if (selectedUnit == noone) { return; }
	
	var _unitCellX = selectedUnit.x div CELL_SIZE;
    var _unitCellY = selectedUnit.y div CELL_SIZE;
    var _cursorX = objBattleCursor.mapX;
    var _cursorY = objBattleCursor.mapY;
	
	if (_cursorX != _unitCellX || _cursorY != _unitCellY)
    {
        var _unitPxX = (_unitCellX * CELL_SIZE) + CENTER_CELL;
        var _unitPxY = (_unitCellY * CELL_SIZE) + CENTER_CELL;
        var _cursorPxX = (_cursorX * CELL_SIZE) + CENTER_CELL;
        var _cursorPxY = (_cursorY * CELL_SIZE) + CENTER_CELL;
        
        var _angle = point_direction(_unitPxX, _unitPxY, _cursorPxX, _cursorPxY);
        selectedUnit.facingDirection = Get8WayDirection(_angle);
    }
}



// Helper Functions

function ShowStraightRange (_unitCellX, _unitCellY, _distance, _isAttack = false, _team = noone, _ignoreUnit = noone)
{
    ScanDirection(_unitCellX, _unitCellY, -1,  0, _distance, _isAttack, _team, _ignoreUnit);   // Left
    ScanDirection(_unitCellX, _unitCellY,  1,  0, _distance, _isAttack, _team, _ignoreUnit);   // Right
    ScanDirection(_unitCellX, _unitCellY,  0, -1, _distance, _isAttack, _team, _ignoreUnit);   // Up
    ScanDirection(_unitCellX, _unitCellY,  0,  1, _distance, _isAttack, _team, _ignoreUnit);   // Down
}

function ShowDiagonalRange (_unitCellX, _unitCellY, _distance, _isAttack = false, _team = noone, _ignoreUnit = noone)
{
    ScanDirection(_unitCellX, _unitCellY, -1, -1, _distance, _isAttack, _team, _ignoreUnit);   // Top-Left
    ScanDirection(_unitCellX, _unitCellY,  1, -1, _distance, _isAttack, _team, _ignoreUnit);   // Top-Right
    ScanDirection(_unitCellX, _unitCellY, -1,  1, _distance, _isAttack, _team, _ignoreUnit);   // Bottom-Left
    ScanDirection(_unitCellX, _unitCellY,  1,  1, _distance, _isAttack, _team, _ignoreUnit);   // Bottom-Right
}

function ShowMatrixRange (_unitCellX, _unitCellY, _distance, _isAttack = false, _team = noone, _ignoreUnit = noone)
{
    ScanMatrixDirection(_unitCellX, _unitCellY, -1,  0, _isAttack, _team, _ignoreUnit);   // Left
    ScanMatrixDirection(_unitCellX, _unitCellY,  1,  0, _isAttack, _team, _ignoreUnit);   // Right
    ScanMatrixDirection(_unitCellX, _unitCellY,  0, -1, _isAttack, _team, _ignoreUnit);   // Up
    ScanMatrixDirection(_unitCellX, _unitCellY,  0,  1, _isAttack, _team, _ignoreUnit);   // Down
    
    ScanMatrixDirection(_unitCellX, _unitCellY, -1, -1, _isAttack, _team, _ignoreUnit);   // Top-Left
    ScanMatrixDirection(_unitCellX, _unitCellY,  1, -1, _isAttack, _team, _ignoreUnit);   // Top-Right
    ScanMatrixDirection(_unitCellX, _unitCellY, -1,  1, _isAttack, _team, _ignoreUnit);   // Bottom-Left
    ScanMatrixDirection(_unitCellX, _unitCellY,  1,  1, _isAttack, _team, _ignoreUnit);   // Bottom-Right
}

function ScanDirection (_startX, _startY, _dirX, _dirY, _dist, _isAttack = false, _attackerTeam = noone, _ignoreUnit = noone)
{
    for (var _i = 1; _i <= _dist; _i++)
    {
        var _targetX = _startX + (_dirX * _i);
        var _targetY = _startY + (_dirY * _i);
        if (_targetX < 0 || _targetX >= mapWidth || _targetY < 0 || _targetY >= mapHeight) { break; } 
        
        var _cell = map[# _targetX, _targetY];
        if (_cell.moveable == false) { break; }
        
        var _cellUnit = _cell.unit;
        if (_cellUnit == _ignoreUnit) { _cellUnit = noone; }
        
        if (!_isAttack) 
        {
            if (_cellUnit != noone) { break; }
            
            _cell.canMove = true;
            ds_list_add(activeMoveTiles, { mapX: _targetX, mapY: _targetY });
        }
        else 
        {
            if (_cellUnit != noone)
            {
                if (_cellUnit.team == _attackerTeam) { break; }
                else
                {
                    _cell.canAttack = true;
                    ds_list_add(activeAttackTiles, { mapX: _targetX, mapY: _targetY });
                    break;
                }
            }
            else
            {
                _cell.canAttack = true;
                ds_list_add(activeAttackTiles, { mapX: _targetX, mapY: _targetY }); 
            }
        }
    }
}

function ScanMatrixDirection (_startX, _startY, _dirX, _dirY, _isAttack = false, _attackerTeam = noone, _ignoreUnit = noone)
{
    var _targetX1 = _startX + _dirX;
    var _targetY1 = _startY + _dirY;
    if (_targetX1 < 0 || _targetX1 >= mapWidth || _targetY1 < 0 || _targetY1 >= mapHeight) { return; }
    
    var _cell1 = map[# _targetX1, _targetY1];
    if (_cell1.moveable == false) { return; }
    
    var _cellUnit1 = _cell1.unit;
    if (_cellUnit1 == _ignoreUnit) { _cellUnit1 = noone; }
    if (_cellUnit1 != noone) { return; }
    
    var _targetX2 = _startX + (_dirX * 2);
    var _targetY2 = _startY + (_dirY * 2);
    if (_targetX2 < 0 || _targetX2 >= mapWidth || _targetY2 < 0 || _targetY2 >= mapHeight) { return; }
    
    var _cell2 = map[# _targetX2, _targetY2];
    if (_cell2.moveable == false) { return; }
    
    var _cellUnit2 = _cell2.unit;
    if (_cellUnit2 == _ignoreUnit) { _cellUnit2 = noone; }
    
    // Movement Rules
    if (!_isAttack)
    {
        if (_cellUnit2 != noone) { return; }
        _cell2.canMove = true;
		ds_list_add(activeMoveTiles, { mapX: _targetX2, mapY: _targetY2 });
    }
    // Attack Rules
    else
    {
        if (_cellUnit2 != noone)
        {
            if (_cellUnit2.team == _attackerTeam) { return; }
            _cell2.canAttack = true;
			ds_list_add(activeAttackTiles, { mapX: _targetX2, mapY: _targetY2 });
        }
        else
		{
			_cell2.canAttack = true;
			ds_list_add(activeAttackTiles, { mapX: _targetX2, mapY: _targetY2 });
		}
    }
}

function Get8WayDirection (_angle)
{
	_angle = (_angle + FULL_REVOLUTION) % FULL_REVOLUTION;
	
	var _sector = floor((_angle + CENTER_SECTOR) / DIRECTION_SECTOR) % UNIT_DIRECTIONS;
	switch (_sector)
	{
		case 0: return Direction.EAST;
		case 1: return Direction.NORTHEAST;
		case 2: return Direction.NORTH;
		case 3: return Direction.NORTHWEST;
		case 4: return Direction.WEST;
		case 5: return Direction.SOUTHWEST;
		case 6: return Direction.SOUTH;
		case 7: return Direction.SOUTHEAST;
		default: return Direction.SOUTH;
	}
}
