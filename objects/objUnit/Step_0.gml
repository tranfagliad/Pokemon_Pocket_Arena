
#region color blend for enabled/disabled

	if (isEnabled) { colorBlend = lerp(colorBlend, UNIT_ENABLED_BLEND, UNIT_BLEND_TRANSITION_SPEED); }
	else { colorBlend = lerp(colorBlend, UNIT_DISABLED_BLEND, UNIT_BLEND_TRANSITION_SPEED); }

#endregion

#region 8-direction animation loop
	
	var _framesPerDir = sprite_get_number(sprite_index) / UNIT_DIRECTIONS;
	var _startFrame   = facingDirection * _framesPerDir;
	var _endFrame     = _startFrame + _framesPerDir;
	
	if (image_index < _startFrame || image_index >= _endFrame) 
	{
		var _relativeFrame = image_index % _framesPerDir;
		image_index = _startFrame + _relativeFrame; 
	}
	
#endregion
