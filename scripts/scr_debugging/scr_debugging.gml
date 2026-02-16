// Print debug messages in a way that is easy to search
function print_debug_msg (_debug_msg)
{
	if (datatype_of(_debug_msg) != DataType.STRING)
	{
		show_debug_message("DEBUG: --ERROR-- The provided debug message is NOT a string");
		exit;
	}
	show_debug_message("DEBUG: "+_debug_msg);
}
