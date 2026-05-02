
current_option_id = 0;


var _unit_options = [
	OPTIONS_BOX_MOVE,
	OPTIONS_BOX_ATTACK,
	OPTIONS_BOX_DETAILS,
	OPTIONS_BOX_CANCEL
];
var _opponent_options = [
	OPTIONS_BOX_DETAILS,
	OPTIONS_BOX_CANCEL
];
options = (obj_battle_manager.selected_unit.team == Team.ONE) ? _unit_options : _opponent_options;
options_box_height = (obj_battle_manager.selected_unit.team == Team.ONE) ? OPTIONS_BOX_TEAM_ONE_HEIGHT : OPTIONS_BOX_TEAM_TWO_HEIGHT;


option_selected = -1;
