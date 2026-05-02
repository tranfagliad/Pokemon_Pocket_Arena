
function unit_to_string (_unit)
{
	var _unit_string = "";
	_unit_string += _unit.name;
	return _unit_string;
}



function calculate_unit_hp (_unit_level, _unit_base_hp)
{
	return floor((2 * _unit_base_hp * _unit_level) / 100) + _unit_base_hp + 10;
}



function calculate_unit_stat (_unit_level, _unit_base_stat)
{
	return floor((2 * _unit_base_stat * _unit_level) / 100) + 5;
}
