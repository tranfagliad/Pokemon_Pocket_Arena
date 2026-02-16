// Look for controller
var _type = ds_map_find_value(async_load, EVENT_TYPE);
var _pad  = ds_map_find_value(async_load, PAD_INDEX);

switch(_type)
{
    case GAMEPAD_DISCOVERED:
        if (active_gamepad == -1)
		{
            active_gamepad = _pad;
            gamepad_set_axis_deadzone(_pad, deadzone);
        }
		break;

    case GAMEPAD_LOST:
        if (_pad == active_gamepad)
		{
            active_gamepad = -1;
        }
		break;
}
