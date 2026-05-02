
switch (current_state)
{
    case BattleState.PLAYER_TURN_FREE:
        if (obj_input_manager.pressed.select && obj_battle_manager.unit_hovered)
        {
            obj_battle_manager.selected_unit = obj_battle_manager.current_cell.unit;
            current_state = BattleState.PLAYER_TURN_UNIT_OPTIONS;
			options_bubble = instance_create_layer(0, 0, SYSTEM_LAYER, obj_unit_options);
            show_debug_message(obj_battle_manager.selected_unit.name + " was selected, state changed -> PLAYER_TURN_UNIT_OPTIONS");
			
        }
        break;



    case BattleState.PLAYER_TURN_UNIT_OPTIONS:
        if (obj_input_manager.pressed.cancel)
        {
            obj_battle_manager.selected_unit = noone;
            current_state = BattleState.PLAYER_TURN_FREE;
			instance_destroy(options_bubble);
            show_debug_message("Unit unselected, state changed -> PLAYER_TURN_FREE");
			break;
        }
		switch (options_bubble.option_selected)
		{
			case OPTIONS_BOX_MOVE.index:
				show_debug_message("Selected: Move, state changed -> PLAYER_TURN_MOVE");
				instance_destroy(options_bubble);
				current_state = BattleState.PLAYER_TURN_MOVE;
				break;
			case OPTIONS_BOX_ATTACK.index:
				show_debug_message("Selected: Attack, state changed -> PLAYER_TURN_ATTACK");
				instance_destroy(options_bubble);
				current_state = BattleState.PLAYER_TURN_ATTACK;
				break;
			case OPTIONS_BOX_DETAILS.index:
				show_debug_message("Selected: Details, state changed -> PLAYER_TURN_DETAILS");
				instance_destroy(options_bubble);
				current_state = BattleState.PLAYER_TURN_DETAILS;
				break;
			case OPTIONS_BOX_CANCEL.index:
				obj_battle_manager.selected_unit = noone;
				current_state = BattleState.PLAYER_TURN_FREE;
				instance_destroy(options_bubble);
				show_debug_message("Selected: Cancel, state changed -> PLAYER_TURN_FREE");
				break;
			default: break;
		}
        break;
	
	
	
	case BattleState.PLAYER_TURN_MOVE:
		if (obj_input_manager.pressed.cancel)
        {
            obj_cursor.x = obj_battle_manager.selected_unit.x;
            obj_cursor.y = obj_battle_manager.selected_unit.y;
            obj_cursor.cell_x = obj_battle_manager.selected_unit.cell_x;
            obj_cursor.cell_y = obj_battle_manager.selected_unit.cell_y;
            
            current_state = BattleState.PLAYER_TURN_UNIT_OPTIONS;
			options_bubble = instance_create_layer(0, 0, SYSTEM_LAYER, obj_unit_options);
            show_debug_message("State changed -> PLAYER_TURN_UNIT_OPTIONS");
        }
		break;
	
	
	
	case BattleState.PLAYER_TURN_ATTACK:
		if (obj_input_manager.pressed.cancel)
        {
            obj_cursor.x = obj_battle_manager.selected_unit.x;
            obj_cursor.y = obj_battle_manager.selected_unit.y;
            obj_cursor.cell_x = obj_battle_manager.selected_unit.cell_x;
            obj_cursor.cell_y = obj_battle_manager.selected_unit.cell_y;
            
            current_state = BattleState.PLAYER_TURN_UNIT_OPTIONS;
			options_bubble = instance_create_layer(0, 0, SYSTEM_LAYER, obj_unit_options);
            show_debug_message("State changed -> PLAYER_TURN_UNIT_OPTIONS");
        }
		break;
		
	
	
	case BattleState.PLAYER_TURN_DETAILS:
		if (obj_input_manager.pressed.cancel)
        {
			current_state = BattleState.PLAYER_TURN_UNIT_OPTIONS;
			options_bubble = instance_create_layer(0, 0, SYSTEM_LAYER, obj_unit_options);
            show_debug_message("State changed -> PLAYER_TURN_UNIT_OPTIONS");
		}
		break;
	
	
	
	default: break;
}
