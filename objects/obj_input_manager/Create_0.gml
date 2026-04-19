/**
 * README: To detect inputs, use the input map. They are all booleans.
 * 
 * obj_input_manager.pressed.
 *     move_up, move_down, etc.
 * 
 * obj_input_manager.held.
 *     move_up, move_down, etc.
 * 
 * obj_input_manager.released.
 *     move_up, move_down, etc.
 */

input = {
	// Arrow Keys, WASD, gamepad directional buttons
	up:    [ vk_up,    W_KEY, gp_padu ],
	down:  [ vk_down,  S_KEY, gp_padd ],
	left:  [ vk_left,  A_KEY, gp_padl ],
	right: [ vk_right, D_KEY, gp_padr ],
	
	sprint: [ vk_shift, gp_face3 ],
	
	confirm: [ vk_space,  gp_face1 ],   // A on XBox, X on Playstation
	cancel:  [ vk_escape, gp_face2 ],   // B on XBox, Circle on Playstation
	
	zoom_in:  [ I_KEY, gp_shoulderl ],
	zoom_out: [ O_KEY, gp_shoulderr ],
};
input_keys = variable_struct_get_names(input);

// Left analog stick
left_analog_x = 0;
left_analog_y = 0;



gamepad_id = GAMEPAD_DISCONNECTED;
gamepad_deadzone = DEFAULT_DEADZONE;



// Input States (Updated every frame)
pressed  = {};
held     = {};
released = {};

for (var _key = 0; _key < array_length(input_keys); _key++)
{
    var _name = input_keys[_key];
    pressed[$ _name]  = false;
    held[$ _name]     = false;
    released[$ _name] = false;
}
