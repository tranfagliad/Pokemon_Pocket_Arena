
function calculate_damage (_attacker_level, _attacker_attack_stat, _defender_defense_stat)
{
	return (((((2 * _attacker_level) / 5) + 2) * (_attacker_attack_stat / _defender_defense_stat)) / 50) + 2;
}
