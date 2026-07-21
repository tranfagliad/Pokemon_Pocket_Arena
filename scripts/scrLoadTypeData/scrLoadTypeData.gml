
function GetTypeChart ()
{
	var _typeChart = ds_grid_create(NUM_TYPES, NUM_TYPES);
	ds_grid_clear(_typeChart, NORMAL_EFFECTIVE);
	
	#region NORMAL Rules
	
		SetTypeRule(_typeChart, Type.NORMAL, Type.ROCK, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.NORMAL, Type.GHOST, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.NORMAL, Type.STEEL, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region FIRE Rules
	
		SetTypeRule(_typeChart, Type.FIRE, Type.FIRE, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.WATER, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.GRASS, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.ICE, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.BUG, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.ROCK, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.DRAGON, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.STEEL, SUPER_EFFECTIVE);
	
	#endregion
	
	#region WATER Rules
	
		SetTypeRule(_typeChart, Type.WATER, Type.FIRE, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.WATER, Type.WATER, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.WATER, Type.GRASS, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.WATER, Type.GROUND, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.WATER, Type.ROCK, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.WATER, Type.DRAGON, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region ELECTRIC Rules
	
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.WATER, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.ELECTRIC, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.GRASS, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.GROUND, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.FLYING, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.DRAGON, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region GRASS Rules
	
		SetTypeRule(_typeChart, Type.GRASS, Type.FIRE, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.WATER, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.GRASS, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.POISON, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.GROUND, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.FLYING, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.BUG, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.ROCK, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.DRAGON, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.STEEL, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region ICE Rules
	
		SetTypeRule(_typeChart, Type.ICE, Type.FIRE, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.WATER, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.GRASS, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.ICE, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.GROUND, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.FLYING, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.DRAGON, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.STEEL, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region FIGHTING Rules
	
		SetTypeRule(_typeChart, Type.FIGHTING, Type.NORMAL, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.ICE, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.POISON, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.FLYING, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.PSYCHIC, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.BUG, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.ROCK, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.GHOST, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.DARK, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.STEEL, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.FIGHTING, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region POISON Rules
	
		SetTypeRule(_typeChart, Type.POISON, Type.GRASS, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.POISON, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.GROUND, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.ROCK, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.GHOST, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.STEEL, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.FAIRY, SUPER_EFFECTIVE);
	
	#endregion
	
	#region GROUND Rules
	
		SetTypeRule(_typeChart, Type.GROUND, Type.FIRE, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.ELECTRIC, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.GRASS, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.POISON, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.FLYING, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.BUG, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.ROCK, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.STEEL, SUPER_EFFECTIVE);
	
	#endregion
	
	#region FLYING Rules
	
		SetTypeRule(_typeChart, Type.FLYING, Type.ELECTRIC, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FLYING, Type.GRASS, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FLYING, Type.FIGHTING, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FLYING, Type.BUG, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FLYING, Type.ROCK, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FLYING, Type.STEEL, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region PSYCHIC Rules
	
		SetTypeRule(_typeChart, Type.PSYCHIC, Type.FIGHTING, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.PSYCHIC, Type.POISON, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.PSYCHIC, Type.PSYCHIC, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.PSYCHIC, Type.DARK, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.PSYCHIC, Type.STEEL, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region BUG Rules
	
		SetTypeRule(_typeChart, Type.BUG, Type.FIRE, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.GRASS, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.FIGHTING, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.POISON, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.FLYING, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.PSYCHIC, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.GHOST, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.DARK, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.STEEL, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.FAIRY, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region ROCK RULES
	
		SetTypeRule(_typeChart, Type.ROCK, Type.FIRE, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.ICE, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.FIGHTING, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.GROUND, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.FLYING, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.BUG, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.STEEL, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region GHOST Rules
	
		SetTypeRule(_typeChart, Type.GHOST, Type.NORMAL, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GHOST, Type.PSYCHIC, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GHOST, Type.GHOST, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GHOST, Type.DARK, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region DRAGON Rules
	
		SetTypeRule(_typeChart, Type.DRAGON, Type.DRAGON, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DRAGON, Type.STEEL, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DRAGON, Type.FAIRY, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region DARK Rules
	
		SetTypeRule(_typeChart, Type.DARK, Type.FIGHTING, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DARK, Type.PSYCHIC, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DARK, Type.GHOST, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DARK, Type.DARK, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DARK, Type.FAIRY, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	#region STEEL Rules
	
		SetTypeRule(_typeChart, Type.STEEL, Type.FIRE, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.WATER, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.ELECTRIC, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.ICE, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.ROCK, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.STEEL, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.FAIRY, SUPER_EFFECTIVE);
	
	#endregion
	
	#region FAIRY Rules
	
		SetTypeRule(_typeChart, Type.FAIRY, Type.FIRE, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FAIRY, Type.FIGHTING, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FAIRY, Type.POISON, NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FAIRY, Type.DRAGON, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FAIRY, Type.DARK, SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FAIRY, Type.STEEL, NOT_VERY_EFFECTIVE);
	
	#endregion
	
	return _typeChart;
}


// Accesses the type chart in a way that accomodates Type.NONE in the enum
function GetTypeAdvantageMultiplier (_typeChart, _attackerType, _defenderType)
{
	return ds_grid_get(_typeChart, _defenderType-1, _attackerType-1);
}


// Returns the row of multipliers of the given attacker type
function GetTypeAttackerMultipliers (_typeChart, _attackerType)
{
	if (_attackerType == Type.NONE) { return noone; }
	
	var _multipliers = array_create(NUM_TYPES+1, NORMAL_EFFECTIVE);
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
	
	var _multipliers = array_create(NUM_TYPES + 1, NORMAL_EFFECTIVE);
	for (var _row = 0; _row < NUM_TYPES; _row++)
	{
		var _targetAttackerType = _row + 1;
		_multipliers[_targetAttackerType] = GetTypeAdvantageMultiplier(_typeChart, _targetAttackerType, _defenderType);
	}
	return _multipliers;
}



// Helper Functions

function SetTypeRule (_typeChart, _attackerType, _defenderType, _multiplier)
{
	ds_grid_set(_typeChart, _defenderType-1, _attackerType-1, _multiplier);
}

function GetTypeChartStr (_typeChart)
{
    var _numRows = ds_grid_height(_typeChart);
    var _numCols = ds_grid_width(_typeChart);
    var _str = "";
    
    for (var _y = 0; _y < _numRows; _y++)
    {
        for (var _x = 0; _x < _numCols; _x++)
        {
            _str += string(ds_grid_get(_typeChart, _x, _y)) + " ";
        }
        _str += "\n";
    }
    return _str;
}
