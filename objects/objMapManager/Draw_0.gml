
if (global.showDebugUI)
{
	for (var _row = 0; _row < global.battleArena.width; _row++)
	{
		for (var _col = 0; _col < global.battleArena.height; _col++)
		{
			draw_text(_col*CELL_SIZE, _row*CELL_SIZE, "T: {}\nU: {}");
		}
	}
}
