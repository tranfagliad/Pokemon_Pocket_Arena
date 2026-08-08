
#region zoom in / out
	
	if (objInputManager.pressed.zoom_in)  { targetZoom = CAMERA_DEFAULT_ZOOM; }
	if (objInputManager.pressed.zoom_out) { targetZoom = CAMERA_ZOOM_OUT; }
	currentZoomLevel = lerp(currentZoomLevel, targetZoom, CAMERA_ZOOM_SPEED);
	var _current_width = VIEWPORT_WIDTH * currentZoomLevel;
	var _current_height = VIEWPORT_HEIGHT*currentZoomLevel;
	camera_set_view_size(view_camera[FIRST_VIEW], _current_width, _current_height);
	
#endregion

#region pan camera
	
	x = lerp(x, followTarget.x, CAMERA_PAN_SPEED);
	y = lerp(y, followTarget.y, CAMERA_PAN_SPEED);
	var _camX = x - (_current_width / 2);
	var _camY = y - (_current_height / 2);
	
#endregion

#region screen shake
	
	if (screenIsShaking)
	{
		_camX += random_range(-shakeRemain, shakeRemain);
	    _camY += random_range(-shakeRemain, shakeRemain);
	
		shakeRemain -= shakeDecay;
	
		if (shakeRemain <= 0)
	    {
	        shakeRemain = 0;
	        screenIsShaking = false;
	    }
	}
	
#endregion

camera_set_view_pos(view_camera[FIRST_VIEW], _camX, _camY);
