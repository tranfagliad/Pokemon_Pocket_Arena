
if (global.showDebugUI)
{
	draw_text(10, 110, "Opponent: "+global.opponent.name);
	
	draw_text(10, 135, "Turn: "+string(currentTurn));
	
	draw_text(300, 10, "Team One:")
	for (var _i = 0; _i < array_length(teamOneUnits); _i++) {
		draw_text(300, (15*_i)+25, array_get(teamOneUnits, _i).name);
	}
	
	draw_text(500, 10, "Team Two:")
	for (var _i = 0; _i < array_length(teamTwoUnits); _i++) {
		draw_text(500, (15*_i)+25, array_get(teamTwoUnits, _i).name);
	}
}
