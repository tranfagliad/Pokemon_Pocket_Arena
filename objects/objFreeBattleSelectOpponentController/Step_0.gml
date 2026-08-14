if (!global.midTransition)
{
	var _move = 0;
	if (instance_exists(objInputManager))
	{
	    if (objInputManager.pressed.right) { _move = 1; }
	    if (objInputManager.pressed.left) { _move = -1; }
		if (objInputManager.pressed.cancel) { TransitionStart(rmMainMenu, seqFadeOut, seqFadeIn) }
		if (objInputManager.pressed.select)
		{
			global.playerTwo = trainerData[selectedIndex];
			global.battleArena = arenaData[global.playerTwo.arena];
			global.opponentIsAI = true;
			
			// TODO: Change this to Pokemon Team Select Screen
			TransitionStart(global.battleArena.map, seqFadeOut, seqFadeIn);
		}
	
	}


	if (_move != 0)
	{
	    selectedIndex += _move;
    
	    if (selectedIndex < 0)
		{
	        selectedIndex = totalOpponents - 1;
	        visualIndex += totalOpponents;
	    }
	    else if (selectedIndex >= totalOpponents)
		{
	        selectedIndex = 0;
	        visualIndex -= totalOpponents;
	    }
	}

	visualIndex = lerp(visualIndex, selectedIndex, 0.15);

	if (abs(visualIndex - selectedIndex) > totalOpponents / 2)
	{
	    if (visualIndex < selectedIndex) visualIndex += totalOpponents;
	    else visualIndex -= totalOpponents;
	}
}
