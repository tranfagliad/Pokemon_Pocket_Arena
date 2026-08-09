
function CalculateDamage (_attackingUnit, _defendingUnit)
{
    var _typeAdvantage = GetTypeAdvantage(typeChart, _attackingUnit.activeType, _defendingUnit.activeType);
	var _damageMultiplier = GetTypeDamageMultiplier(_typeAdvantage);
	
    var _def = max(1, _defendingUnit.defenseStat);
    
    var _levelFactor = ((2 * _attackingUnit.level) / 5) + 2;
    var _statRatio = _attackingUnit.attackStat / _def;
    
    var _baseDamage = (_levelFactor * _statRatio * (_attackingUnit.attackStat / 10)) + 2;
    var _finalDamage = max(1, floor(_baseDamage * _damageMultiplier));
	
    return min(_defendingUnit.currentHp, _finalDamage);
}


function ShowFloatingDamageText (_damageAmount)
{
	var _damageText = instance_create_layer(attackTargetUnit.x, attackTargetUnit.y-DAMAGE_TEXT_Y_OFFSET, SYSTEM_LAYER, objFloatingDamageText);
	_damageText.text = "-"+string(_damageAmount);
}


function GetTypeAdvantage (_typeChart, _attackerType, _defenderType)
{
	return ds_grid_get(_typeChart, _defenderType-1, _attackerType-1);
}


// Get the damage multiplier with the given damage type
function GetTypeDamageMultiplier (_damageType)
{
	switch (_damageType)
	{
		case DamageType.NOT_VERY_EFFECTIVE:
			return NOT_VERY_EFFECTIVE_MULT;
		case DamageType.SUPER_EFFECTIVE:
			return SUPER_EFFECTIVE_MULT;
		default:
			return NORMAL_EFFECTIVE_MULT;
	}
}


// Returns the row of multipliers of the given attacker type
/*
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
*/

// Returns the column of weaknesses of the given defender type
/*
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
*/
