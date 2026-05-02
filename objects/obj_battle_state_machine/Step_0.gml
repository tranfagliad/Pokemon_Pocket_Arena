switch (current_state)
{
    case BattleState.PLAYER_TURN_FREE:
        if (obj_input_manager.pressed.select && obj_battle_manager.unit_hovered)
        {
            obj_battle_manager.selected_unit = obj_battle_manager.current_cell.unit;
            current_state = BattleState.PLAYER_TURN_UNIT_OPTIONS;
            show_debug_message(obj_battle_manager.selected_unit.name + " was selected, state changed -> UNIT_OPTIONS");
        }
        break;

    case BattleState.PLAYER_TURN_UNIT_OPTIONS:
        if (obj_input_manager.pressed.cancel)
        {
            if (obj_battle_manager.selected_unit != noone)
            {
                obj_cursor.x = obj_battle_manager.selected_unit.x;
                obj_cursor.y = obj_battle_manager.selected_unit.y;
                obj_cursor.cell_x = obj_battle_manager.selected_unit.cell_x;
                obj_cursor.cell_y = obj_battle_manager.selected_unit.cell_y;
            }
            obj_battle_manager.selected_unit = noone;
            current_state = BattleState.PLAYER_TURN_FREE;
            show_debug_message("Unit unselected, state changed -> PLAYER_TURN_FREE");
        }
        break;
}