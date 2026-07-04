
#region cheats

	//input cheatcode
	if (keyboard_lastchar == "b") { keyboard_string = keyboard_lastchar; }
	if (keyboard_string == global.cheatCode)
	{
		global.cheatsOn = !global.cheatsOn;
		keyboard_string = "";
	}

	//cheat commands
	if (global.cheatsOn) {
		
		if (keyboard_check_pressed(vk_tab)) { global.showDebugUI = !global.showDebugUI; }
	}

#endregion

