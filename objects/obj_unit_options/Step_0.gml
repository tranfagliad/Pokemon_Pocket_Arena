
if (obj_input_manager.pressed.up) { current_option_id = current_option_id == 0 ? 0 : current_option_id - 1; }
if (obj_input_manager.pressed.down) { current_option_id = current_option_id == array_length(options)-1 ? current_option_id : current_option_id + 1; }


if (obj_input_manager.pressed.select) { option_selected = options[current_option_id]; }
