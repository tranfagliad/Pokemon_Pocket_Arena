
// Using the unit info, create the unit, register it on a team list,
// then place it on the given map at the given (X,Y) coordinates.
function CreateUnitAndPlaceOnMap (_unit_info, _map, _mapX, _mapY)
{
	var _team_list = (_unit_info.team == Team.ONE) ? teamOneUnits : teamTwoUnits;
	
	var _unit = instance_create_layer(0, 0, UNITS_LAYER, objUnit);
	_unit.team = _unit_info.team;
	_unit.name = _unit_info.name;
	_unit.level = _unit_info.level;
	_unit.maxHp = _unit_info.hp;
	_unit.currentHp = _unit.maxHp;
	_unit.activeType = _unit_info.activeType;
	_unit.attackStat = _unit_info.attackStat;
	_unit.defenseStat = _unit_info.defenseStat;
	_unit.moveRange = _unit_info.moveRange;
	_unit.moveDistance = _unit_info.moveDistance;
	_unit.attackRange = _unit_info.attackRange;
	_unit.attackDistance = _unit_info.attackDistance;
	//_unit.isEnabled = true;
	
	_unit.sprite_index = (_unit_info.team == Team.ONE) ? sprPlaceholderUnitBlue : sprPlaceholderUnitRed;
	_unit.x = (_mapX * CELL_SIZE) + CENTER_CELL;
	_unit.y = (_mapY * CELL_SIZE) + CENTER_CELL;
	
	ds_list_add(_team_list, _unit);
	_map[# _mapX, _mapY].unit = _unit;
}



function CalculateDamage (_attackingUnit, _defendingUnit)
{
    var _typeMultiplier = GetTypeAdvantageMultiplier(typeChart, _attackingUnit.activeType, _defendingUnit.activeType);
    var _def = max(1, _defendingUnit.defenseStat);
    
    var _levelFactor = ((2 * _attackingUnit.level) / 5) + 2;
    var _statRatio = _attackingUnit.attackStat / _def;
    
    var _baseDamage = (_levelFactor * _statRatio * (_attackingUnit.attackStat / 10)) + 2;
    
    return max(1, floor(_baseDamage * _typeMultiplier));
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



// Clear all flags
function ClearMapFlags (_map)
{
    var _count = ds_list_size(activeRangeTiles);
    for (var _i = 0; _i < _count; _i++)
    {
        var _coord = activeRangeTiles[| _i];
        var _cell = _map[# _coord.mapX, _coord.mapY];
        
        _cell.canMove = false;
        _cell.canAttack = false;
    }
    
    ds_list_clear(activeRangeTiles);
}



// Clear ONLY attack flags
function ClearAttackFlags (_map)
{
    var _count = ds_list_size(activeRangeTiles);
    for (var _i = 0; _i < _count; _i++)
    {
        var _coord = activeRangeTiles[| _i];
        var _cell = _map[# _coord.mapX, _coord.mapY];
        
        _cell.canAttack = false;
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
        
        // Movement Rules
        if (!_isAttack) 
        {
            if (_cellUnit != noone) { break; }
            _cell.canMove = true;
			ds_list_add(activeRangeTiles, { mapX: _targetX, mapY: _targetY });
        }
        // Attack Rules
        else 
        {
            if (_cellUnit != noone)
            {
                if (_cellUnit.team == _attackerTeam) { break; }
                else
                {
                    _cell.canAttack = true;
					ds_list_add(activeRangeTiles, { mapX: _targetX, mapY: _targetY });
                    break;
                }
            }
            else
			{
				_cell.canAttack = true;
				ds_list_add(activeRangeTiles, { mapX: _targetX, mapY: _targetY });	
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
		ds_list_add(activeRangeTiles, { mapX: _targetX2, mapY: _targetY2 });
    }
    // Attack Rules
    else
    {
        if (_cellUnit2 != noone)
        {
            if (_cellUnit2.team == _attackerTeam) { return; }
            _cell2.canAttack = true;
			ds_list_add(activeRangeTiles, { mapX: _targetX2, mapY: _targetY2 });
        }
        else
		{
			_cell2.canAttack = true;
			ds_list_add(activeRangeTiles, { mapX: _targetX2, mapY: _targetY2 });
		}
    }
}
