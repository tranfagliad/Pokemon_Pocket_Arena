
function MainMenuStateFree ()
{
	var _move = objInputManager.pressed.down - objInputManager.pressed.up;
	
	if (_move != 0)
    {
        menuIndex += _move;
        if (menuIndex < 0) { menuIndex = menuLength - 1; }
        if (menuIndex >= menuLength)  { menuIndex = 0; }
    }
	
	if (objInputManager.pressed.select)
    {
        switch (menuIndex)
        {
            case MainMenuOptions.CAMPAIGN:
                //show_debug_message("Campaign Selected!");
                break;
                
            case MainMenuOptions.FREE_BATTLE:
                //show_debug_message("Free Battle Selected!");
				TransitionStart(rmFreeBattleSelectOpponent, seqFadeOut, seqFadeIn);
                break;
                
            case MainMenuOptions.SETTINGS:
                //show_debug_message("Settings Selected!");
                break;
        }
    }
}








