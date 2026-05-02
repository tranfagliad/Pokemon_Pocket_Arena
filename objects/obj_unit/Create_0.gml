
// Map Coordinates
cell_x = 0;
cell_y = 0;

// Team
team = Team.ONE;

// Unit Stats
name = (team == Team.ONE) ? "Team1 Unit" : "Team2 Unit";
level = 1;
max_hp = 10;
current_hp = max_hp;
attack_stat = 1;
defense_stat = 1;
active_type = Type.NONE;
move_range = Range.NONE;
move_distance = 0;
attack_range = Range.NONE;
attack_distance = 0;

// Unit State
has_moved = false;
has_attacked = false;
