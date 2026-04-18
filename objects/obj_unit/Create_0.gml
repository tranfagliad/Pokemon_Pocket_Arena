
team = 1;

cell_x = 0;
cell_y = 0;

max_hp = 100;
current_hp = max_hp;

name = (team == 1) ? "Ally Unit" : "Enemy Unit";






if (instance_exists(obj_battle_manager))
{
	if (team == 1) { ds_list_add(obj_battle_manager.team1_units, id); }
	else { ds_list_add(obj_battle_manager.team2_units, id); }
}
