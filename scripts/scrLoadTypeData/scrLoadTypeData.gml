
function GetTypeChart ()
{
	var _typeChart = ds_grid_create(NUM_TYPES, NUM_TYPES);
	ds_grid_clear(_typeChart, DamageType.NORMAL_EFFECTIVE);
	
	#region NORMAL Rules
		
		SetTypeRule(_typeChart, Type.NORMAL, Type.ROCK, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.NORMAL, Type.GHOST, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.NORMAL, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region FIRE Rules
		
		SetTypeRule(_typeChart, Type.FIRE, Type.FIRE, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.WATER, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.GRASS, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.ICE, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.BUG, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.ROCK, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.DRAGON, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIRE, Type.STEEL, DamageType.SUPER_EFFECTIVE);
		
	#endregion
	
	#region WATER Rules
		
		SetTypeRule(_typeChart, Type.WATER, Type.FIRE, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.WATER, Type.WATER, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.WATER, Type.GRASS, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.WATER, Type.GROUND, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.WATER, Type.ROCK, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.WATER, Type.DRAGON, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region ELECTRIC Rules
		
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.WATER, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.ELECTRIC, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.GRASS, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.GROUND, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.FLYING, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ELECTRIC, Type.DRAGON, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region GRASS Rules
		
		SetTypeRule(_typeChart, Type.GRASS, Type.FIRE, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.WATER, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.GRASS, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.POISON, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.GROUND, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.FLYING, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.BUG, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.ROCK, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.DRAGON, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GRASS, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region ICE Rules
		
		SetTypeRule(_typeChart, Type.ICE, Type.FIRE, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.WATER, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.GRASS, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.ICE, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.GROUND, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.FLYING, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.DRAGON, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ICE, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region FIGHTING Rules
		
		SetTypeRule(_typeChart, Type.FIGHTING, Type.NORMAL, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.ICE, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.POISON, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.FLYING, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.PSYCHIC, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.BUG, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.ROCK, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.GHOST, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.DARK, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.STEEL, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FIGHTING, Type.FIGHTING, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region POISON Rules
		
		SetTypeRule(_typeChart, Type.POISON, Type.GRASS, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.POISON, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.GROUND, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.ROCK, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.GHOST, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.POISON, Type.FAIRY, DamageType.SUPER_EFFECTIVE);
		
	#endregion
	
	#region GROUND Rules
		
		SetTypeRule(_typeChart, Type.GROUND, Type.FIRE, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.ELECTRIC, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.GRASS, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.POISON, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.FLYING, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.BUG, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.ROCK, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GROUND, Type.STEEL, DamageType.SUPER_EFFECTIVE);
		
	#endregion
	
	#region FLYING Rules
		
		SetTypeRule(_typeChart, Type.FLYING, Type.ELECTRIC, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FLYING, Type.GRASS, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FLYING, Type.FIGHTING, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FLYING, Type.BUG, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FLYING, Type.ROCK, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FLYING, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region PSYCHIC Rules
		
		SetTypeRule(_typeChart, Type.PSYCHIC, Type.FIGHTING, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.PSYCHIC, Type.POISON, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.PSYCHIC, Type.PSYCHIC, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.PSYCHIC, Type.DARK, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.PSYCHIC, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region BUG Rules
		
		SetTypeRule(_typeChart, Type.BUG, Type.FIRE, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.GRASS, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.FIGHTING, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.POISON, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.FLYING, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.PSYCHIC, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.GHOST, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.DARK, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.BUG, Type.FAIRY, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region ROCK RULES
		
		SetTypeRule(_typeChart, Type.ROCK, Type.FIRE, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.ICE, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.FIGHTING, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.GROUND, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.FLYING, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.BUG, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.ROCK, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region GHOST Rules
		
		SetTypeRule(_typeChart, Type.GHOST, Type.NORMAL, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GHOST, Type.PSYCHIC, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GHOST, Type.GHOST, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.GHOST, Type.DARK, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region DRAGON Rules
		
		SetTypeRule(_typeChart, Type.DRAGON, Type.DRAGON, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DRAGON, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DRAGON, Type.FAIRY, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region DARK Rules
		
		SetTypeRule(_typeChart, Type.DARK, Type.FIGHTING, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DARK, Type.PSYCHIC, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DARK, Type.GHOST, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DARK, Type.DARK, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.DARK, Type.FAIRY, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	#region STEEL Rules
		
		SetTypeRule(_typeChart, Type.STEEL, Type.FIRE, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.WATER, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.ELECTRIC, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.ICE, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.ROCK, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.STEEL, Type.FAIRY, DamageType.SUPER_EFFECTIVE);
		
	#endregion
	
	#region FAIRY Rules
		
		SetTypeRule(_typeChart, Type.FAIRY, Type.FIRE, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FAIRY, Type.FIGHTING, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FAIRY, Type.POISON, DamageType.NOT_VERY_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FAIRY, Type.DRAGON, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FAIRY, Type.DARK, DamageType.SUPER_EFFECTIVE);
		SetTypeRule(_typeChart, Type.FAIRY, Type.STEEL, DamageType.NOT_VERY_EFFECTIVE);
		
	#endregion
	
	return _typeChart;
}



// Helper Functions

function SetTypeRule (_typeChart, _attackerType, _defenderType, _damageType)
{
	ds_grid_set(_typeChart, _defenderType-1, _attackerType-1, _damageType);
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
