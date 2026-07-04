
if (objInputManager.pressed.up) { current_option_id = current_option_id == 0 ? 0 : current_option_id - 1; }
if (objInputManager.pressed.down) { current_option_id = current_option_id == array_length(options)-1 ? current_option_id : current_option_id + 1; }


if (objInputManager.pressed.select) { option_selected = options[current_option_id].index; }
