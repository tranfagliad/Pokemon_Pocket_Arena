
#region debugging

	if (global.showDebugUI)
	{
		draw_text(10, 10, "Cursor Speed: { "+string(cursorSpeed)+" }");
		draw_text(10, 25, "Cursor X: { "+string(x)+" }");
		draw_text(10, 40, "Cursor Y: { "+string(y)+" }");
		draw_text(10, 55, "Map X: { "+string(mapX)+" }");
		draw_text(10, 70, "Map Y: { "+string(mapY)+" }");
		
		draw_text(10, 480, string(cursorState));
	}

#endregion



