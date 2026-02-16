// Find Gamepad
if (active_gamepad == -1)
{
    for (var i = 0; i < 8; i++)
	{
        if (gamepad_is_connected(i))
		{
            active_gamepad = i;
            gamepad_set_axis_deadzone(i, deadzone);
            break;
        }
    }
}



// Keyboard Inputs
move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));   // Horizontal cursor move
move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));   // Vertical cursor move
key_zoom_in  = keyboard_check_pressed(ord("I"));                // Zoom in camera
key_zoom_out = keyboard_check_pressed(ord("O"));                // Zoom out camera
//key_select   = keyboard_check_pressed(vk_space);



// Controller Inputs
if (active_gamepad != -1 && gamepad_is_connected(active_gamepad))
{
    var _gh = gamepad_axis_value(active_gamepad, gp_axislh);
    var _gv = gamepad_axis_value(active_gamepad, gp_axislv);
    
    if (abs(_gh) > deadzone) { move_x = _gh; }
    if (abs(_gv) > deadzone) { move_y = _gv; }
    
    if (gamepad_button_check_pressed(active_gamepad, gp_shoulderr)) { key_zoom_in = true; }
    if (gamepad_button_check_pressed(active_gamepad, gp_shoulderl)) { key_zoom_out = true; }
    //if (gamepad_button_check_pressed(active_gamepad, gp_face1))     key_select = true;
}
