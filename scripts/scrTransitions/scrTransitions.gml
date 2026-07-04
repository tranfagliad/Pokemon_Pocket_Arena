
global.midTransition = false;
global.targetRoom = noone;


// Create a transition
function TransitionCreateSequence (_transition_type)
{
	if (layer_exists(TRANSITION_LAYER)) { layer_destroy(TRANSITION_LAYER); }
	var _layer = layer_create(MAX_DEPTH, TRANSITION_LAYER);
	layer_sequence_create(_layer, 0, 0, _transition_type);
}


// Run the transition
function TransitionStart (_target_room, _transition_type_out, _transition_type_in)
{
	if (!global.midTransition)
	{
		global.midTransition = true;
		global.targetRoom = _target_room;
		TransitionCreateSequence(_transition_type_out);
		layer_set_target_room(_target_room);
		TransitionCreateSequence(_transition_type_in);
		layer_reset_target_room();
		return true;
	}
	else { return false; }
}


// Change room during transition
function TransitionChangeRoom ()
{
	room_goto(global.targetRoom);
}


// Called at the end of the transition
function TransitionFinished ()
{
	layer_sequence_destroy(self.elementID);
	global.midTransition = false;
}
