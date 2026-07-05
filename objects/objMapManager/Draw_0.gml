
if (global.showDebugUI)
{
	for (var _row = 0; _row < mapWidth; _row++)
	{
		for (var _col = 0; _col < mapHeight; _col++)
		{
			draw_text(_col*CELL_SIZE, _row*CELL_SIZE, "T: {}\nU: {}");
		}
	}
}
