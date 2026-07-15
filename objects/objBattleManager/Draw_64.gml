
#region debugging

	if (global.showDebugUI)
	{
		draw_text(10, 110, "Opponent: "+opponent.name);
		draw_text(10, 135, "Turn: "+string(currentTurn));
		draw_text(10, 225, "Arena: "+mapName);
	
		draw_text(300, 10, "Team One:")
		for (var _i = 0; _i < ds_list_size(teamOneUnits); _i++) {
			draw_text(300, (15*_i)+25, ds_list_find_value(teamOneUnits, _i).name);
		}
		if (ds_list_empty(teamOneUnits)) {
			draw_text(300, 25, "Empty");
		}
	
		draw_text(500, 10, "Team Two:")
		for (var _i = 0; _i < ds_list_size(teamTwoUnits); _i++) {
			draw_text(500, (15*_i)+25, ds_list_find_value(teamTwoUnits, _i).name);
		}
		if (ds_list_empty(teamTwoUnits)) {
			draw_text(500, 25, "Empty");
		}
	}

#endregion

drawUnitInfoCard();
