
// Team Lists
team1_units = ds_list_create();
team2_units = ds_list_create();

// Initialize Map
map = ds_grid_create(MAP_WIDTH, MAP_HEIGHT);
ds_grid_clear(map, { terrain: noone, unit: noone });

current_turn = 1;

current_cell = get_current_cell(map, obj_cursor.cell_x, obj_cursor.cell_y);
unit_hovered = false;






// Team 1
create_and_register_unit({team: Team.ONE, name: "Pikachu", cell_x: 6, cell_y: 8, current_hp: 5, active_type: Type.ELECTRIC, move_range: Range.DIAGONAL, move_distance: 3, attack_range: Range.STRAIGHT, attack_distance: 2}, team1_units, map);
create_and_register_unit({team: Team.ONE, name: "Bulbasaur", cell_x: 8, cell_y: 10, current_hp: 4, active_type: Type.GRASS, move_range: Range.STRAIGHT, move_distance: 2, attack_range: Range.STRAIGHT, attack_distance: 2}, team1_units, map);

// Team 2
create_and_register_unit({team: Team.TWO, name: "Charmander", cell_x: 18, cell_y: 8, current_hp: 3, active_type: Type.FIRE, move_range: Range.STRAIGHT, move_distance: 2, attack_range: Range.STRAIGHT, attack_distance: 2}, team2_units, map);
create_and_register_unit({team: Team.TWO, name: "Squirtle", cell_x: 16, cell_y: 12, current_hp: 2, active_type: Type.WATER, move_range: Range.STRAIGHT, move_distance: 2, attack_range: Range.STRAIGHT, attack_distance: 2}, team2_units, map);

//print_map(map);
//print_team(team1_units);
//print_team(team2_units);
//show_debug_message(map_to_json(map));
