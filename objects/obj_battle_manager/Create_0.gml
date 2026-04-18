
team1_units = ds_list_create();
team2_units = ds_list_create();

current_turn = 0;





var unit = instance_create_layer(0, 0, "Units", obj_unit);
unit.team = 1;
unit.cell_x = 6;
unit.cell_y = 8;
unit.name = "Pikachu";

unit = instance_create_layer(0, 0, "Units", obj_unit);
unit.team = 1;
unit.cell_x = 8;
unit.cell_y = 10;
unit.name = "Bulbasuar";





unit = instance_create_layer(0, 0, "Units", obj_unit);
unit.team = 2;
unit.cell_x = 18;
unit.cell_y = 8;
unit.name = "Charmander";

unit = instance_create_layer(0, 0, "Units", obj_unit);
unit.team = 2;
unit.cell_x = 16;
unit.cell_y = 12;
unit.name = "Squirtle";


