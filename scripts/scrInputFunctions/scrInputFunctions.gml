
function GetButtonName(_action_name) 
{
    // Check if the input manager exists and if the player is actively using a gamepad
    if (!instance_exists(objInputManager) || !objInputManager.using_gamepad) 
    {
        if (_action_name == "select") return "[SPACE]";
        if (_action_name == "cancel") return "[ESCAPE]";
        return "[KEY]";
    }
    
    var _pad = objInputManager.gamepad_id;
    var _description = string_lower(gamepad_get_description(_pad));
    
    // An expanded list of terms that identify a PlayStation controller
    var _is_playstation = (
        string_pos("sony", _description) > 0 || 
        string_pos("playstation", _description) > 0 || 
        string_pos("wireless controller", _description) > 0 ||
        string_pos("dualshock", _description) > 0 ||
        string_pos("dualsense", _description) > 0 ||
        string_pos("ps4", _description) > 0 ||
        string_pos("ps5", _description) > 0
    );
    
    // Fallback: If you are using a tool like DS4Windows or Steam Input, 
    // it perfectly disguises the controller as an "Xbox 360 Controller". 
    // If the above still fails you during debugging, change this to true manually:
    var _force_playstation_prompts = false; 
    
    if (_is_playstation || _force_playstation_prompts) 
    {
        if (_action_name == "select") return "[X]";
        if (_action_name == "cancel") return "[O]";
    }
    else 
    {
        // Default Xbox/XInput layout
        if (_action_name == "select") return "[A]";
        if (_action_name == "cancel") return "[B]";
    }

    return "[BUTTON]";
}