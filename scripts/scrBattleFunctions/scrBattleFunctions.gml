
// Using the unit info, create the unit, register it on a team list,
// then place it on the given map at the given (X,Y) coordinates.
function CreateUnitAndPlaceOnMap (_unit_info, _map, _mapX, _mapY)
{
	var _team_list = (_unit_info.team == Team.ONE) ? teamOneUnits : teamTwoUnits;
	
	var _unit = instance_create_layer(0, 0, UNITS_LAYER, objUnit);
	_unit.team = _unit_info.team;
	_unit.name = _unit_info.name;
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
	ds_grid_set(_map, _mapX, _mapY, { terrain: noone, unit: _unit });
}
