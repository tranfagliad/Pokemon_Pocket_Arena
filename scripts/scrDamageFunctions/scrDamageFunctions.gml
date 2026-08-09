
// Accesses the type chart in a way that accomodates Type.NONE in the enum
function GetTypeAdvantageMultiplier (_typeChart, _attackerType, _defenderType)
{
	return ds_grid_get(_typeChart, _defenderType-1, _attackerType-1);
}


// Get the damage type with the given advantage multiplier
function GetDamageType (_damageMultiplier)
{
	switch (_damageMultiplier)
	{
		case NOT_VERY_EFFECTIVE_MULT:
			return DamageType.NOT_VERY_EFFECTIVE;
		case SUPER_EFFECTIVE_MULT:
			return DamageType.SUPER_EFFECTIVE;
		default:
			return DamageType.NORMAL_EFFECTIVE;
	}
}


// Returns the row of multipliers of the given attacker type
function GetTypeAttackerMultipliers (_typeChart, _attackerType)
{
	if (_attackerType == Type.NONE) { return noone; }
	
	var _multipliers = array_create(NUM_TYPES+1, NORMAL_EFFECTIVE_MULT);
	for (var _col = 0; _col < NUM_TYPES; _col++)
	{
		var _targetDefenderType = _col + 1;
		_multipliers[_targetDefenderType] = GetTypeAdvantageMultiplier(_typeChart, _attackerType, _targetDefenderType);
	}
	return _multipliers;
}


// Returns the column of weaknesses of the given defender type
function GetTypeDefenderMultipliers (_typeChart, _defenderType)
{
	if (_defenderType == Type.NONE) { return noone; }
	
	var _multipliers = array_create(NUM_TYPES + 1, NORMAL_EFFECTIVE_MULT);
	for (var _row = 0; _row < NUM_TYPES; _row++)
	{
		var _targetAttackerType = _row + 1;
		_multipliers[_targetAttackerType] = GetTypeAdvantageMultiplier(_typeChart, _targetAttackerType, _defenderType);
	}
	return _multipliers;
}
