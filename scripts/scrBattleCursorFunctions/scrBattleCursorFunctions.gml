
// Give (x, y) coordinates and the cursor will move to the corresponding cell on the map
function MoveBattleCursor (_x, _y)
{
	objBattleCursor.x = _x;
	objBattleCursor.y = _y;
	objBattleCursor.mapX = _x div CELL_SIZE;
	objBattleCursor.mapY = _y div CELL_SIZE;
}
