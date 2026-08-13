
#region debugging

	if (global.showDebugUI)
	{
		draw_set_font(fntConsolas12);
		
		draw_text(10, 110, "Opponent: "+opponent.name);
		draw_text(10, 135, "Turn: "+string(currentTurn));
		draw_text(10, 150, "Whose Turn: "+string(whoseTurn));
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
		
		draw_text(700, 10, "Active Move Tiles:");
		for (var _i = 0; _i < ds_list_size(activeMoveTiles); _i++) {
			var _x = ds_list_find_value(activeMoveTiles, _i).mapX;
			var _y = ds_list_find_value(activeMoveTiles, _i).mapY;
			draw_text(700, (15*_i)+25, "{"+string(_x)+", "+string(_y)+"}");
		}
		
		draw_text(900, 10, "Active Attack Tiles:");
		for (var _i = 0; _i < ds_list_size(activeAttackTiles); _i++) {
			var _x = ds_list_find_value(activeAttackTiles, _i).mapX;
			var _y = ds_list_find_value(activeAttackTiles, _i).mapY;
			draw_text(900, (15*_i)+25, "{"+string(_x)+", "+string(_y)+"}");
		}
		
		if (selectedUnit != noone) {
			draw_text(10, 440, "Selected Unit: "+selectedUnit.name);
		}
		
		if (battleStateTemp == noone) { draw_text(10, 400, "Temp State: None"); }
		else { draw_text(10, 400, "Temp State: "+string(battleStateTemp)); }
		
		draw_text(10, 460, "Cur State: "+string(battleState));
	}

#endregion

DrawUnitInfoCards();
DrawMenus();
