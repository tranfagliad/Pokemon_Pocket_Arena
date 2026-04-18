
// Handle Controller connect/disconnect
if (gamepad_id == GAMEPAD_DISCONNECTED)
{
    for (var _slot = SLOT_1; _slot <= SLOT_11; _slot++)
	{
        if (gamepad_is_connected(_slot))
		{
            gamepad_id = _slot;
            //show_debug_message("Gamepad Connected on slot "+string(_slot)+": "+gamepad_get_description(_slot));
            break;
        }
    }
}
else if (!gamepad_is_connected(gamepad_id))
{
    //show_debug_message("Gamepad Disconnected from slot "+string(gamepad_id));
    gamepad_id = GAMEPAD_DISCONNECTED;
}



// Reset input states every frame
for (var _key = 0; _key < array_length(input_keys); _key++)
{
	var _key_name = input_keys[_key];
	pressed[$ _key_name]  = false;
	held[$ _key_name]     = false;
	released[$ _key_name] = false;
}



// Keyboard Input Checks
for (var _key = 0; _key < array_length(input_keys); _key++)
{
	var _key_name = input_keys[_key];
	var _keybinds = input[$ _key_name];
	for (var _keybind = 0; _keybind < array_length(_keybinds); _keybind++)
	{
		var _bind = _keybinds[_keybind];
		if (keyboard_check(_bind))          { held[$ _key_name] = true; }
		if (keyboard_check_pressed(_bind))  { pressed[$ _key_name] = true; }
		if (keyboard_check_released(_bind)) { released[$ _key_name] = true; }
	}
}



// Gamepad Checks
if (gamepad_id >= SLOT_1)
{
	for (var _key = 0; _key < array_length(input_keys); _key++)
	{
		var _key_name = input_keys[_key];
		var _keybinds = input[$ _key_name];
		for (var _keybind = 0; _keybind < array_length(_keybinds); _keybind++)
		{
			var _bind = _keybinds[_keybind];
			if (gamepad_button_check(gamepad_id, _bind))          { held[$ _key_name] = true; }
			if (gamepad_button_check_pressed(gamepad_id, _bind))  { pressed[$ _key_name] = true; }
			if (gamepad_button_check_released(gamepad_id, _bind)) { released[$ _key_name] = true; }
		}
	}
	
	left_analog_x = gamepad_axis_value(gamepad_id, gp_axislh);
    left_analog_y = gamepad_axis_value(gamepad_id, gp_axislv);
}
