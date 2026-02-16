// Info Card fade in / out
card_alpha = 0;
card_fade_speed = 0.2;
last_unit_seen = noone;




team_one = [
	{
		name: "Bulbasaur",
		level: 10,
		curr_hp: 32,
		max_hp: 32,
		attack: 30,
		defense: 34,
		type_1: Type.GRASS,
		type_2: Type.POISON,
		movement_type: Range.STRAIGHT,
		movement_distance: 2,
		attack_type: Range.STRAIGHT,
		attack_distance: 2
	},
	{
		name: "Magmar",
		level: 17,
		curr_hp: 66,
		max_hp: 66,
		attack: 54,
		defense: 40,
		type_1: Type.FIRE,
		type_2: Type.NONE,
		movement_type: Range.STRAIGHT,
		movement_distance: 2,
		attack_type: Range.STRAIGHT,
		attack_distance: 3
	},
	{
		name: "Electabuzz",
		level: 20,
		curr_hp: 56,
		max_hp: 56,
		attack: 60,
		defense: 45,
		type_1: Type.ELECTRIC,
		type_2: Type.NONE,
		movement_type: Range.STRAIGHT,
		movement_distance: 2,
		attack_type: Range.DIAGONAL,
		attack_distance: 3
	}
];




team_two = [
	{
		name: "Bulbasaur",
		level: 10,
		curr_hp: 26,
		max_hp: 32,
		attack: 30,
		defense: 34,
		type_1: Type.GRASS,
		type_2: Type.POISON,
		movement_type: Range.STRAIGHT,
		movement_distance: 2,
		attack_type: Range.STRAIGHT,
		attack_distance: 2
	},
	{
		name: "Magmar",
		level: 17,
		curr_hp: 33,
		max_hp: 66,
		attack: 54,
		defense: 40,
		type_1: Type.FIRE,
		type_2: Type.NONE,
		movement_type: Range.STRAIGHT,
		movement_distance: 2,
		attack_type: Range.STRAIGHT,
		attack_distance: 3
	},
	{
		name: "Electabuzz",
		level: 20,
		curr_hp: 10,
		max_hp: 56,
		attack: 60,
		defense: 45,
		type_1: Type.ELECTRIC,
		type_2: Type.NONE,
		movement_type: Range.STRAIGHT,
		movement_distance: 2,
		attack_type: Range.DIAGONAL,
		attack_distance: 3
	}
];
















var _start_x = 5;
var _start_y = 5;
var _spacing = 2;
for (var i = 0; i < array_length(team_one); i++)
{
    var _gx = _start_x;
    var _gy = _start_y + (i * _spacing);
    var _px = (_gx * TILE_SIZE) + CENTER_TILE;
    var _py = (_gy * TILE_SIZE) + CENTER_TILE;
    
    var _inst = instance_create_layer(_px, _py, UNITS_LAYER, obj_battle_arena_unit);
    
    _inst.stats = team_one[i];
    _inst.grid_x = _gx;
    _inst.grid_y = _gy;
    _inst.team = TEAM_ONE;
    
	_inst.sprite_index = spr_placeholder_unit_blue;
}






_start_x = 14;
_start_y = 12;
for (var i = 0; i < array_length(team_two); i++)
{
    var _gx = _start_x;
    var _gy = _start_y + (i * _spacing);
    var _px = (_gx * TILE_SIZE) + CENTER_TILE;
    var _py = (_gy * TILE_SIZE) + CENTER_TILE;
    
    var _inst = instance_create_layer(_px, _py, UNITS_LAYER, obj_battle_arena_unit);
    
    _inst.stats = team_two[i];
    _inst.grid_x = _gx;
    _inst.grid_y = _gy;
    _inst.team = TEAM_TWO;
    
	_inst.sprite_index = spr_placeholder_unit_red;
}








