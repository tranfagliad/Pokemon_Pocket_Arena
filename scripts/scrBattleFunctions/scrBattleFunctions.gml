
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
	_unit.hasMoved = false;
	_unit.hasAttacked = false;
	
	_unit.sprite_index = (_unit_info.team == Team.ONE) ? sprPlaceholderUnitBlue : sprPlaceholderUnitRed;
	_unit.x = (_mapX * CELL_SIZE) + CENTER_CELL;
	_unit.y = (_mapY * CELL_SIZE) + CENTER_CELL;
	
	ds_list_add(_team_list, _unit);
	_map[# _mapX, _mapY].unit = _unit;
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
			ShowStraightRange(_unitCellX, _unitCellY, _moveDistance);
			break;
		case Range.DIAGONAL:
			ShowDiagonalRange(_unitCellX, _unitCellY, _moveDistance);
			break;
		case Range.MATRIX:
			ShowMatrixRange(_unitCellX, _unitCellY, _moveDistance);
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
			ShowStraightRange(_cellX, _cellY, _attackDistance, true);
			break;
		case Range.DIAGONAL:
			ShowDiagonalRange(_cellX, _cellY, _attackDistance, true);
			break;
		case Range.MATRIX:
			ShowMatrixRange(_cellX, _cellY, _attackDistance, true);
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
	for (var _x = 0; _x < mapWidth; _x++)
    {
        for (var _y = 0; _y < mapHeight; _y++)
        {
            _map[# _x, _y].canMove = false;
            _map[# _x, _y].canAttack = false;
        }
    }
}



// Clear ONLY attack flags
function ClearAttackFlags (_map)
{
    for (var _x = 0; _x < mapWidth; _x++)
    {
        for (var _y = 0; _y < mapHeight; _y++)
        {
            _map[# _x, _y].canAttack = false;
        }
    }
}



// Helper Functions

function ShowStraightRange (_unitCellX, _unitCellY, _distance, _isAttack = false)
{
    ScanDirection(_unitCellX, _unitCellY, -1,  0, _distance, _isAttack);   // Left
    ScanDirection(_unitCellX, _unitCellY,  1,  0, _distance, _isAttack);   // Right
    ScanDirection(_unitCellX, _unitCellY,  0, -1, _distance, _isAttack);   // Up
    ScanDirection(_unitCellX, _unitCellY,  0,  1, _distance, _isAttack);   // Down
}

function ShowDiagonalRange (_unitCellX, _unitCellY, _distance, _isAttack = false)
{
    ScanDirection(_unitCellX, _unitCellY, -1, -1, _distance, _isAttack);   // Top-Left
    ScanDirection(_unitCellX, _unitCellY,  1, -1, _distance, _isAttack);   // Top-Right
    ScanDirection(_unitCellX, _unitCellY, -1,  1, _distance, _isAttack);   // Bottom-Left
    ScanDirection(_unitCellX, _unitCellY,  1,  1, _distance, _isAttack);   // Bottom-Right
}

function ShowMatrixRange (_unitCellX, _unitCellY, _distance, _isAttack = false)
{
    ScanMatrixDirection(_unitCellX, _unitCellY, -1,  0, _isAttack); // Left
    ScanMatrixDirection(_unitCellX, _unitCellY,  1,  0, _isAttack); // Right
    ScanMatrixDirection(_unitCellX, _unitCellY,  0, -1, _isAttack); // Up
    ScanMatrixDirection(_unitCellX, _unitCellY,  0,  1, _isAttack); // Down
    
    ScanMatrixDirection(_unitCellX, _unitCellY, -1, -1, _isAttack); // Top-Left
    ScanMatrixDirection(_unitCellX, _unitCellY,  1, -1, _isAttack); // Top-Right
    ScanMatrixDirection(_unitCellX, _unitCellY, -1,  1, _isAttack); // Bottom-Left
    ScanMatrixDirection(_unitCellX, _unitCellY,  1,  1, _isAttack); // Bottom-Right
}

function ScanDirection (_startX, _startY, _dirX, _dirY, _dist, _isAttack = false)
{
    for (var _i = 1; _i <= _dist; _i++)
    {
        var _targetX = _startX + (_dirX * _i);
        var _targetY = _startY + (_dirY * _i);
        
        if (_targetX < 0 || _targetX >= mapWidth || _targetY < 0 || _targetY >= mapHeight) { break; } 
        
        var _cell = map[# _targetX, _targetY];
        
        if (_cell.moveable == false) { break; }
        if (!_isAttack && _cell.unit != noone) { break; }
        
        if (_isAttack) { _cell.canAttack = true; }
		else { _cell.canMove = true; }
    }
}

function ScanMatrixDirection (_startX, _startY, _dirX, _dirY, _isAttack = false)
{
    var _targetX1 = _startX + _dirX;
    var _targetY1 = _startY + _dirY;
    if (_targetX1 < 0 || _targetX1 >= mapWidth || _targetY1 < 0 || _targetY1 >= mapHeight) { return; }
    
    var _cell1 = map[# _targetX1, _targetY1];
    if (_cell1.moveable == false) { return; }
    if (!_isAttack && _cell1.unit != noone) { return; }
    
    var _targetX2 = _startX + (_dirX * 2);
    var _targetY2 = _startY + (_dirY * 2);
    if (_targetX2 < 0 || _targetX2 >= mapWidth || _targetY2 < 0 || _targetY2 >= mapHeight) { return; }
    
    var _cell2 = map[# _targetX2, _targetY2];
    if (_cell2.moveable == false) { return; }
    if (!_isAttack && _cell2.unit != noone) { return; }
    
    if (_isAttack) { _cell2.canAttack = true; }
	else { _cell2.canMove = true; }
}
